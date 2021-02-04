import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class TimerSettingsController extends GetxController {

  @override
  void onInit() {
    _isOneHanded.value = GetStorage().read(Const.isOneHanded) ?? false;
    _isDelayedStart.value = GetStorage().read(Const.isDelayedStart) ?? false;
    _isMetronomEnabled.value = GetStorage().read(Const.isMetronomEnabled) ?? false;
    super.onInit();
  }

  final _isOneHanded = false.obs;
    get isOneHanded => _isOneHanded.value;
    set isOneHanded(value) {
      _isOneHanded.value = value;
      GetStorage().write(Const.isOneHanded, value);
    }

  final _isDelayedStart = false.obs;
    get isDelayedStart => _isDelayedStart;
    set isDelayedStart(value) {
      _isDelayedStart.value = value;
      GetStorage().write(Const.isDelayedStart, value);
    }

  final _isMetronomEnabled = true.obs;
    get isMetronomEnabled => _isMetronomEnabled.value;
    set isMetronomEnabled(value) {
      _isMetronomEnabled.value = value;
      GetStorage().write(Const.isMetronomEnabled, value);
    }

}