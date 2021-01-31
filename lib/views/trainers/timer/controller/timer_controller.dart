import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';

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

  /// Methods

  onRightPanelTouch() {
    print("Нажали на правую плашку");
    showBottomBar = true;
  }

  onRightPanelTouchCancel() {
    print("Отпустили правую плашку");
  }

  onLeftPanelTouch() {
    print("Нажали на левую плашку");
    showBottomBar = false;
  }

  onLeftPanelTouchCancel() {
    print("Отпустили левую плашку");
  }

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

}