import 'package:get/get.dart';
import 'package:rg2/controllers/settings/global_settings_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';

class AzbukaSettingsController extends GetxController {
  final GlobalSettingsController _settingsController = Get.find();

  /// При инициализации считываем переменные из Storage
  @override
  void onInit() {
    print("AzbukaSettingsController onInit");
    _isEdgeEnabled.value = _settingsController.getPropertyByKey(Const.IS_AZBUKA_EDGE_ENABLED);
    _isCornerEnabled.value = _settingsController.getPropertyByKey(Const.IS_AZBUKA_CORNER_ENABLED);
    _isTimerEnabled.value = _settingsController.getPropertyByKey(Const.IS_AZBUKA_TIMER_ENABLED);
    _timeForAnswer.value = _settingsController.getPropertyByKey(Const.AZBUKA_TIME_FOR_ANSWER);
    _goodAnswerWaiting.value = _settingsController.getPropertyByKey(Const.AZBUKA_GOOD_ANSWER_WAITING);
    _badAnswerWaiting.value = _settingsController.getPropertyByKey(Const.AZBUKA_BAD_ANSWER_WAITING);
    super.onInit();
  }

  /// Возможность выбрать в загаданных вариантах ребра
  final _isEdgeEnabled = RxBool();
  get isEdgeEnabled => _isEdgeEnabled.value;
  set isEdgeEnabled(value) {
    _isEdgeEnabled.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.IS_AZBUKA_EDGE_ENABLED, value: value));
  }

  /// Возможность выбрать в загаданных вариантах углы
  final _isCornerEnabled = RxBool();
  get isCornerEnabled => _isCornerEnabled.value;
  set isCornerEnabled(value) {
    _isCornerEnabled.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.IS_AZBUKA_CORNER_ENABLED, value: value));
  }

  /// Тренировка на время или нет (true - на время)
  final _isTimerEnabled = RxBool();
  get isTimerEnabled => _isTimerEnabled.value;
  set isTimerEnabled(value) {
    _isTimerEnabled.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.IS_AZBUKA_TIMER_ENABLED, value: value));
  }

  /// Время ожидания ответа (0 если тренировка не на время)
  final _timeForAnswer = RxInt(0);
  int get timeForAnswer => isTimerEnabled ? _timeForAnswer.value : 0;
  set timeForAnswer(value) {
    _timeForAnswer.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.AZBUKA_TIME_FOR_ANSWER, value: value));
  }

  /// Время автонажатия кнопки далее при успешном ответе
  final _goodAnswerWaiting = RxInt(1);
  int get goodAnswerWaiting => _goodAnswerWaiting.value;
  set goodAnswerWaiting(value) {
    _goodAnswerWaiting.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.AZBUKA_GOOD_ANSWER_WAITING, value: value));
  }

  /// Время автонажатия кнопки далее при неуспешном ответе
  final _badAnswerWaiting = RxInt(5);
  int get badAnswerWaiting => _badAnswerWaiting.value;
  set badAnswerWaiting(value) {
    _badAnswerWaiting.value = value;
    _settingsController.setPropertyByKey(Property(key: Const.AZBUKA_BAD_ANSWER_WAITING, value: value));
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
