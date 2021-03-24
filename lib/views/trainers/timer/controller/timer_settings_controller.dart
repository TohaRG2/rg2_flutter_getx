import 'package:get/get.dart';
import 'package:rg2/controllers/settings/global_settings_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';

class TimerSettingsController extends GetxController {
  final GlobalSettingsController _settingsController = Get.find();
  
  @override
  void onInit() {
    _isOneHanded.value = _settingsController.getPropertyByKey(Const.IS_ONE_HANDED) ?? false;
    _isDelayedStart.value = _settingsController.getPropertyByKey(Const.IS_DELAYED_START) ?? true;
    _isIconsColored.value = _settingsController.getPropertyByKey(Const.IS_ICONS_COLORED) ?? true;
    _isMetronomEnabled.value = _settingsController.getPropertyByKey(Const.IS_METRONOM_ENABLED) ?? true;
    _metronomFrequency.value = _settingsController.getPropertyByKey(Const.METRONOM_FREQUENCY) ?? 60;
    _showScramble.value = _settingsController.getPropertyByKey(Const.SHOW_SCRAMBLE) ?? true;
    _scrambleTextRatio.value = _settingsController.getPropertyByKey(Const.SCRAMBLE_TEXT_RATIO) ?? 1.0;
    super.onInit();
  }

  final _isOneHanded = false.obs;
    get isOneHanded => _isOneHanded.value;
    set isOneHanded(value) {
      _isOneHanded.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_ONE_HANDED, value: value));
    }

  final _isIconsColored = true.obs;
  get isIconsColored => _isIconsColored.value;
  set isIconsColored(value) {
    _isIconsColored.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.IS_ICONS_COLORED, value: value));
  }

  final _isDelayedStart = true.obs;
    get isDelayedStart => _isDelayedStart.value;
    set isDelayedStart(value) {
      _isDelayedStart.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_DELAYED_START, value: value));
    }

  final _isMetronomEnabled = true.obs;
    get isMetronomEnabled => _isMetronomEnabled.value;
    set isMetronomEnabled(value) {
      _isMetronomEnabled.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_METRONOM_ENABLED, value: value));
    }

  final _metronomFrequency = 60.obs;
    int get metronomFrequency => _metronomFrequency.value;
    set metronomFrequency(value) {
      _metronomFrequency.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.METRONOM_FREQUENCY, value: value));
    }

  final _showScramble = true.obs;
    bool get showScramble => _showScramble.value;
    set showScramble(value) {
      _showScramble.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.SHOW_SCRAMBLE, value: value));
    }

  final _scrambleTextRatio = 1.0.obs;
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