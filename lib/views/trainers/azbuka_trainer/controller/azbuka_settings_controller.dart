import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class AzbukaSettingsController extends GetxController {

  /// При инициализации считываем переменные из Storage
  @override
  void onInit() {
    print("AzbukaSettingsController onInit");
    _isEdgeEnabled.value = GetStorage().read(Const.IS_AZBUKA_EDGE_ENABLED) ?? true;
    _isCornerEnabled.value = GetStorage().read(Const.IS_AZBUKA_CORNER_ENABLED) ?? true;
    _isTimerEnabled.value = GetStorage().read(Const.IS_AZBUKA_TIMER_ENABLED) ?? false;
    _timeForAnswer.value = GetStorage().read(Const.AZBUKA_TIME_FOR_ANSWER) ?? 6;
    super.onInit();
  }

  /// Возможность выбрать в загаданных вариантах ребра
  final _isEdgeEnabled = true.obs;
  get isEdgeEnabled => _isEdgeEnabled.value;
  set isEdgeEnabled(value) {
    _isEdgeEnabled.value = value;
    GetStorage().write(Const.IS_AZBUKA_EDGE_ENABLED, value);
  }

  /// Возможность выбрать в загаданных вариантах углы
  final _isCornerEnabled = true.obs;
  get isCornerEnabled => _isCornerEnabled.value;
  set isCornerEnabled(value) {
    _isCornerEnabled.value = value;
    GetStorage().write(Const.IS_AZBUKA_CORNER_ENABLED, value);
  }

  /// Тренировка на время или нет (true - на время)
  final _isTimerEnabled = true.obs;
  get isTimerEnabled => _isTimerEnabled.value;
  set isTimerEnabled(value) {
    _isTimerEnabled.value = value;
    GetStorage().write(Const.IS_AZBUKA_TIMER_ENABLED, value);
  }

  /// Время ожидания ответа (0 если тренировка не на время)
  final _timeForAnswer = 6.obs;
  int get timeForAnswer => isTimerEnabled ? _timeForAnswer.value : 0;
  set timeForAnswer(value) {
    _timeForAnswer.value = value;
    GetStorage().write(Const.AZBUKA_TIME_FOR_ANSWER, value);
  }

  /// Время автонажатия кнопки далее при успешном ответе
  final _goodAnswerWaiting = 1.obs;
  int get goodAnswerWaiting => _goodAnswerWaiting.value;
  set goodAnswerWaiting(value) {
    _goodAnswerWaiting.value = value;
    GetStorage().write(Const.AZBUKA_GOOD_ANSWER_WAITING, value);
  }

  /// Время автонажатия кнопки далее при неуспешном ответе
  final _badAnswerWaiting = 5.obs;
  int get badAnswerWaiting => _badAnswerWaiting.value;
  set badAnswerWaiting(value) {
    _badAnswerWaiting.value = value;
    GetStorage().write(Const.AZBUKA_BAD_ANSWER_WAITING, value);
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


  ///Уменьшаем время автонажатия кнопки далее при успешном ответе
  decreaseGoodAnswerWaiting() {
    if (goodAnswerWaiting > 0) {
      goodAnswerWaiting--;
    }
  }

  ///Увеличиваем время автонажатия кнопки далее при успешном ответе
  increaseGoodAnswerWaiting() {
    if (goodAnswerWaiting < 11) {
      goodAnswerWaiting++;
    }
  }

  ///Сбрасываем время автонажатия кнопки далее при успешном ответе на 2 сек
  resetGoodAnswerWaiting() {
    goodAnswerWaiting = 1;
  }


  ///Уменьшаем время автонажатия кнопки далее при неуспешном ответе
  decreaseBadAnswerWaiting() {
    if (badAnswerWaiting > 0) {
      badAnswerWaiting--;
    }
  }

  ///Увеличиваем время автонажатия кнопки далее при неуспешном ответе
  increaseBadAnswerWaiting() {
    if (badAnswerWaiting < 11) {
      badAnswerWaiting++;
    }
  }

  ///Сбрасываем время автонажатия кнопки далее при неуспешном ответе на 5 сек
  resetBadAnswerWaiting() {
    badAnswerWaiting = 5;
  }

}
