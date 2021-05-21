import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rg2/controllers/connection_controller.dart';
import 'package:rg2/database/cloud_database.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/main_view.dart';
import 'package:rg2/views/auth/wait_confirm_email_dialog.dart';

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

  _updateLocalEnterCounts() {
    localEnterCounts = _sp.read(Const.LOCAL_STARTS_COUNT) ?? 0;
    localEnterCounts++;
    _sp.write(Const.LOCAL_STARTS_COUNT, localEnterCounts);
  }

  setCurrentUserNameToEditor() {
    nameController.text = user.displayName;
  }

  changeUserNameTo({String name}) async{
    var displayName = name;
    if (displayName == null) {
      displayName = nameController.text;
    }
    var _user = _auth.currentUser;
    await _user.updateProfile(displayName: displayName);
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
      Get.offAll(() => MainView(), transition: Transition.downToUp);
    }
  }

  Future<void> googleSignIn() async {
    try {
      //logPrint("вызываем окно входа гугл аккаунтом");
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      _showPreLoader.value = true;
      if (googleUser != null) {
        logPrint("аутентификация пользователем ${googleUser.displayName} прошла");
      } else {
        logPrint("аутентификация не прошла");
      }
      final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;
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
      _showPreLoader.value = false;
    } catch(e) {
      _showPreLoader.value = false;
      Get.snackbar("Google SignIn Error", "Ошибка входа в гугл аккаунт, попробуйте повторить.", snackPosition: SnackPosition.BOTTOM);
      logPrint("Ошибка входа в гугл аккаунт или регистрации в FireStore:\n $e");
    }
  }

  Future createObjectInUsers(User user) async {
    _showPreLoader.value = true;
    logPrint("Создаем новую или перезаписываем по uid запись в таблице users");
    if (await CloudDatabase().createOrUpdateUser(user)) {
      // Create success
      // _firebaseUser.value = _auth.currentUser;
    } else {
      throw Exception("Ошибка создания пользователя $user в FireBase");
    }
    _showPreLoader.value = false;
  }

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

  Future<void> appleSignInAndGoToStart() async {
    await appleSignIn();
    if (user != null) {
      logPrint("googleSignInAndGoToStart - Переходим на основной экран");
      Get.offAll(() => MainView(), transition: Transition.downToUp);
    }
  }


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
        final AppleIdCredential _appleCredential = result.credential;
        final OAuthProvider oAuthProvider = OAuthProvider("apple.com");
        final AuthCredential credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(_appleCredential.identityToken),
          accessToken: String.fromCharCodes(_appleCredential.authorizationCode),
        );

        final authResult = await _auth.signInWithCredential(credential);
        final firebaseUser = authResult.user;
        final displayName = '${_appleCredential.fullName.givenName} ${_appleCredential.fullName.familyName}';
        //await firebaseUser.updateProfile(displayName: displayName);
        await changeUserNameTo(name: displayName);

        await createObjectInUsers(firebaseUser);

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
        throw UnimplementedError();
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
          Get.offAll(() => MainView(), transition: Transition.downToUp);
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
        credential.user.updateProfile(displayName: nameController.text, photoURL: "");
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

  resetPasswordForEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.back();
      Get.snackbar("Сброс пароля", "Письмо с инструкцией по сбросу пароля отправлено по указанному адресу.", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      logPrintErr("resetPasswordForEmail - ошибка при сбросе пароля");
    }
  }

  checkEmailVerification() async {
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

  _emailConfirmed() async {
    Get.offAll(() => MainView(), transition: Transition.downToUp);
    var user = FirebaseAuth.instance.currentUser;
    await createObjectInUsers(user);
    // _firebaseUser.value = user;
  }

  disableShowSignInView() {
    _needShowSignInView = false;
    _sp.write(Const.IS_FIREBASE_ENTER_ENABLED, false);
  }

  _enableShowSignInView() {
    _needShowSignInView = true;
    _sp.write(Const.IS_FIREBASE_ENTER_ENABLED, true);
  }

}