import 'dart:math';

import 'package:get/get.dart';
import 'package:rg2/models/pair.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/azbuka_trainer/controller/azbuka_settings_controller.dart';
import 'package:rg2/views/trainers/azbuka_trainer/model/azbuka_cube_image.dart';
import 'package:rg2/views/trainers/model/cube_element_types.dart';
import 'package:rg2/views/trainers/model/result_variants.dart';
import 'package:rg2/views/trainers/controller/abstract_trainer_controller.dart';
import 'package:rg2/views/trainers/model/trainer_state.dart';
import 'package:rg2/views/trainers/pll/model/quiz_game.dart';
import 'package:rg2/views/trainers/pll/model/quiz_variant.dart';
import 'package:rg2/views/trainers/scramble_gen/model/azbuka.dart';
import 'package:rg2/views/trainers/scramble_gen/model/blind_cube.dart';

class AzbukaTrainerController extends TrainerController {
  final AzbukaSettingsController _settingsController = Get.find();
  get _timeForAnswer => _settingsController.timeForAnswer;
  get _isCornerEnabled => _settingsController.isCornerEnabled;
  get _isEdgeEnabled => _settingsController.isEdgeEnabled;
  get _goodAnswerWaiting => _settingsController.goodAnswerWaiting;
  get _badAnswerWaiting => _settingsController.badAnswerWaiting;

  TrainerState _state = TrainerState.START_SCREEN;
  Azbuka _azbuka = Azbuka();
  BlindCube _blindCube = BlindCube();

  AzbukaCubeImage _azbukaCubeImage;
  get azbukaCubeImage => _azbukaCubeImage;

  /// Методы

  /// Нажатие на кнопку "Старт"
  startTrainer() {
    _createNewGame();
    nextQuestion();
  }

  /// Создаем новую игру используя параметры из настроек
  _createNewGame() {
    _blindCube = BlindCube.colored(colors: Azbuka().currentColorsSide, azbuka: Azbuka().currentAzbuka);
    //logPrint("$_blindCube");
    quizGame = QuizGame(
        answersList: _quizCornerVariants,
        onTimeIsOverCallback: _onTimeIsOverCallback,
        timeForAnswerInSec: _timeForAnswer,
    );
  }

  /// Колбэк обработки TimeOver
  _onTimeIsOverCallback() {
    if (_state == TrainerState.WAIT_ANSWER && quizGame.timerProgress == 0.0) {
      logPrint("Time is over :(");
      // Выводим диалог окончания времени
      _stateShowTimeIsOver();
      // Переводим в режим без автонажатия кнопки
      _statePaused();
    }
  }

  nextQuestion() {
    // Генерируем случайный скрамбл и перемешиваем по нему кубик
    var scramble = _blindCube.generateScramble(19);
    _blindCube.executeScrambleWithReset(scramble);

    // выбираем случайный слот (в соответствии с настройками)
    var slot = _selectRandomSlot();
    // определяем номер элемента по номеру слота и получаем для него букву из азбуки
    var elementNumber = _slotElementsNumbers[slot].first;
    hint = _blindCube.getLetterByCurrentNumber(elementNumber);

    _azbukaCubeImage = AzbukaCubeImage(cube: _blindCube, slot: slot);

    var elementType = _blindCube.getElementType(elementNumber);
    if (elementType == CubeElementTypes.CORNER) {
      quizGame.setNewVariants(_quizCornerVariants);
    } else {
      quizGame.setNewVariants(_quizEdgeVariants);
    }
    quizGame.setCorrectAnswerByValue(hint);
    _stateWaitAnswer();
  }

  /// Переводим в паузу или на стартовый экран
  pauseOrResetTrainer() {
    if (_state != TrainerState.PAUSED) {
      _statePaused();
    } else {
      _stateStartScreen();
    }
  }

  /// Выбираем случайный слот из диапазона [0..6], где 0..2 - слоты углов, 3..6 - слоты ребер
  int _selectRandomSlot() {
    var fromSlot = _isCornerEnabled ? 0 : 3;
    var toSlot = _isEdgeEnabled ? 7 : 3;
    return _randomRange(fromSlot, toSlot);
  }

  /// Случайное значение в диапазоне [min, max)
  _randomRange(min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  /// Возвращаем список из 24 вариантов (id, буква, true) для углов
  List<QuizVariant> get _quizCornerVariants {
    var listOf54Letters = _azbuka.currentAzbuka;
    var result = <QuizVariant>[];
    _cornersNumbers.asMap().forEach((index, cornerNumber) {
      result.add(QuizVariant(index, listOf54Letters[cornerNumber], true));
    });
    return result;
  }

  /// Возвращаем список из 24 вариантов (id, буква, true) для ребер
  List<QuizVariant> get _quizEdgeVariants {
    var listOf54Letters = _azbuka.currentAzbuka;
    var result = <QuizVariant>[];
    _edgeNumbers.asMap().forEach((index, edgeNumber) {
      result.add(QuizVariant(index, listOf54Letters[edgeNumber], true));
    });
    return result;
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


  /// Переводы по статусам тренажера

  _stateStartScreen() {
    logPrint("state azbuka StartScreen");
    _state = TrainerState.START_SCREEN;
    showStartScreen = true;
    isShowResultEnabled = false;
    answerResult = ResultVariants.UNKNOWN;
  }

  _stateWaitAnswer() {
    logPrint("state azbuka WaitAnswer");
    _state = TrainerState.WAIT_ANSWER;
    showStartScreen = false;
    isShowResultEnabled = false;
    answerResult = ResultVariants.UNKNOWN;
  }

  _stateShowRightResult() {
    logPrint("state azbuka ShowRightResult");
    _state = TrainerState.SHOW_RESULT;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariants.RIGHT;
    cancelButtonText = StrRes.TrainerPauseButtonText;
  }

  _stateShowWrongResult() {
    logPrint("state azbuka ShowWrongResult");
    _state = TrainerState.SHOW_RESULT;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariants.WRONG;
    cancelButtonText = StrRes.TrainerPauseButtonText;
  }

  _stateShowTimeIsOver() {
    logPrint("state azbuka ShowTimeIsOver");
    _state = TrainerState.SHOW_RESULT;
    showStartScreen = false;
    isShowResultEnabled = true;
    answerResult = ResultVariants.TIME_OVER;
    cancelButtonText = StrRes.TrainerPauseButtonText;
  }

  _delayedWaitAnswer(Duration delay) async {
    logPrint("delayedWaitAnswer");
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
    logPrint("state Paused");
    _state = TrainerState.PAUSED;
    showStartScreen = false;
    isShowResultEnabled = true;
    secondsRemains = 0;
    cancelButtonText = StrRes.TrainerCancelButtonText;
  }



  static const _cornersNumbers = [0, 2, 6, 8, 9, 11, 15, 17, 18, 20, 24, 26, 27, 29, 33, 35, 36, 38, 42, 44, 45, 47, 51, 53];
  static const _edgeNumbers = [1, 3, 5, 7, 10, 12, 14, 16, 19, 21, 23, 25, 30, 28, 32, 34, 37, 39, 41, 43, 46, 48, 50, 52];

  static Map<int, Pair<int,int>> _slotElementsNumbers = {
    0 : Pair(33,47),
    1 : Pair(47,26),
    2 : Pair(26,33),
    3 : Pair(23,30),
    4 : Pair(30,23),
    5 : Pair(25,46),
    6 : Pair(46,25)
  };

}