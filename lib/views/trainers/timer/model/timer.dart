/// Таймер имеет три состояния STOP, PAUSE и PLAY

class Timer {
  //
  TimerState state = TimerState.STOP;

  // время в которое стартовал таймер
  DateTime _startingTime = DateTime.now();

  // время для сохранения, пока таймер на паузе
  Duration _pausedDuration = Duration.zero;

  get isRunning {
    return state == TimerState.PLAY ? true : false;
  }

  /// Методы

  // Стартуем с обнулением времени из STOP или PAUSE
  void start() {
    if (state != TimerState.PLAY) {
      _startingTime = DateTime.now();
      state = TimerState.PLAY;
    }
  }

  // Из любого состояния переводим в STOP и обнуляем таймер паузы
  void stop() {
    state = TimerState.STOP;
    _pausedDuration = Duration.zero;
  }

  // Из STOP нельзя поставить на паузу, только из PLAY
  void pause() {
    if (state == TimerState.PLAY) {
      DateTime now = DateTime.now();
      _pausedDuration = now.difference(_startingTime);
      state = TimerState.PAUSE;
    }
  }

  // Если в PAUSE, то продолжаем, иначе стартуем с обнулением времени
  void resume() {
    if (state == TimerState.PAUSE) {
      _startingTime = DateTime.now().subtract(_pausedDuration);
      state = TimerState.PLAY;
    } else if (state == TimerState.STOP) {
      start();
    }
  }

  // Разница между текущим и сохраненным временем
  Duration getTime() {
    return DateTime.now().difference(_startingTime);
  }


  // Выводим разницу в формате MM:SS.mm
  String getStringTime() {
    // функция добавляющая 0 перед однозначным числом
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    if (state == TimerState.STOP) return "00:00.00";

    var dur = isRunning ? getTime() : _pausedDuration;

    String twoDigitMinutes = twoDigits(dur.inMinutes.remainder(Duration.minutesPerHour) as int);
    String twoDigitSeconds = twoDigits(dur.inSeconds.remainder(Duration.secondsPerMinute) as int);
    String twoDigitMls = twoDigits(dur.inMilliseconds.remainder(1000) ~/ 10);

    return "$twoDigitMinutes:$twoDigitSeconds.$twoDigitMls";
  }

}

enum TimerState {STOP, PAUSE, PLAY}