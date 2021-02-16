import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_variant.dart';


class QuizGame {
  GameState _state = GameState.INIT;

  var _correctAnswer = 0;

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
  var _answersList = List<QuizVariant>();

  /// Счетчик правильных ответов
  var _rightAnswerCount = 0;
  /// Счетчик неправильных ответов
  var _wrongAnswerCount = 0;

  /// Callback вызываемый, если закончилось время на ответ
  Function() onTimeIsOver;

  /// Сброс счетчико ответов
  resetCounts() {
    _rightAnswerCount = 0;
    _wrongAnswerCount = 0;
  }

  /// Выбор вопроса. Возвращает номер из списка вариантов и запускает при необходимости таймер
  int nextQuestion() {
    // выбираем вариант из списка тех, которые помечены, как возможные для ответа
    var availableAnswers = _answersList.where((variant) => variant.isSelectable).toList();
    var rndAnswerNumber = Random().nextInt(availableAnswers.length);
    _correctAnswer = availableAnswers[rndAnswerNumber].id;
    // устанавливаем время начала ответа на вопрос
    _currentVariantStartAnswerTime = DateTime.now();
    _state = GameState.WAIT_ANSWER;
    if (timeForAnswer > 0) {
      startTimer();
    }
    return _correctAnswer;
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
    if (now.isAfter(endAnswerTime) || now.isAtSameMomentAs(endAnswerTime)) {
      onTimeIsOver();
    }
  }

  /// Вход: Count - количество вариантов
  /// Выход: Список из Count элементов, и номер правильного ответа
  List<QuizVariant> getListOfVariants(int count) {
    // создаем список из фиксированного кол-ва элементов
    var tmpList = _answersList.toList(growable: false);

    // перемешиваем массив ответов без правильного и ставим правильный ответ в
    // случайную позицию в пределах count
    var correctVariant = _answersList[_correctAnswer];
    tmpList.removeAt(_correctAnswer);
    tmpList.shuffle();
    tmpList.add(correctVariant);


  }

  /// Нормализируем список правильных ответов (убираем признак выбранного ответа и переопределяем номера)
  _normalizeAnswersList() {
    _answersList.asMap().forEach((index, variant) {
      _answersList[index].id = index;
      _answersList[index].isCorrectAnswer = false;
    });
  }

  /// Конструктор. На входе:
  /// answersList: список возможных вариантов,
  /// onTimeIsOver: коллбэк вызываемый, когда заканчивается время на ответ,
  /// timeForAnswerInSec: время в секундах на ответ
  QuizGame({
    @required List<QuizVariant> answersList,
    this.onTimeIsOver,
    int timeForAnswerInSec,
  }) {
    this.timeForAnswer = timeForAnswerInSec;
    this._answersList = answersList;
    _normalizeAnswersList();
  }
}

enum GameState {
  INIT,
  STOP,
  WAIT_ANSWER,
  SHOW_ANSWER,
  TIME_OVER
}