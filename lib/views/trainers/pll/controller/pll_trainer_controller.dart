import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/model/result_variants.dart';
import 'package:rg2_flutter_getx/views/trainers/model/trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/model/trainer_state.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/cube_image.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_game.dart';

class PllTrainerController extends TrainerController {
  final PllSettingsController _settingsController = Get.find();
  bool get twoSideRecognition => _settingsController.twoSideRecognition;
  bool get showAllVariants => _settingsController.showAllVariants;
  bool get _randomAUF => _settingsController.randomAUF;
  bool get _randomFS => _settingsController.randomFrontSide;
  int get _timeForAnswer => _settingsController.timeForAnswer;
  int get _variantsCount => _settingsController.variantsCount;
  int get _goodAnswerWaiting => _settingsController.goodAnswerWaiting;
  int get _badAnswerWaiting => _settingsController.badAnswerWaiting;

  TrainerState _state = TrainerState.INIT;

  final _isStartButtonEnabled = false.obs;
  bool get isStartButtonEnabled => _isStartButtonEnabled.value;
  set isStartButtonEnabled(value) => _isStartButtonEnabled.value = value;

  PllCubeImage _pllCubeImage;
  get pllCubeImage => _pllCubeImage;


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
    if (_state != TrainerState.START_SCREEN) {
      _stateStartScreen();
    } else {
      result = true;
    }
    return result;
  }

  /// Задаем следующий вопрос
  nextQuestion() {
    var correctAnswer = quizGame.nextQuestion();

    _pllCubeImage = PllCubeImage(id: correctAnswer.id, randomAUF: _randomAUF, randomFrontSide: _randomFS);
    hint = correctAnswer.value;
    textForButtons = _getListOfVariants();
    print("Загадали $correctAnswer, rndFS - $_randomFS, AUF - $_randomAUF");
    _stateWaitAnswer();
  }

  /// Возвращаем список из нескольких случайных вариантов и правильного на случайном месте
  /// в виде списка списков по 2 элемента (2 столбца для ввода кнопок)
  List<List<String>> _getListOfVariants() {
    List<List<String>> result = List();
    var variants = quizGame.getListOfVariants(_variantsCount).map((e) => e.value).toList();
    for (var i = 0; i < variants.length; i += 2) {
      var row = variants.getRange(i, i + 2).toList();
      result.add(row);
    }
    return result;
  }

  /// Создаем новую игру с параметрами из настроек
  _createNewGame() {
    var quizVariants = _settingsController.getVariants();
    quizGame = QuizGame(
        answersList: quizVariants,
        onTimeIsOverCallback: _onTimeIsOverCallback,
        timeForAnswerInSec: _timeForAnswer
    );
  }

  /// Колбэк обработки TimeOver
  _onTimeIsOverCallback() {
    if (_state == TrainerState.WAIT_ANSWER && quizGame.timerProgress == 0.0) {
      // Выводим диалог окончания времени
      _stateShowTimeIsOver();
      // Переводим в режим без автонажатия кнопки
      _statePaused();
    }
  }

  /// Проверка ответа
  checkAnswerByString(String answer) {
    if (_state == TrainerState.WAIT_ANSWER) {
      if (quizGame.checkAnswerByValue(answer)) {
        // Выводим диалог правильного ответа
        _stateShowRightResult();
        // Задаем автонажатие кнопки Далее
        if (_goodAnswerWaiting == 11) {
          _statePaused();
        } else {
          _delayedWaitAnswer(Duration(seconds: _goodAnswerWaiting));
        }
      } else {
        // Выводим диалог ошибочного ответа
        _stateShowWrongResult();
        // Задаем автонажатие кнопки Далее (11 = бесконечность)
        if (_badAnswerWaiting == 11) {
          _statePaused();
        } else {
          _delayedWaitAnswer(Duration(seconds: _badAnswerWaiting));
        }
      }
    }
  }

  /// Переводим в паузу или на стартовый экран
  pauseOrResetTrainer() {
    if (_state != TrainerState.PAUSED) {
      _statePaused();
    } else {
      _stateStartScreen();
    }
  }


  /// Переводы по статусам тренажера

  _stateInit() {
    print("state Init");
    _state = TrainerState.INIT;
    isStartButtonEnabled = false;
    showStartScreen = true;
    isShowResultEnabled = false;
    answerResult = ResultVariants.UNKNOWN;
  }

  _stateStartScreen() {
    print("state StartScreen");
    _state = TrainerState.START_SCREEN;
    isStartButtonEnabled = true;
    showStartScreen = true;
    isShowResultEnabled = false;
    answerResult = ResultVariants.UNKNOWN;
  }

  _stateWaitAnswer() {
    print("state WaitAnswer");
    _state = TrainerState.WAIT_ANSWER;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = false;
    answerResult = ResultVariants.UNKNOWN;
  }

  _stateShowRightResult() {
    print("state ShowRightResult");
    _state = TrainerState.SHOW_RESULT;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariants.RIGHT;
    cancelButtonText = StrRes.TrainerPauseButtonText;
  }

  _stateShowWrongResult() {
    print("state ShowWrongResult");
    _state = TrainerState.SHOW_RESULT;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariants.WRONG;
    cancelButtonText = StrRes.TrainerPauseButtonText;
  }

  _stateShowTimeIsOver() {
    print("state ShowTimeIsOver");
    _state = TrainerState.SHOW_RESULT;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariants.TIME_OVER;
    cancelButtonText = StrRes.TrainerPauseButtonText;
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
    _state = TrainerState.PAUSED;
    isStartButtonEnabled = false;
    showStartScreen = false;
    isShowResultEnabled = true;
    secondsRemains = 0;
    cancelButtonText = StrRes.TrainerCancelButtonText;
  }

}

