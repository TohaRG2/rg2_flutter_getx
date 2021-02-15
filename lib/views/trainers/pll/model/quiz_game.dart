import 'package:get/get.dart';
import 'dart:math';

class QuizGame {
  GameState _state = GameState.INIT;

  var correctAnswer = 0;

  /// Время для ответа на вопрос в секундах (от 0 до 30). Если 0, значит время отключено
  var _timeForAnswer = 6.obs;
  int get timeForAnswer => _timeForAnswer.value;
  set timeForAnswer(int value) {
    if (value <= 30 && value >= 0) {
      _timeForAnswer.value = value;
    } else {
      _timeForAnswer.value = 0;
    }
  }
  /// Время начала ответа на вопрос
  DateTime _currentVariantStartAnswerTime = DateTime.now();

  /// Прогресс в %, сколько осталось до конца ответа
  var _timerProgress = 100.0.obs;
  double get timerProgress => _timerProgress.value;
  set timerProgress(value){
    _timerProgress.value = value;
  }

  /// Список возможных вариантов
  var answersList = List<String>();

  /// Счетчик правильных ответов
  var _rightAnswerCount = 0;
  /// Счетчик неправильных ответов
  var _wrongAnswerCount = 0;

  Function() onTimeIsOver;

  /// Сброс счетчико ответов
  resetCounts() {
    _rightAnswerCount = 0;
    _wrongAnswerCount = 0;
  }

  /// Старт игры, возвращает номер из списка вариантов
  int startGame() {
    // выбираем вариант из списка
    var selectedAnswer = new Random().nextInt(answersList.length);
    // устанавливаем время начала ответа на вопрос
    _currentVariantStartAnswerTime = DateTime.now();
    if (timeForAnswer > 0) {
      startTimer();
    }
    _state = GameState.INIT;
    return selectedAnswer;
  }

  startTimer() async {
    var duration = Duration(seconds: timeForAnswer);
    var endAnswerTime = _currentVariantStartAnswerTime.add(duration);
    var now  = DateTime.now();
    while (_state == GameState.WAIT_ANSWER && now.isBefore(endAnswerTime)) {
      // остаток в милисекундах
      var remains = endAnswerTime.difference(now).inMilliseconds;
      timerProgress = remains / (duration.inMilliseconds / 100);
      // обновляем с задержкой 16 мс, т.е. примерно 60 раз в секунду
      await Future.delayed(Duration(milliseconds: 16), () {});
      now  = DateTime.now();
    }

  }


  /// Конструктор. На входе, список возможных вариантов,
  QuizGame({List<String> variants, });
}

enum GameState {
  INIT,
  STOP,
  WAIT_ANSWER,
  SHOW_ANSWER,
  TIME_OVER
}