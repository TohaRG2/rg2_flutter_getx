/// Таймер имеет три состояния STOP, PAUSE и PLAY, возвращает занчение в getStringTime()
/// если он в STOP - возвращает "00:00.00"
/// если в PAUSE - возвращает время сохраненное при пстановке на паузу в _pausedDuration
/// если в PLAY - возвращает разницу между временем старта и текущим

class Timer {
  //
  TimerState _state = TimerState.STOP;

  // время в которое стартовал таймер
  DateTime _startingTime = DateTime.now();

  // время для сохранения, пока таймер на паузе
  Duration _pausedDuration = Duration.zero;

  get isRunning {
    return _state == TimerState.PLAY ? true : false;
  }

  /// Методы

  // Стартуем с обнулением времени из STOP или PAUSE
  void start() {
    if (_state != TimerState.PLAY) {
      _startingTime = DateTime.now();
      _state = TimerState.PLAY;
    }
  }

  // Из любого состояния переводим в STOP и обнуляем таймер паузы
  void stop() {
    _state = TimerState.STOP;
    _pausedDuration = Duration.zero;
  }

  // Из STOP нельзя поставить на паузу, только из PLAY
  void pause() {
    if (_state == TimerState.PLAY) {
      DateTime now = DateTime.now();
      _pausedDuration = now.difference(_startingTime);
      _state = TimerState.PAUSE;
    }
  }

  // Если в PAUSE, то продолжаем, иначе стартуем с обнулением времени
  void resume() {
    if (_state == TimerState.PAUSE) {
      _startingTime = DateTime.now().subtract(_pausedDuration);
      _state = TimerState.PLAY;
    } else if (_state == TimerState.STOP) {
      start();
    }
  }

  // Разница между текущим и сохраненным временем
  Duration getDuration() {
    switch (_state) {
      case TimerState.STOP: return Duration.zero; break;
      case TimerState.PAUSE: return _pausedDuration; break;
      default: return DateTime.now().difference(_startingTime); break;
    }
  }


  // Выводим разницу в формате MM:SS.mm
  String getStringTime() {
    // функция добавляющая 0 перед однозначным числом
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    var dur = getDuration();

    String twoDigitMinutes = twoDigits(dur.inMinutes.remainder(Duration.minutesPerHour) as int);
    String twoDigitSeconds = twoDigits(dur.inSeconds.remainder(Duration.secondsPerMinute) as int);
    String twoDigitMls = twoDigits(dur.inMilliseconds.remainder(1000) ~/ 10);

    return "$twoDigitMinutes:$twoDigitSeconds.$twoDigitMls";
  }

}

enum TimerState {STOP, PAUSE, PLAY}