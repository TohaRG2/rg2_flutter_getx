import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rg2/database/cloud_database.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/main_view.dart';

class AuthController extends GetxController {

  final _sp = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  /// Observable переменная, в которой храним данные об авторизации пользователя
  /// null - если не авторизован
  final Rx<User> _firebaseUser = Rx<User>(null);
    Rx<User> get firebaseUser => _firebaseUser;
    User get user => _firebaseUser.value;

  /// Нужно ли показывать диалог логина (true, пока не нажата кнопка "больше не показывать")
  bool _needShowSignInView = true;

  /// Счетчик локальных входов
  int localEnterCounts = 0;

  /// Вычисляем необходимость отображения диалога входа при входе в программу
  /// если пользователь еще не вошел или не подтвердил email, но и не нажимал "больше не показывать", то true
  get showSignInDialog {
    bool isUserAuthenticated = (user != null);
    if (isUserAuthenticated) {
      isUserAuthenticated = user.emailVerified;
    }
    return _needShowSignInView && !isUserAuthenticated;
  }

  /// Имя пользователя
  final RxString _name = "".obs;
    String get name => _name.value;
    set name(value) {
      _name.value = value;
    }

  /// Введеный адрес email
  final RxString _email = "".obs;
    String get email => _email.value;
    set email(value) {
      _email.value = value;
    }

  /// Пароль
  final RxString _password = "".obs;
    String get password => _password.value;
    set password(value) {
      _password.value = value;
    }

  @override
  onInit() {
    logPrint("onInit - AuthController");
    super.onInit();
    // Биндим стрим в Observable _firebaseUser и подписываемся на его изменения
    _firebaseUser.bindStream(_auth.authStateChanges());

    _needShowSignInView = _sp.read(Const.IS_FIREBASE_ENTER_ENABLED) ?? true;
    _updateLocalEnterCounts();
  }

  _updateLocalEnterCounts() {
    localEnterCounts = _sp.read(Const.LOCAL_STARTS_COUNT) ?? 0;
    localEnterCounts++;
    _sp.write(Const.LOCAL_STARTS_COUNT, localEnterCounts);
  }

  Future<void> googleSignInAndGoToStart() async {
    await googleSignIn();
    if (user != null) {
      logPrint("googleSignInAndGoToStart - Переходим на основной экран");
      Get.offAll(() => MainView(), transition: Transition.downToUp);
    }
  }

  Future<void> googleSignIn() async {
    try {
      //logPrint("вызываем окно входа гугл аккаунтом");
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
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
      logPrint("Создаем новую или перезаписываем по uid запись в таблице users");
      if (await CloudDatabase().createOrUpdateUser(_authResult.user)) {
        // Create success
      } else {
        throw Exception("Ошибка создания пользователя $user в FireBase");
      }

    } catch(e) {
      Get.snackbar("Google SignIn Error", "Ошибка входа в гугл аккаунт, попробуйте повторить.", snackPosition: SnackPosition.BOTTOM);
      logPrint("Ошибка входа в гугл аккаунт или регистрации в FireStore:\n $e");
    }
  }

  Future<void> googleSignOut() async {
    logPrint("SignOut ${user.email}");
    try {
      _enableShowSignInView();
      await _auth.signOut();
      await _googleSignIn.signOut();

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
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email])
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

        UserCredential _authResult = await _auth.signInWithCredential(credential);

        logPrint("Создаем новую или перезаписываем по uid запись в таблице users");
        if (await CloudDatabase().createOrUpdateUser(_authResult.user)) {
          // Create success
        } else {
          throw Exception("Ошибка создания пользователя $user в FireBase");
        }

        break;
      case AuthorizationStatus.error:
        Get.snackbar("Apple SignIn Error", "Ошибка входа в apple аккаунт, попробуйте повторить.", snackPosition: SnackPosition.BOTTOM);
        logPrintErr("Ошибка входа в эппл аккаунт или регистрации в FireStore:\n ${result.error.localizedDescription}");
        break;
      case AuthorizationStatus.cancelled:
        logPrint("appleSignIn - прервано пользователем");
        break;
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Login Error", "Ошибка входа, ${e.message}", snackPosition: SnackPosition.BOTTOM);
      logPrintErr("Ошибка входа по логину/паролю - $e");
    }
  }

  Future<void> registerWithEmailAndPassword() async {
    try {
      UserCredential currentUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (currentUser.user != null) {
        logPrint("registerWithEmailAndPassword - залогинились, обновляем данные");
        currentUser.user.updateProfile(displayName: name, photoURL: "");
        logPrint("registerWithEmailAndPassword - ${user.email} ${user.displayName}");
        await currentUser.user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logPrint('The password provided is too weak.');
        Get.snackbar("Registration Error", "Слишком простой пароль", snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        logPrintErr('registerWithEmailAndPassword - The account already exists for that email.');
        Get.snackbar("Registration Error", "Пользователь с таким email уже зарегистрирован", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Registration Error", "Ошибка регистрации нового пользователя, ${e.message}", snackPosition: SnackPosition.BOTTOM);
      logPrintErr("Ошибка регистрации по логину/паролю - $e");
    }
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