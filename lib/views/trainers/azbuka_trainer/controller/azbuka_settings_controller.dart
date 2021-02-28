import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/res/constants.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/azbuka.dart';

class AzbukaSettingsController extends GetxController {

  @override
  void onInit() {
    print("AzbukaSettingsController onInit");
    _isEdgeEnabled.value = GetStorage().read(Const.IS_AZBUKA_EDGE_ENABLED) ?? true;
    _isCornerEnabled.value = GetStorage().read(Const.IS_AZBUKA_CORNER_ENABLED) ?? true;
    _isTimerEnabled.value = GetStorage().read(Const.IS_AZBUKA_TIMER_ENABLED) ?? false;
    _timeForAnswer.value = GetStorage().read(Const.AZBUKA_TIME_FOR_ANSWER) ?? 6;
    super.onInit();
  }

  final _isEdgeEnabled = true.obs;
  get isEdgeEnabled => _isEdgeEnabled.value;
  set isEdgeEnabled(value) {
    _isEdgeEnabled.value = value;
    GetStorage().write(Const.IS_AZBUKA_EDGE_ENABLED, value);
  }

  final _isCornerEnabled = true.obs;
  get isCornerEnabled => _isCornerEnabled.value;
  set isCornerEnabled(value) {
    _isCornerEnabled.value = value;
    GetStorage().write(Const.IS_AZBUKA_CORNER_ENABLED, value);
  }

  final _isTimerEnabled = true.obs;
  get isTimerEnabled => _isTimerEnabled.value;
  set isTimerEnabled(value) {
    _isTimerEnabled.value = value;
    GetStorage().write(Const.IS_AZBUKA_TIMER_ENABLED, value);
  }

  final _timeForAnswer = 6.obs;
  int get timeForAnswer => isTimerEnabled ? _timeForAnswer.value : 0;
  set timeForAnswer(value) {
    _timeForAnswer.value = value;
    GetStorage().write(Const.AZBUKA_TIME_FOR_ANSWER, value);
  }


  /// Методы

  /// Уменьшаем время на ответ на 1
  decreaseTimerTime() {
    if (timeForAnswer > 1) {
      timeForAnswer--;
    }
  }

  /// Увеличиваем время на ответ на 1
  increaseTimerTime() {
    if (timeForAnswer < 30) {
      timeForAnswer++;
    }
  }

  /// Устанавливаем значение времени для таймера по умолчанию (6)
  resetTimerTime() {
    timeForAnswer = 6;
  }

}
