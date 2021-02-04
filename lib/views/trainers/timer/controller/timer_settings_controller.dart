import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class TimerSettingsController extends GetxController {

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
    
}