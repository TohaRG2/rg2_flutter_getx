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
    _isLeftPadPressed = true;
    updateIndicatorState();
    switch (_state) {
      case TimerControllerState.stopped: leftIndicatorState = firstPadPressedToStart(); break;
      case TimerControllerState.onePadPressedToStart: secondPadPressedToStart(); break;
      case TimerControllerState.running: leftIndicatorState = firstPadPressedToStop(); break;
      case TimerControllerState.onePadPressedToStop: secondPadPressedToStop(); break;
      case TimerControllerState.running: stopTimer(); break;
      default:
        print("Ahtung!! onLeftPanelTouch in $_state state. Таймер будет переведен в стояние stopped");
        _state = TimerControllerState.stopped;
        break;
    }
  }

  onLeftPanelTouchCancel() {
    _isLeftPadPressed = false;
    updateIndicatorState();
    leftIndicatorState = 0;
  }

  onRightPanelTouch() {
    _isRightPadPressed = true;
    updateIndicatorState();
    switch (_state) {
      case TimerControllerState.stopped: rightIndicatorState = firstPadPressedToStart(); break;
      case TimerControllerState.onePadPressedToStart: secondPadPressedToStart(); break;
      case TimerControllerState.running: rightIndicatorState = firstPadPressedToStop(); break;
      case TimerControllerState.onePadPressedToStop: secondPadPressedToStop(); break;
      default:
        print("Info! onLeftPanelTouch in $_state state.");
        break;
    }
  }

  onRightPanelTouchCancel() {
    _isRightPadPressed = false;
    updateIndicatorState();
    switch (_state) {
      case TimerControllerState.twoPadPressedToStart: rightIndicatorState = backToOnlySinglePadPressed(); break;
      case TimerControllerState.ready: startTimer(); break;
    }
  }


  int firstPadPressedToStart() {
    _state = TimerControllerState.onePadPressedToStart;
    return 1;
  }

  secondPadPressedToStart() {
    _state = TimerControllerState.twoPadPressedToStart;
    leftIndicatorState = 1; rightIndicatorState = 1;
    _secondBarPressingTime = DateTime.now();
    tryChangeStateToReady();
  }

  tryChangeStateToReady() async{
    //Если старт с задержкой, то ждем иначе уменьшаем resetPressedTime, чтобы сразу перевести в READY
    //TODO добавить проверку на старт с задержкой
    await Future.delayed(_delay, () {});
    //Если за время ожидания _secondBarPressingTime не менялся (+ задержка будет не больше чем текущее время),
    // то переводим в статус READY, а кружки в зеленый
    if (!_secondBarPressingTime.add(_delay).isAfter(DateTime.now())) {
      changeStateToReady();
    }
  }

  changeStateToReady() {
    leftIndicatorState = 2; rightIndicatorState = 2;
    _state = TimerControllerState.ready;
  }

  int firstPadPressedToStop() {
    _state = TimerControllerState.onePadPressedToStop;
    return 1;
  }

  secondPadPressedToStop() {
    _state = TimerControllerState.waitForReset;
  }

  backToOnlySinglePadPressed() {
    _state = TimerControllerState.onePadPressedToStart;
    return 0;
  }


  startTimer() {
    _state = TimerControllerState.running;
    _timer.start();
  }

  stopTimer() {
    _state = TimerControllerState.waitForReset;
    _timer.stop();
  }

  updateIndicatorState(bool leftPadPressed, bool rightPadPressed) {
    print("updateIndicatorState: лев.- $_isLeftPadPressed пр.- $_isRightPadPressed");
    if (isOneHanded) {
      leftIndicatorState = _isLeftPadPressed || _isRightPadPressed ? 1 : 0;
      rightIndicatorState = _isLeftPadPressed || _isRightPadPressed ? 1 : 0;
    } else {
      leftIndicatorState = _isLeftPadPressed ? 1 : 0;
      rightIndicatorState = _isRightPadPressed ? 1 : 0;
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
  waitForReset,
}

