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

  bool _needShowSignInView = true;

  int localEnterCounts = 0;

  get showSignInDialog => _needShowSignInView && (user == null);

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
    // _waitingSync = true;
    await googleSignIn();
    if (user != null) {
      logPrint("googleSignInAndGoToStart - Переходим на основной экран");
      Get.offAll(() => MainView(), transition: Transition.downToUp);
    }
    // _waitingSync = false;
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

  disableShowSignInView() {
    _needShowSignInView = false;
    _sp.write(Const.IS_FIREBASE_ENTER_ENABLED, false);
  }

  _enableShowSignInView() {
    _needShowSignInView = true;
    _sp.write(Const.IS_FIREBASE_ENTER_ENABLED, true);
  }

}