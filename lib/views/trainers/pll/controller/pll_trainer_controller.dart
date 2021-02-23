import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/cube_image.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_game.dart';

class PllTrainerController extends GetxController {
  final PllSettingsController _settingsController = Get.find();

  PllState _state = PllState.INIT;
  ResultVariant answerResult = ResultVariant.UNKNOWN;

  final _showStartScreen = true.obs;
  bool get showStartScreen => _showStartScreen.value;
  set showStartScreen(value) => _showStartScreen.value = value;

  final _isStartButtonEnabled = false.obs;
  bool get isStartButtonEnabled => _isStartButtonEnabled.value;
  set isStartButtonEnabled(value) => _isStartButtonEnabled.value = value;

  final _isShowResultEnabled = false.obs;
  bool get isShowResultEnabled => _isShowResultEnabled.value;
  set isShowResultEnabled(value) => _isShowResultEnabled.value = value;

  final _hint = "".obs;
  String get hint => _hint.value;
  set hint(value) => _hint.value = value;

  final _secondsRemains = 0.obs;
  int get secondsRemains => _secondsRemains.value;
  set secondsRemains(value) => _secondsRemains.value = value;

  final _cancelButtonText = "".obs;
  String get cancelButtonText => _cancelButtonText.value;
  set cancelButtonText(value) => _cancelButtonText.value = value;

  QuizGame quizGame;
  CubeImage cubeImage;

  bool get twoSideRecognition => _settingsController.twoSideRecognition;
  bool get showAllVariants => _settingsController.showAllVariants;


  /// Методы

  /// Подгружаем список с настроками PLL алгоритов из базы
  loadDataFromBase() async {
    _stateInit();
    await _settingsController.loadPllTrainerItems();
    _stateStartScreen();
  }

  /// Нажатие на кнопку "Старт"
  startTrainer() async {
    _createNewGame();
    nextQuestion();
  }

  /// Можем ли выйти из тренажера, true - если уже находимся на начальном экране, а значит можем спокойно выйти
  bool exitTrainer() {
    var result = false;
    if (_state != PllState.START_SCREEN) {
      _stateStartScreen();
    } else {
      result = true;
    }
    return result;
  }

  /// Задаем следующий вопрос
  nextQuestion() {
    _stateWaitAnswer();
    var correctAnswer = quizGame.nextQuestion();
    var randomAUF = _settingsController.randomAUF;
    var randomFS = _settingsController.randomFrontSide;
    cubeImage = CubeImage(id: correctAnswer.id, randomAUF: randomAUF, randomFrontSide: randomFS);
    hint = correctAnswer.value;
    print("Загадали $correctAnswer");
  }

  /// Возвращаем список из нескольких случайных вариантов и правильного на случайном месте
  List<String> getListOfVariants() {
    return quizGame.getListOfVariants(_settingsController.variantsCount).map((e) => e.value).toList();
  }

  /// Создаем новую игру с параметрами из настроек
  _createNewGame() {
    var quizVariants = _settingsController.getVariants();
    quizGame = QuizGame(
        answersList: quizVariants,
        onTimeIsOverCallback: _onTimeIsOverCallback,
        timeForAnswerInSec: _settingsController.timeForAnswer
    );
  }

  /// Колбэк обработки TimeOver
  _onTimeIsOverCallback() {
    if (_state == PllState.WAIT_ANSWER && quizGame.timerProgress == 0.0) {
      // Выводим диалог окончания времени
      _stateShowTimeIsOver();
      // Переводим в режим без автонажатия кнопки
      _statePaused();
    }
  }

  /// Проверка ответа
  checkAnswerByString(String answer) {
    if (quizGame.checkAnswerByValue(answer)) {
      // Выводим диалог правильного ответа
      _stateShowRightResult();
      // Задаем автонажатие кнопки Далее на 2 сек
      _delayedWaitAnswer(Duration(seconds: 2));
    } else {
      // Выводим диалог ошибочного ответа
      _stateShowWrongResult();
      // Задаем автонажатие кнопки Далее на 5 сек
      _delayedWaitAnswer(Duration(seconds: 5));
    }
  }

  /// Переводим в паузу или на стартовый экран
  pauseOrResetTrainer() {
    if (_state != PllState.PAUSED) {
      _statePaused();
    } else {
      _stateStartScreen();
    }
  }


  /// Переводы по статусам тренажера

  _stateInit() {
    print("state Init");
    _state = PllState.INIT;
    isStartButtonEnabled = false;
    showStartScreen = true;
    isShowResultEnabled = false;
    answerResult = ResultVariant.UNKNOWN;
  }

  _stateStartScreen() {
    print("state StartScreen");
    _state = PllState.START_SCREEN;
    isStartButtonEnabled = true;
    showStartScreen = true;
    isShowResultEnabled = false;
    answerResult = ResultVariant.UNKNOWN;
  }

  _stateWaitAnswer() {
    print("state WaitAnswer");
    _state = PllState.WAIT_ANSWER;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = false;
    answerResult = ResultVariant.UNKNOWN;
  }

  _stateShowRightResult() {
    print("state ShowRightResult");
    _state = PllState.SHOW_RESULT;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariant.RIGHT;
    cancelButtonText = StrRes.pllTrainerPauseButtonText;
  }

  _stateShowWrongResult() {
    print("state ShowWrongResult");
    _state = PllState.SHOW_RESULT;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariant.WRONG;
    cancelButtonText = StrRes.pllTrainerPauseButtonText;
  }

  _stateShowTimeIsOver() {
    print("state ShowTimeIsOver");
    _state = PllState.SHOW_RESULT;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariant.TIME_OVER;
    cancelButtonText = StrRes.pllTrainerPauseButtonText;
  }

  _delayedWaitAnswer(Duration delay) async {
    print("delayedWaitAnswer");
    var endTime = DateTime.now().add(delay);
    var curState = _state;
    while ( DateTime.now().isBefore(endTime) && _state == curState) {
      var remainsDuration = endTime.difference(DateTime.now());
      secondsRemains = remainsDuration.inSeconds + 1;
      // обновляем с задержкой 100 мс, т.е. примерно 10 раз в секунду
      await Future.delayed(Duration(milliseconds: 100), () {});
    }
    secondsRemains = 0;
    // если вышли по времени, то задаем следующий вопрос
    if (_state == curState) {
      nextQuestion();
    }
  }

  _statePaused() {
    print("state Paused");
    _state = PllState.PAUSED;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    secondsRemains = 0;
    cancelButtonText = StrRes.pllTrainerCancelButtonText;
  }

}

enum PllState {
  INIT,
  START_SCREEN,
  WAIT_ANSWER,
  SHOW_RESULT,
  PAUSED
}

enum ResultVariant {
  UNKNOWN,
  RIGHT,
  WRONG,
  TIME_OVER
}