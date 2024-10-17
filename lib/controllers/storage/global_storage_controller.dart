import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2/controllers/connection_controller.dart';
import 'package:rg2/controllers/storage/default_settings.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/utils/my_logger.dart';


/// Контроллер для локального хранилища
class GlobalStorageController extends GetxController {
  final ConnectionController _connection = Get.put<ConnectionController>(ConnectionController(), permanent: true);

  String _userId = "";
  final GetStorage _localStorage = GetStorage();

  @override
  onInit() async {
    super.onInit();
    logPrint("onInit - GlobalStorageController");
    await _localStorage.initStorage;
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
        logPrintErr("WARNING!!! не смогли получить дефолтное значение для параметра $key");
      }
      //logPrint("есть дефолтное значение ${defaultSettings[key]}, а в value - $value");
    }
    //TODO добавить умолчательные значения для типов, если параметр не найден ни в хранилище, ни в дефолтной мапе
    // if (value == null) {
    //   if (T is String) value = "" as T;
    //   if (T is int) value = 0 as T;
    //   if (T is double) value = 0.0 as T;
    //   if (T is bool) value = false as T;
    // }
    return value;
  }

  /// получить значение параметра из локального хранилища
  T _getPropertyByKeyFromLocalStorage<T>(String key) {
    var result = _localStorage.read(key);
    //logPrint("из локального хранилища по ключу $key получили - $result, типа ${result.runtimeType}, ожидаем типа- $T");
    if (result?.runtimeType == T || T == dynamic) {
      return result;
    } else {
      return null;
    }
  }

  /// Сохраняем параметр в облако(если залогинены) и в локальное хранилище
  setProperty(Property property){
    _setPropertyToLocalStorage(property);
  }

  /// Сохранаяем параметр в локальное хранилище
  void _setPropertyToLocalStorage(Property property) {
    logPrint("saveToLocalStorage ${property.key} ${property.value}");
    //_lastUpdateDate.val = property.changeDate.millisecondsSinceEpoch;
    _localStorage.write(property.key, property.value);
  }

  /// список колбэков, которые будут вызваны после синхронизации данных с FBS
  List<Function> callbacks = [];
  /// запуск зареганных колбэков от settings контроллеров, чтобы обновить переменные в локальном хранилище
  void runCallbacks() {
    logPrint("runCallbacks");
    // обновляем переменные
    callbacks.forEach((callback) { callback();} );
  }

}