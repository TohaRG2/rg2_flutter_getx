import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class TimerSettingsController extends GetxController {

  @override
  void onInit() {
    _isOneHanded.value = GetStorage().read(Const.IS_ONE_HANDED) ?? false;
    _isDelayedStart.value = GetStorage().read(Const.IS_DELAYED_START) ?? true;
    _isIconsColored.value = GetStorage().read(Const.IS_ICONS_COLORED) ?? true;
    _isMetronomEnabled.value = GetStorage().read(Const.IS_METRONOM_ENABLED) ?? true;
    _metronomFrequency.value = GetStorage().read(Const.METRONOM_FREQUENCY) ?? 60;
    _showScramble.value = GetStorage().read(Const.SHOW_SCRAMBLE) ?? true;
    _scrambleTextRatio.value = GetStorage().read(Const.SCRAMBLE_TEXT_RATIO) ?? 1.0;
    super.onInit();
  }

  final _isOneHanded = false.obs;
    get isOneHanded => _isOneHanded.value;
    set isOneHanded(value) {
      _isOneHanded.value = value;
      GetStorage().write(Const.IS_ONE_HANDED, value);
    }

  final _isIconsColored = true.obs;
  get isIconsColored => _isIconsColored.value;
  set isIconsColored(value) {
    _isIconsColored.value = value;
    GetStorage().write(Const.IS_ICONS_COLORED, value);
  }

  final _isDelayedStart = true.obs;
    get isDelayedStart => _isDelayedStart.value;
    set isDelayedStart(value) {
      _isDelayedStart.value = value;
      GetStorage().write(Const.IS_DELAYED_START, value);
    }

  final _isMetronomEnabled = true.obs;
    get isMetronomEnabled => _isMetronomEnabled.value;
    set isMetronomEnabled(value) {
      _isMetronomEnabled.value = value;
      GetStorage().write(Const.IS_METRONOM_ENABLED, value);
    }

  final _metronomFrequency = 60.obs;
    int get metronomFrequency => _metronomFrequency.value;
    set metronomFrequency(value) {
      _metronomFrequency.value = value;
      GetStorage().write(Const.METRONOM_FREQUENCY, value);
    }

  final _showScramble = true.obs;
    bool get showScramble => _showScramble.value;
    set showScramble(value) {
      _showScramble.value = value;
      GetStorage().write(Const.SHOW_SCRAMBLE, value);
    }

  final _scrambleTextRatio = 1.0.obs;
    double get scrambleTextRatio => _scrambleTextRatio.value;
    set scrambleTextRatio(value) {
      _scrambleTextRatio.value = value;
      GetStorage().write(Const.SCRAMBLE_TEXT_RATIO, value);
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