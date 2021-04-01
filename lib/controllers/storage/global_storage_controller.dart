import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2/controllers/storage/default_settings.dart';
import 'package:rg2/database/cloud_database.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';


/// Контроллер, являющийся по сути repository для firebase + контроллер для локального хранилища
class GlobalStorageController extends GetxController {
  final AuthController _auth = Get.put<AuthController>(AuthController(), permanent: true);
  final CloudDatabase _cloudDB = Get.put<CloudDatabase>(CloudDatabase(), permanent: true);

  String _userId = "";
  final GetStorage _sp = GetStorage();

  @override
  onInit() async {
    super.onInit();
    logPrint("onInit - GlobalStorageController ${_auth.user?.uid}");
    await _sp.initStorage;
    // подписываемся на получение изменений firebaseUser, при изменении вызываем _userAuthChanged не чаще, чем раз в 2 сек
    // более подробно в описании Workers для GetX (https://github.com/jonataslaw/getx/blob/master/documentation/en_US/state_management.md)
    //ever(_auth.firebaseUser, _userAuthChanged);
    debounce(_auth.firebaseUser, _userAuthChanged, time: Duration(seconds: 2));
  }

  /// Что-то поменялось в аутентификации пользователя
  _userAuthChanged(User user) async{
    logPrint("_userAuthChanged to ${user?.uid}");
    _userId = (user == null) ? "" : user?.uid;
    if (_userId != "") {
      await _updateAllParameters();
    }
  }

  //------------------------- матоды для работы с параметрами программы ---------------------------------

  /// Читаем параметр по ключу из локального хранилища или получаем из дефолтных значений, если в хранилище нет.
  /// Вернем null если нет ни там, и ни там
  T getPropertyByKey<T>(String key) {
    T value = _getPropertyByKeyFromLocalStorage<T>(key);
    //logPrint("Запрошен из локалстора параметр $key - нашли $value");
    if (value == null) {
      value = defaultSettings[key];
      if (value == null) {
        logPrint("WARNING!!! не смогли получить дефолтное значение для параметра $key");
      }
      //logPrint("есть дефолтное значение ${defaultSettings[key]}, а в value - $value");
    }
    //TODO добавить умолчательные значения для типов, если параметр не найден ни в хранилище, ни в дефолтной мапе
    // if (value == null) {
    //   if (value is String) value = "";
    //   if (value is int) value = 0;
    //   if (value is double) value = 0.0;
    //   if (value is bool) value = false;
    // }
    return value;
  }

  /// получить значение параметра из локального хранилища
  T _getPropertyByKeyFromLocalStorage<T>(String key) {
    var result = _sp.read(key);
    //logPrint("из локального хранилища по ключу $key получили - $result, типа ${result.runtimeType}, ожидаем типа- $T");
    if (result?.runtimeType == T || T == dynamic) {
      return result;
    } else {
      return null;
    }
  }

  /// Сохраняем параметр в облако(если залогинены) и в локальное хранилище
  setPropertyByKey(Property property){
    _addOrUpdatePropertyInFBS(property);
    _setPropertyToLocalStorage(property);
  }

  /// Добавить или обновить параметр в firebase, если пользователь залогинен
  void _addOrUpdatePropertyInFBS(Property property) {
    logPrint("_addOrUpdatePropertyInBase = $property, userId = $_userId");
    if (_userId != "") {
      _cloudDB.addOrUpdateProperty(_userId, property);
    }
  }

  /// Сохранаяем параметр в локальное хранилище
  void _setPropertyToLocalStorage(Property property) {
    logPrint("saveToLocalStorage ${property.key} ${property.value}");
    //_lastUpdateDate.val = property.changeDate.millisecondsSinceEpoch;
    _sp.write(property.key, property.value);
  }

  /// Обновляем все параметры в программе данными из firebase
  _updateAllParameters() async {
    logPrint("updateAllParametersFromBase - ");
    if (_userId != "") {
      // получить все параметры из базы
      var list = await _cloudDB.getAllUserProperties(_userId);
      // перезаписать полученные параметры в локальное хранилище
      list?.forEach((property) {
        _setPropertyToLocalStorage(property);
      });
      // обновить переменные в контроллерах
      runCallbacks();
    }
  }

  /// список колбэков, которые будут вызваны после синхронизации данных с FBS
  List<Function> callbacks = [];
  /// запуск зареганных колбэков от settings контроллеров, чтобы обновить переменные из локального хранилища
  void runCallbacks() {
    logPrint("runCallbacks");
    // обновляем переменные
    callbacks.forEach((callback) { callback();} );
  }

}