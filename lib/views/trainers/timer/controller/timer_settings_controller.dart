import 'package:get/get.dart';
import 'package:rg2/controllers/settings/global_storage_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';

class TimerSettingsController extends GetxController {
  final GlobalStorageController _settingsController = Get.find();
  
  @override
  void onInit() {
    super.onInit();
    logPrint("TimerSettingsController onInit");
    _initializeRxVariables();
    _settingsController.callbacks.add(_initializeRxVariables);
  }

  /// Инициализируем observable переменные
  void _initializeRxVariables() {
    _isOneHanded.value = _settingsController.getPropertyByKey(Const.IS_ONE_HANDED);
    _isDelayedStart.value = _settingsController.getPropertyByKey(Const.IS_DELAYED_START);
    _isIconsColored.value = _settingsController.getPropertyByKey(Const.IS_ICONS_COLORED);
    _isMetronomEnabled.value = _settingsController.getPropertyByKey(Const.IS_METRONOM_ENABLED);
    _metronomFrequency.value = _settingsController.getPropertyByKey(Const.METRONOM_FREQUENCY);
    _showScramble.value = _settingsController.getPropertyByKey(Const.SHOW_SCRAMBLE);
    _scrambleTextRatio.value = _settingsController.getPropertyByKey(Const.SCRAMBLE_TEXT_RATIO);
  }

  final _isOneHanded = RxBool(false);
    get isOneHanded => _isOneHanded.value;
    set isOneHanded(value) {
      _isOneHanded.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_ONE_HANDED, value: value));
    }

  final _isIconsColored = RxBool(false);
    get isIconsColored => _isIconsColored.value;
    set isIconsColored(value) {
      _isIconsColored.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_ICONS_COLORED, value: value));
    }

  final _isDelayedStart = RxBool(false);
    get isDelayedStart => _isDelayedStart.value;
    set isDelayedStart(value) {
      _isDelayedStart.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_DELAYED_START, value: value));
    }

  final _isMetronomEnabled = RxBool(false);
    get isMetronomEnabled => _isMetronomEnabled.value;
    set isMetronomEnabled(value) {
      _isMetronomEnabled.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_METRONOM_ENABLED, value: value));
    }

  final _metronomFrequency = RxInt(60);
    int get metronomFrequency => _metronomFrequency.value;
    set metronomFrequency(value) {
      _metronomFrequency.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.METRONOM_FREQUENCY, value: value));
    }

  final _showScramble = RxBool(false);
    bool get showScramble => _showScramble.value;
    set showScramble(value) {
      _showScramble.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.SHOW_SCRAMBLE, value: value));
    }

  final _scrambleTextRatio = RxDouble(1.0);
    double get scrambleTextRatio => _scrambleTextRatio.value;
    set scrambleTextRatio(value) {
      _scrambleTextRatio.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.SCRAMBLE_TEXT_RATIO, value: value));
    }

  /// Локальные переменные без сохранения в файле настроеек
  double get scrambleBarHeight => 55 * scrambleTextRatio;
  final _showScrambleExample = false.obs;
  bool get showScrambleExample => _showScrambleExample.value;
  set showScrambleExample(value) => _showScrambleExample.value = value;


  /// Методы

  decreaseMetronomFrequency() {
    if (metronomFrequency > 1) {
      metronomFrequency--;
    }
  }

  increaseMetronomFrequency() {
    if (metronomFrequency < 240) {
      metronomFrequency++;
    }
  }

  resetMetronomFrequency() {
    metronomFrequency = 60;
  }

}