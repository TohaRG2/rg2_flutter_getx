import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/model/timer.dart';

class TimerController extends GetxController {
  ScrambleGenController _genController = Get.find();

  @override
  void onReady() {
    print("TimerController onReady");
    super.onReady();
  }

  @override
  void onInit() {
    print("TimerController onInit");
    super.onInit();
  }

  final _time = ''.obs;
  set time(value) => _time.value = value;
  get time => _time.value;

  final _isOneHanded = false.obs;
  bool get isOneHanded => _isOneHanded.value;
  set isOneHanded(value) {
    _isOneHanded.value = value;
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

  final _currentTime = "00:00.00".obs;
  String get currentTime => _currentTime.value;
  set currentTime(String value) {
    _currentTime.value = value;
  }

  Timer _timer = Timer();
  TimerControllerState _state = TimerControllerState.stopped;
  Duration _delay = Duration(milliseconds: 500);
  DateTime _secondBarPressingTime = DateTime.now();
  var _isLeftPadPressed = false;
  var _isRightPadPressed = false;

  /// Methods

  trySetBottomBarHeight(double newValue) {
    if (bottomBarHeight == 0) {
      bottomBarHeight = newValue;
    }
  }

  generateNewScrambleWithGeneratorParameters() {
    scramble = _genController.getNewScramble();
  }

  updateScrambleFromGenerator() {
    scramble = _genController.currentScramble;
  }

  /// Обработчики нажатий на панельки таймера

  onLeftPanelTouch() {
    updateIndicatorState(leftPadPressed: true, rightPadPressed: null);
    panelTouchStart();
  }

  onRightPanelTouch() {
    updateIndicatorState(leftPadPressed: null, rightPadPressed: true);
    panelTouchStart();
  }

  void panelTouchStart() {
    switch (_state) {
      case TimerControllerState.stopped: firstPadPressedToStart(); break;
      case TimerControllerState.onePadPressedToStart: secondPadPressedToStart(); break;
      case TimerControllerState.running: firstPadPressedToStop(); break;
      case TimerControllerState.onePadPressedToStop: secondPadPressedToStop(); break;
      default:
        print("Info! Нет обработчика для onPanelTouch in $_state state.");
        break;
    }
  }

  onLeftPanelTouchCancel() {
    updateIndicatorState(leftPadPressed: false, rightPadPressed: null);
    panelTouchCancel();
  }

  onRightPanelTouchCancel() {
    updateIndicatorState(leftPadPressed: null, rightPadPressed: false);
    panelTouchCancel();
  }

  void panelTouchCancel() {
    switch (_state) {
      case TimerControllerState.twoPadPressedToStart: backToOnlyOnePadPressed(); break;
      case TimerControllerState.ready: startTimer(); break;
      case TimerControllerState.waitForCancelPressing: tryToFullStopTimer(); break;
      default:
        print("Info! onPanelTouchCancel in $_state state.");
        break;
    }
  }


  firstPadPressedToStart() {
    _state = TimerControllerState.onePadPressedToStart;
  }

  secondPadPressedToStart() {
    _state = TimerControllerState.twoPadPressedToStart;
    //leftIndicatorState = 1; rightIndicatorState = 1;
    _secondBarPressingTime = DateTime.now();
    tryChangeStateToReady();
  }

  tryChangeStateToReady() async{
    //Если старт с задержкой, то ждем иначе уменьшаем resetPressedTime, чтобы сразу перевести в READY
    //TODO добавить проверку на старт с задержкой
    await Future.delayed(_delay, () {});
    //Если за время ожидания _secondBarPressingTime не менялся (+ задержка будет не больше чем текущее время),
    // то переводим в статус READY, а кружки в зеленый
    if (!_secondBarPressingTime.add(_delay).isAfter(DateTime.now()) && _state == TimerControllerState.twoPadPressedToStart) {
      changeStateToReady();
    }
  }

  changeStateToReady() {
    leftIndicatorState = 2; rightIndicatorState = 2;
    _state = TimerControllerState.ready;
  }

  firstPadPressedToStop() {
    _state = TimerControllerState.onePadPressedToStop;
  }

  secondPadPressedToStop() {
    _state = TimerControllerState.stopped;
    stopTimer();
  }

  onePadPressingCancel() {
    _state = TimerControllerState.stopped;
  }
  
  backToOnlyOnePadPressed() {
    _state = TimerControllerState.onePadPressedToStart;
  }


  startTimer() {
    print("Start Timer");
    _state = TimerControllerState.running;
    _timer.start();
    showAsyncTimerTime();
  }

  stopTimer() {
    print("Stop Timer");
    _state = TimerControllerState.waitForCancelPressing;
    _timer.stop();
    updateIndicatorState(leftPadPressed: false, rightPadPressed: false);
  }

  updateIndicatorState({bool leftPadPressed, bool rightPadPressed}) {
    _isLeftPadPressed = leftPadPressed ?? _isLeftPadPressed;
    _isRightPadPressed = rightPadPressed ?? _isRightPadPressed;
    print("updateIndicatorState: лев.- $_isLeftPadPressed пр.- $_isRightPadPressed, state = $_state");
    if (isOneHanded) {
      leftIndicatorState = _isLeftPadPressed || _isRightPadPressed ? 1 : 0;
      rightIndicatorState = _isLeftPadPressed || _isRightPadPressed ? 1 : 0;
    } else {
      leftIndicatorState = _isLeftPadPressed ? 1 : 0;
      rightIndicatorState = _isRightPadPressed ? 1 : 0;
    }
  }

  showAsyncTimerTime() async {
    while (_state != TimerControllerState.pause && _state != TimerControllerState.waitForCancelPressing) {
      currentTime = _timer.getStringTime();
      // обновляем с задержкой 16 мс, т.е. примерно 60 раз в секунду
      await Future.delayed(Duration(milliseconds: 16), () {});
    }
    currentTime = _timer.getPausedStringTime();
  }

  resetTimer() {
    _timer.stop();
    currentTime = _timer.getStringTime();
  }

  tryToFullStopTimer() {
    if (_isLeftPadPressed == false && _isRightPadPressed == false) {
      _state = TimerControllerState.stopped;
    }
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

