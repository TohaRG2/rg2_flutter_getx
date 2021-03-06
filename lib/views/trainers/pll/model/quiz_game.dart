import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'dart:math';

import 'package:rg2/views/trainers/pll/model/quiz_variant.dart';


class QuizGame {
  GameState _state = GameState.INIT;

  QuizVariant _correctAnswer;

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
  var _timerProgress = 1.0.obs;
  double get timerProgress => _timerProgress.value;
  set timerProgress(value){
    _timerProgress.value = value;
  }

  /// Список возможных вариантов
  var answersList = <QuizVariant>[];

  /// Счетчик правильных ответов
  var _rightAnswerCount = 0.obs;
  int get rightAnswerCount => _rightAnswerCount.value;
  /// Счетчик неправильных ответов
  var _wrongAnswerCount = 0.obs;
  int get wrongAnswerCount => _wrongAnswerCount.value;

  /// Callback вызываемый, если закончилось время на ответ
  Function() _onTimeIsOverCallback;

  /// Сброс счетчико ответов
  _resetCounts() {
    _rightAnswerCount.value = 0;
    _wrongAnswerCount.value = 0;
  }

  /// Выбор вопроса. Возвращает вариант из отмеченных, как возможные и запускает при необходимости таймер
  QuizVariant nextQuestion() {
    // выбираем вариант из списка тех, которые помечены, как возможные для ответа
    var availableAnswers = answersList.where((variant) => variant.isSelectable).toList();
    var rndAnswerNumber = Random().nextInt(availableAnswers.length);
    _correctAnswer = availableAnswers[rndAnswerNumber];
    _goToWaitAnswer();
    return _correctAnswer;
  }

  /// Запускаем ожидание ответа на вопрос
  _goToWaitAnswer() {
    // устанавливаем время начала ответа на вопрос
    _currentVariantStartAnswerTime = DateTime.now();
    _state = GameState.WAIT_ANSWER;
    // запускаем таймер, если установлена настройка
    if (timeForAnswer > 0) {
      _startTimer();
    }
  }
  
  /// Запускаем таймер, который обновляет прогресс и переводит таймер в TIME_OVER если ответ не был дан
  _startTimer() async {
    var duration = Duration(seconds: timeForAnswer);
    var endAnswerTime = _currentVariantStartAnswerTime.add(duration);
    var now  = DateTime.now();
    while (_state == GameState.WAIT_ANSWER && now.isBefore(endAnswerTime)) {
      // остаток в милисекундах
      var remains = endAnswerTime.difference(now).inMilliseconds;
      timerProgress = remains / duration.inMilliseconds;
      // обновляем с задержкой 16 мс, т.е. примерно 60 раз в секунду
      await Future.delayed(Duration(milliseconds: 16), () {});
      // обновляем текущий момент и время до которого считаем (если загадан новый вопрос, но из цикла не выходили)
      now  = DateTime.now();
      endAnswerTime = _currentVariantStartAnswerTime.add(duration);
    }
    // если таймер завершил цикл по времени, а не по статусу
    if (_state == GameState.WAIT_ANSWER) {
      _state = GameState.TIME_OVER;
      timerProgress = 0.0;
      _wrongAnswerCount++;
      _onTimeIsOverCallback();
    }
  }

  /// Вход: Count - количество вариантов
  /// Выход: Список из Count элементов, и номер правильного ответа
  List<QuizVariant> getListOfVariants(int count) {
    logPrint("start ListOfVariants - $count");
    // создаем список из копии всех возможых ответов
    var tmpList = answersList.toList();
    // перемешиваем массив ответов без правильного и ставим правильный ответ в
    // случайную позицию в пределах count
    var correctVariant = answersList[_correctAnswer.id];
    tmpList.removeAt(_correctAnswer.id);
    tmpList.shuffle();
    tmpList.insert(Random().nextInt(count), correctVariant);
    return tmpList.sublist(0, count);
  }

  /// Проверяем ответ по номеру (совпадает ли с номером загаданного варианта)
  bool checkAnswerById(int answer) {
    _state = GameState.STOP;
    var result = false;
    if (answer == _correctAnswer.id) {
      result = true;
      _rightAnswerCount++;
    } else {
      _wrongAnswerCount++;
    }
    //logPrint("Counts = $rightAnswerCount, $wrongAnswerCount");
    return result;
  }

  /// Проверяем ответ по значению
  bool checkAnswerByValue(String answer) {
    var id = answersList.indexWhere((element) => element.value == answer);
    // если нет в списке (id = -1), то сразу возвращаем false
    return (id == -1) ? false : checkAnswerById(id);
  }


  /// Нормализируем список правильных ответов (убираем признак выбранного ответа)
  _normalizeAnswersList() {
    answersList.asMap().forEach((index, variant) {
      answersList[index].isCorrectAnswer = false;
    });
    _correctAnswer = answersList[0];
  }

  /// Конструктор. На входе:
  /// answersList: список возможных вариантов,
  /// onTimeIsOver: коллбэк вызываемый, когда заканчивается время на ответ,
  /// timeForAnswerInSec: время в секундах на ответ
  QuizGame({
    @required List<QuizVariant> answersList,
    Function() onTimeIsOverCallback,
    int timeForAnswerInSec,
  }) {
    this.timeForAnswer = timeForAnswerInSec;
    this.answersList = answersList;
    this._onTimeIsOverCallback = onTimeIsOverCallback;
    _normalizeAnswersList();
    _resetCounts();
  }

  /// Задаем новый список вариантов
  setNewVariants(List<QuizVariant> answersList) {
    this.answersList = answersList;
    _normalizeAnswersList();
  }

  /// Принудительно задаем правильный ответ по значению
  setCorrectAnswerByValue(String answer) {
    var id = answersList.indexWhere((element) => element.value == answer);
    // Если ответа нет в списке, устанавливаем правильным первый элемент из списка и пишем в лог
    if (id == -1) {
      id = 0;
      logPrint("Попытка задать правильным отсутствующий в списке вариант! Установлен 0 вариант");
    }
    _setCorrectAnswerById(id);
  }

  /// Задаем правильный ответ по номеру и запускаем ожидание ответа
  _setCorrectAnswerById(int id) {
    _correctAnswer = answersList[id];
    _goToWaitAnswer();
  }

}

enum GameState {
  INIT,
  STOP,
  WAIT_ANSWER,
  SHOW_ANSWER,
  TIME_OVER
}