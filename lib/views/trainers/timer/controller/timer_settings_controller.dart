import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/res/constants.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';

class TimerSettingsController extends GetxController {
  ScrambleGenController _genController = Get.find();

  @override
  void onInit() {
    _isOneHanded.value = GetStorage().read(Const.IS_ONE_HANDED) ?? false;
    _isDelayedStart.value = GetStorage().read(Const.IS_DELAYED_START) ?? false;
    _isMetronomEnabled.value = GetStorage().read(Const.IS_METRONOM_ENABLED) ?? false;
    super.onInit();
  }

  final _isOneHanded = false.obs;
    get isOneHanded => _isOneHanded.value;
    set isOneHanded(value) {
      _isOneHanded.value = value;
      GetStorage().write(Const.IS_ONE_HANDED, value);
    }

  final _isDelayedStart = false.obs;
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

  final _showScramble = false.obs;
    bool get showScramble => _showScramble.value;
    set showScramble(value) => _showScramble.value = value;

  final _scrambleTextRatio = 1.0.obs;
    double get scrambleTextRatio => _scrambleTextRatio.value;
    set scrambleTextRatio(value) {
      _scrambleTextRatio.value = value;
      GetStorage().write(Const.SCRAMBLE_TEXT_RATIO, value);
    }

  double get scrambleBarHeight => 55 * scrambleTextRatio;


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