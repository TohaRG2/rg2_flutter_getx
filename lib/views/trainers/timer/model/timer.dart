class Timer {
  //
  TimerState state;

  // время в которое стартовал таймер
  DateTime _startingTime = DateTime.now();

  // время для сохранения, пока таймер на паузе
  Duration _pausedTime = Duration(milliseconds: 0);


  /// Методы

  void start() {
    _startingTime = DateTime.now();
    state = TimerState.PLAY;
  }

  void stop() {
    state = TimerState.STOP;
  }

  void pause() {
    DateTime now = DateTime.now();
    _pausedTime = now.
  }

}

enum TimerState {STOP, PAUSE, PLAY}