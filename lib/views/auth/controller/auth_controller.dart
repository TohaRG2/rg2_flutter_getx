import 'dart:io';

import 'package:apple_sign_in_safety/apple_sign_in.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rg2/controllers/connection_controller.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/database/cloud_database.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/main_view.dart';

class AuthController extends GetxController {
  final ConnectionController _connection = Get.find();

  final _sp = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  /// Observable переменная, в которой храним данные об авторизации пользователя
  /// null - если не авторизован
  final Rx<User> _firebaseUser = Rx<User>(null);
    Rx<User> get firebaseUser => _firebaseUser;
    User get user => _firebaseUser.value;
    //set _user(value) => _firebaseUser.value = value;

  /// Нужно ли показывать диалог логина (true, пока не нажата кнопка "больше не показывать")
  bool _needShowSignInView = true;

  /// Счетчик локальных входов
  int localEnterCounts = 0;

  /// Вычисляем необходимость отображения диалога входа при входе в программу
  /// если пользователь еще не вошел или не подтвердил email, но и не нажимал "больше не показывать",
  /// и интернет на устройстве в принципе доступен, то true
  get showSignInDialog {
    bool isUserAuthenticated = (user != null);
    if (isUserAuthenticated) {
      isUserAuthenticated = user.emailVerified;
    }
    bool isInternetAvailable = _connection.connection != ConnectivityResult.none;
    return _needShowSignInView && !isUserAuthenticated && isInternetAvailable;
  }

  /// Введеное имя пользователя
  TextEditingController nameController = TextEditingController();

  /// Введенный email
  TextEditingController emailController = TextEditingController();

  /// Введенный пароль
  TextEditingController passwordController = TextEditingController();

  /// Отображение прелоадера
  RxBool _showPreLoader = false.obs;
  bool get showPreLoader => _showPreLoader.value;

  @override
  onInit() {
    logPrint("onInit - AuthController");
    super.onInit();
    // Биндим стрим в Observable _firebaseUser и подписываемся на его изменения
    //_firebaseUser.bindStream(_auth.authStateChanges());
    // bool isUserLoggedIn = _auth.currentUser?.emailVerified ?? false;
    // _firebaseUser.value = (isUserLoggedIn) ? _auth.currentUser : null;

    // Слушаем поток авторизации юзера, если юзер авторизовался и email подтвержден, то записываем его в
    // _firebaseUser иначе null
    _auth.authStateChanges().listen((_user) {
      logPrint("AuthController - изменились данные в auth ${_user?.email} ${_user?.emailVerified}");
      if (_user?.email != null && (_user?.emailVerified ?? false)) {
        logPrint("AuthController - allOK");
        _firebaseUser.value = _user;
        setCurrentUserNameToEditor();
      } else {
        logPrint("AuthController - что не так с авторизацией, пишем null");
        _firebaseUser.value = null;
      }
    });
    _needShowSignInView = _sp.read(Const.IS_FIREBASE_ENTER_ENABLED) ?? true;
    _updateLocalEnterCounts();
  }

  @override
  onClose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  void _updateLocalEnterCounts() {
    localEnterCounts = _sp.read(Const.LOCAL_STARTS_COUNT) ?? 0;
    localEnterCounts++;
    _sp.write(Const.LOCAL_STARTS_COUNT, localEnterCounts);
  }

  void setCurrentUserNameToEditor() {
    nameController.text = user.displayName;
  }

  Future<void> changeUserNameTo({String name}) async{
    var displayName = name;
    if (displayName == null) {
      displayName = nameController.text;
    }
    var _user = _auth.currentUser;
    await _user.updateDisplayName(displayName);
    await _user.reload();
    _firebaseUser.value = _auth.currentUser;
    await CloudDatabase().createOrUpdateUser(user);
    logPrint("UserName changed to - ${user.displayName}");
  }

  Future<void> googleSignInAndGoToStart() async {
    await googleSignIn();
    logPrint("googleSignInAndGoToStart - ${user.displayName}");
    if (user != null) {
      logPrint("googleSignInAndGoToStart - Переходим на основной экран");
      goToMainPage();
    }
  }

  Future<void> goToMainPage() async {
    if (Platform.isAndroid) {
      Get.offNamed("/main");
    } else {
      Get.toNamed("/main");
    }
  }

  /// Авторизация через гугл
  Future<void> googleSignIn() async {
    try {
      //logPrint("вызываем окно входа гугл аккаунтом");
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      _showPreLoader.value = true;
      if (googleUser != null) {
        logPrint("аутентификация пользователем ${googleUser.displayName} прошла");
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        //logPrint("Получаем данные пользователя для аутентификации в firebase");
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        //logPrint("singin with credential");
        UserCredential _authResult = await _auth.signInWithCredential(credential);

        //logPrint("Проверяем, есть ли пользователь в базе fireStore");
        //var user = await Database().getUser(_authResult.user.uid);
        await createObjectInUsers(_authResult.user);
      } else {
        logPrint("аутентификация не прошла");
      }
      _showPreLoader.value = false;
    } catch(e) {
      _showPreLoader.value = false;
      Get.snackbar("Google SignIn Error", "Ошибка входа в гугл аккаунт, попробуйте повторить.", snackPosition: SnackPosition.BOTTOM);
      logPrint("Ошибка входа в гугл аккаунт или регистрации в FireStore:\n $e");
    }
  }

  /// Создаем коллекцию по идентификатору пользователя
  Future<void> createObjectInUsers(User user) async {
    _showPreLoader.value = true;
    logPrint("Создаем новую или апдейтим по uid запись в таблице users");
    if (await CloudDatabase().createOrUpdateUser(user)) {
      // Create success
      // _firebaseUser.value = _auth.currentUser;
    } else {
      throw Exception("Ошибка создания записи пользователя $user в Firestore Database");
    }
    _showPreLoader.value = false;
  }

  /// Выходим из всех
  Future<void> signOut() async {
    logPrint("SignOut ${user.email}");
    try {
      _enableShowSignInView();
      await _auth.signOut();
      await _googleSignIn.signOut();

      // _firebaseUser.value = null;
    } catch (e) {
      logPrint("Не смогли выйти из аккаунта:\n $e");
    }
  }

  /// Авторизуемся эпплом и переходим на основной экран, как авторизация пройдет
  Future<void> appleSignInAndGoToStart() async {
    await appleSignIn();
    if (user != null) {
      logPrint("googleSignInAndGoToStart - Переходим на основной экран");
      goToMainPage();
    }
  }

  /// Автоизуемся эппл-аккаунтом
  Future<void> appleSignIn() async {
    logPrint("appleSignIn - request");
    _showPreLoader.value = true;
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    switch(result.status) {
      case AuthorizationStatus.authorized:
        logPrint("appleSignIn - authorized");
        // Пользователь вошел в аккаунт, создаем запись в Firebase
        final AppleIdCredential appleCredential = result.credential;
        final OAuthProvider oAuthProvider = OAuthProvider("apple.com");
        final AuthCredential credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleCredential.identityToken),
          accessToken: String.fromCharCodes(appleCredential.authorizationCode),
        );

        final authResult = await _auth.signInWithCredential(credential);
        final firebaseUser = authResult.user;
        var givenName = appleCredential.fullName.givenName ?? "Введите имя";
        var familyName = appleCredential.fullName.familyName ?? "";
        final displayName = "$givenName $familyName";
        await firebaseUser.updateDisplayName(displayName);
        // await changeUserNameTo(name: displayName);
        await createObjectInUsers(firebaseUser);

        String st = 'credential: $appleCredential - scopes: ${appleCredential.authorizedScopes} - fullName: ${appleCredential.fullName} - email: ${appleCredential.email} - user: ${appleCredential.user}';
        Property property = Property(key: 'appleSignInLog', value: st);
        final GlobalStorageController storage = Get.find();
        storage.setProperty(property);

        break;
      case AuthorizationStatus.error:
        _showPreLoader.value = false;
        Get.snackbar("Apple SignIn Error", "Ошибка входа в apple аккаунт, попробуйте повторить.", snackPosition: SnackPosition.BOTTOM);
        logPrintErr("Ошибка входа в эппл аккаунт или регистрации в FireStore:\n ${result.error.localizedDescription}");
        break;
      case AuthorizationStatus.cancelled:
        _showPreLoader.value = false;
        logPrintErr("appleSignIn - прервано пользователем");
        break;
      default:
        break;
    }
  }

  /// Вход по почте и паролю
  Future<void> loginWithEmailAndPassword() async {
    _showPreLoader.value = true;
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if (result.user != null) {
        if (result.user.emailVerified) {
          await createObjectInUsers(result.user);
          _showPreLoader.value = false;
          Get.toNamed("/main");
        } else {
          _showPreLoader.value = false;
          Get.snackbar("Login Error", "Вы еще не подтвердили email. Если вы не получили письмо для подтверждения, воспользуйтесь формой восстановления пароля.",
              snackPosition: SnackPosition.BOTTOM
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      _showPreLoader.value = false;
      if (e.code == 'wrong-password') {
        logPrint('Wrong password $e');
        Get.snackbar("Login Error", "Неверный пароль для данного пользователя", snackPosition: SnackPosition.BOTTOM);
      }
    }
    catch (e) {
      _showPreLoader.value = false;
      Get.snackbar("Login Error", "Ошибка входа, $e", snackPosition: SnackPosition.BOTTOM);
      logPrintErr("Ошибка входа по логину/паролю - $e");
    }
  }

  /// Регистрация по почте и паролю, возвращаем true, если регистрация успешная
  Future<bool> registerWithEmailAndPassword() async {
    _showPreLoader.value = true;
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if (credential.user != null) {
        logPrint("registerWithEmailAndPassword - залогинились, обновляем данные");
        credential.user.updateDisplayName(nameController.text);
        logPrint("registerWithEmailAndPassword - ${credential.user.email} ${credential.user.displayName}");
        credential.user.sendEmailVerification();
        _showPreLoader.value = false;
        return true;
      }
      _showPreLoader.value = false;
      return false;
    } on FirebaseAuthException catch (e) {
      _showPreLoader.value = false;
      if (e.code == 'weak-password') {
        logPrintErr('The password provided is too weak.');
        Get.snackbar("Registration Error", "Слишком простой пароль", snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        logPrintErr('registerWithEmailAndPassword - The account already exists for that email.');
        Get.snackbar("Registration Error", "Пользователь с таким email уже зарегистрирован, воспользуйтесь формой восстановления пароля, если вы его забыли.", snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        logPrintErr('Wrong password $e');
        Get.snackbar("Registration Error", "Неверное имя пользователя или пароль", snackPosition: SnackPosition.BOTTOM);
      }
      return false;
    } catch (e) {
      _showPreLoader.value = false;
      Get.snackbar("Registration Error", "Ошибка регистрации нового пользователя, $e", snackPosition: SnackPosition.BOTTOM);
      logPrintErr("Ошибка регистрации по логину/паролю - $e");
      return false;
    }
  }

  Future<void> resetPasswordForEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.back();
      Get.snackbar("Сброс пароля", "Письмо с инструкцией по сбросу пароля отправлено по указанному адресу.", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      logPrintErr("resetPasswordForEmail - ошибка при сбросе пароля");
    }
  }

  Future<void> checkEmailVerification() async {
    // Иначе сразу не обновляются данные пользователя
    await FirebaseAuth.instance.currentUser.reload();
    var user = FirebaseAuth.instance.currentUser;
    logPrint("checkEmailVerification - ${user.email} ${user.emailVerified}");
    if (user.emailVerified) {
      _emailConfirmed();
    } else {
      Get.snackbar("Ошибка", "Вы еще не подтвердили адрес эл.почты. Пожалуйста, проверьте почту и пройдите по ссылке, для подтверждения, что это ваш адрес почты.", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _emailConfirmed() async {
    var user = FirebaseAuth.instance.currentUser;
    await createObjectInUsers(user);
    goToMainPage();
    // _firebaseUser.value = user;
  }

  void disableShowSignInView() {
    _needShowSignInView = false;
    _sp.write(Const.IS_FIREBASE_ENTER_ENABLED, false);
  }

  void _enableShowSignInView() {
    _needShowSignInView = true;
    _sp.write(Const.IS_FIREBASE_ENTER_ENABLED, true);
  }

}
