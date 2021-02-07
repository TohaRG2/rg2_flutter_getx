import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/model/timer.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_settings_controller.dart';

class TimerController extends GetxController {
  final TimerSettingsController _settingsController = Get.find();
  final Repository _repository = Get.find();
  final assetsAudioPlayer = AssetsAudioPlayer();
  var sound = Audio("assets/sounds/metronom.mp3");

  @override
  void onReady() {
    print("TimerController onReady");
    super.onReady();
  }

  @override
  void onInit() async {
    print("TimerController onInit");
    _showBars();
    //var duration = await player.setAsset('metronom.mp3');
    super.onInit();
  }

  @override
  void dispose() {
    print("TimerController dispose");
    super.dispose();
  }

  bool get _isOneHanded => _settingsController.isOneHanded;

  final _currentTime = "00:00.00".obs;
  String get currentTime => _currentTime.value;
  set currentTime(String value) {
    _currentTime.value = value;
  }

  final _scramble = "".obs;
  String get scramble => _scramble.value;
  set scramble(value) {
    _scramble.value = value;
  }

  final _showTopBar = true.obs;
  bool get showTopBar => _showTopBar.value;
  set showTopBar(value) {
    _showTopBar.value = value;
  }

  final _showSaveResultBar = false.obs;
  bool get showSaveResultBar => _showSaveResultBar.value;
  set showSaveResultBar(value) {
    _showSaveResultBar.value = value;
  }

  final _showBottomBar = true.obs;
  bool get showBottomBar => _showBottomBar.value;
  set showBottomBar(value) {
    _showBottomBar.value = value;
  }

  final _bottomBarHeight = (0.0).obs;
  double get bottomBarHeight => _bottomBarHeight.value;
  set bottomBarHeight(double value) {
    _bottomBarHeight.value = value;
  }

  final _leftIndicatorState = 0.obs;
  int get leftIndicatorState => _leftIndicatorState.value;
  set leftIndicatorState(int value) {
    _leftIndicatorState.value = value;
  }

  final _rightIndicatorState = 0.obs;
  int get rightIndicatorState => _rightIndicatorState.value;
  set rightIndicatorState(int value) {
    _rightIndicatorState.value = value;
  }

  //TODO подумать на сколько нужно делать obs переменную?
  final _comment = "".obs;
  String get comment => _comment.value;
  set comment(value) {
    _comment.value = value;
  }

  Timer _timer = Timer();
  TimerControllerState _state = TimerControllerState.stopped;
  DateTime _secondBarPressingTime = DateTime.now();
  var _isLeftPadPressed = false;
  var _isRightPadPressed = false;

  /// Methods

  trySetBottomBarHeight(double newValue) {
    if (bottomBarHeight == 0) {
      bottomBarHeight = newValue;
    }
  }

  /// Обработчики нажатий на панельки таймера

  onPauseTap() {
    switch(_state) {
      case TimerControllerState.pause: _continueTimer(); break;
      case TimerControllerState.running: _pauseTimer(); break;
      default:
        break;
    }
  }
  
  onLeftPanelTouch() {
    _updateIndicatorState(leftPadPressed: true, rightPadPressed: null);
    _panelTouchStart();
  }

  onRightPanelTouch() {
    _updateIndicatorState(leftPadPressed: null, rightPadPressed: true);
    _panelTouchStart();
  }

  _panelTouchStart() {
    switch (_state) {
      case TimerControllerState.stopped: _firstPadPressedToStart(); break;
      case TimerControllerState.onePadPressedToStart: _secondPadPressedToStart(); break;
      case TimerControllerState.running: _firstPadPressedToStop(); break;
      case TimerControllerState.onePadPressedToStop: _secondPadPressedToStop(); break;
      default:
        print("Info! Нет обработчика для onPanelTouch in $_state state.");
        break;
    }
  }

  onLeftPanelTouchCancel() {
    _updateIndicatorState(leftPadPressed: false, rightPadPressed: null);
    panelTouchCancel();
  }

  onRightPanelTouchCancel() {
    _updateIndicatorState(leftPadPressed: null, rightPadPressed: false);
    panelTouchCancel();
  }

  void panelTouchCancel() {
    switch (_state) {
      case TimerControllerState.onePadPressedToStart: _onePadPressingCancel(); break;
      case TimerControllerState.twoPadPressedToStart: _backToOnlyOnePadPressed(); break;
      case TimerControllerState.ready: _startTimer(); break;
      case TimerControllerState.onePadPressedToStop: _onePadStopPressingCancel(); break;
      case TimerControllerState.waitForCancelPressing: _tryToFullStopTimer(); break;
      default:
        print("Info! onPanelTouchCancel in $_state state.");
        break;
    }
  }


  _firstPadPressedToStart() {
    _state = TimerControllerState.onePadPressedToStart;
    showSaveResultBar = false;
    if (_isOneHanded) {
      _secondPadPressedToStart();
    }
  }

  _secondPadPressedToStart() {
    _state = TimerControllerState.twoPadPressedToStart;
    //leftIndicatorState = 1; rightIndicatorState = 1;
    _secondBarPressingTime = DateTime.now();
    _tryChangeStateToReady();
  }

  _tryChangeStateToReady() async{
    //Задаем задержку 0 или 500мс в зависимости от настройки
    Duration _delay = (_settingsController.isDelayedStart)
        ? Duration(milliseconds: 500)
        : Duration(milliseconds: 0);
    await Future.delayed(_delay, () {});
    //Если за время ожидания _secondBarPressingTime не менялся (+ задержка будет не больше чем текущее время),
    // то переводим в статус READY, а кружки в зеленый
    if (!_secondBarPressingTime.add(_delay).isAfter(DateTime.now()) && _state == TimerControllerState.twoPadPressedToStart) {
      _changeStateToReady();
    }
  }

  _changeStateToReady() {
    leftIndicatorState = 2; rightIndicatorState = 2;
    _state = TimerControllerState.ready;
  }

  _firstPadPressedToStop() {
    if (_isOneHanded) {
      _secondPadPressedToStop();
    } else {
      _state = TimerControllerState.onePadPressedToStop;
    }
  }

  _secondPadPressedToStop() {
    _state = TimerControllerState.stopped;
    _stopTimer();
  }

  _onePadPressingCancel() {
    _state = TimerControllerState.stopped;
  }

  _onePadStopPressingCancel() {
    _state = TimerControllerState.running;
  }
  
  _backToOnlyOnePadPressed() {
    if (_isOneHanded) {
      _onePadPressingCancel();
    } else {
      _state = TimerControllerState.onePadPressedToStart;
    }
  }

  _startTimer() {
    print("Start Timer");
    _state = TimerControllerState.running;
    _timer.start();
    _hideBars();
    _showAsyncTimerTime();
    if (_settingsController.isMetronomEnabled) {
      _playAsyncSound();
    }
  }

  _stopTimer() {
    print("Stop Timer");
    _state = TimerControllerState.waitForCancelPressing;
    _timer.stop();
    _showBars();
    _updateIndicatorState(leftPadPressed: false, rightPadPressed: false);
  }

  _updateIndicatorState({bool leftPadPressed, bool rightPadPressed}) {
    _isLeftPadPressed = leftPadPressed ?? _isLeftPadPressed;
    _isRightPadPressed = rightPadPressed ?? _isRightPadPressed;
    //print("updateIndicatorState: лев.- $_isLeftPadPressed пр.- $_isRightPadPressed, state = $_state");
    if (_isOneHanded) {
      leftIndicatorState = _isLeftPadPressed || _isRightPadPressed ? 1 : 0;
      rightIndicatorState = _isLeftPadPressed || _isRightPadPressed ? 1 : 0;
    } else {
      leftIndicatorState = _isLeftPadPressed ? 1 : 0;
      rightIndicatorState = _isRightPadPressed ? 1 : 0;
    }
  }

  _showAsyncTimerTime() async {
    while ( _state != TimerControllerState.waitForCancelPressing && _state != TimerControllerState.stopped) {
      currentTime = _timer.getFormattedCurrentTime();
      // обновляем с задержкой 16 мс, т.е. примерно 60 раз в секунду
      await Future.delayed(Duration(milliseconds: 16), () {});
    }
    currentTime = _timer.getFormattedSavedTime();
  }

  _playAsyncSound() async {
    // вычисляем паузу в милисекундах, делим минуту (60 000мс) на кол-во тиков в минуту
    var tikPause = Duration(milliseconds: 60000 ~/ _settingsController.metronomFrequency);
    var nextTikTime = DateTime.now();
    // выходим из цикла если таймер остановлен
    while ( _state != TimerControllerState.waitForCancelPressing && _state != TimerControllerState.stopped) {
      if (DateTime.now().isAfter(nextTikTime)) {
        assetsAudioPlayer.open(sound);
        nextTikTime = nextTikTime.add(tikPause);
      }
      await Future.delayed(Duration(milliseconds: 100), () {});
    }
  }

  _tryToFullStopTimer() {
    if (_isLeftPadPressed == false && _isRightPadPressed == false) {
      _state = TimerControllerState.stopped;
      showSaveResultBar = true;
    }
  }

  _pauseTimer() {
    print("Pause Timer");
    _state = TimerControllerState.pause;
    _timer.pause();
  }

  _continueTimer() {
    print("Continue Timer");
    _state = TimerControllerState.running;
    _timer.resume();
  }

  _showBars() {
    showBottomBar = true;
    showTopBar = true;
  }

  _hideBars() {
    showBottomBar = false;
    showTopBar = false;
  }

  resetTimer() {
    _timer.stop();
    currentTime = _timer.getFormattedCurrentTime();
  }

  cancelSavingResult() {
    showSaveResultBar = false;
  }

  saveCurrentResult() async {
    showSaveResultBar = false;
    _saveCurrentResultToBase("");
  }

  saveCurrentResultWithComment() {
    showSaveResultBar = false;
    _saveCurrentResultToBase("SomeComment");
  }

  _saveCurrentResultToBase(String comment) async {
    var solvingTime = _timer.getFormattedSavedTime();
    var _scramble = _settingsController.showScramble ? scramble : "";
    var timeNote = TimeNoteItem(solvingTime, DateTime.now(), _scramble, comment);
    _repository.addTimeNoteItem(timeNote);
    var list = await _repository.getAllTimeNoteList();
    print(list);
  }
  
}

/// Состояния контроллера таймера
enum TimerControllerState {
  stopped,
  onePadPressedToStart,
  twoPadPressedToStart,
  ready,
  running,
  pause,
  onePadPressedToStop,
  waitForCancelPressing,
}

