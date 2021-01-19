import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/models/azbuka.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/azbuka_simple_item.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/blind_cube_support_arrays.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/blind_cube.dart';
import 'package:rg2_flutter_getx/models/cube.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/scramble_decision_condition.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class ScrambleGenController extends GetxController {

  @override
  void onInit() {
    print("onInit ScrambleGenerator Controller Start");
    _isEdgeEnabled.value = GetStorage().read(Const.IS_EDGE_ENABLED) ?? true;
    _isCornerEnabled.value = GetStorage().read(Const.IS_CORNER_ENABLED) ?? true;
    _scrambleLength.value = GetStorage().read(Const.SCRAMBLE_LENGTH) ?? 14;
    _currentScramble.value = GetStorage().read(Const.CURRENT_SCRAMBLE) ?? "R F L B U2 L B' R F' D B R L F D R' D L";
    cube.executeScrambleWithReset(currentScramble);
    blindCube = BlindCube(cube: cube, azbuka: Azbuka().currentAzbuka);
    _conditions = blindCube.getDecisionForScramble(currentScramble);
    currentDecision = showDecision ? _conditions.decision : _conditions.decisionInfo;
    super.onInit();
  }

  final _isEdgeEnabled = true.obs;
  bool get isEdgeEnabled => _isEdgeEnabled.value;
  set isEdgeEnabled(bool value) {
    _isEdgeEnabled.value = value;
    GetStorage().write(Const.IS_EDGE_ENABLED, value);
  }

  final _isCornerEnabled = true.obs;
  bool get isCornerEnabled => _isCornerEnabled.value;
  set isCornerEnabled(bool value) {
    _isCornerEnabled.value = value;
    GetStorage().write(Const.IS_CORNER_ENABLED, value);
  }

  final _scrambleLength = 14.obs;
  int get scrambleLength => _scrambleLength.value;
  set scrambleLength(int value) {
    _scrambleLength.value = value;
    GetStorage().write(Const.SCRAMBLE_LENGTH, value);
  }

  final _currentScramble = "R F L B U2 L B' R F' D B R L F D R' D L".obs;
  String get currentScramble => _currentScramble.value;
  set currentScramble(String value) {
    _currentScramble.value = value;
    _inputScramble.value = value;
    GetStorage().write(Const.CURRENT_SCRAMBLE, value);
  }

  final _inputScramble = "".obs;
  String get inputScramble => _inputScramble.value;
  set inputScramble(String value) {
    _inputScramble.value = value;
  }

  final _showDecision = true.obs;
  bool get showDecision => _showDecision.value;
  set showDecision(bool value) {
    currentDecision = value ? _conditions.decision : _conditions.decisionInfo;
    _showDecision.value = value;
    GetStorage().write(Const.SHOW_DECISION, value);
  }

  ScrambleDecisionCondition _conditions;
  final _currentDecision = "()()".obs;
  String get currentDecision => _currentDecision.value;
  set currentDecision(String value) {
    _currentDecision.value = value;
  }

  Cube cube = Cube();
  Cube settingsCube = Cube();
  BlindCube blindCube;

  // создаем observable азбуку, чтобы обновлять ее на экране, при ее изменении
  RxList<AzbukaSimpleItem> _coloredAzbuka = List<AzbukaSimpleItem>().obs;
  List<AzbukaSimpleItem> get coloredAzbuka => _coloredAzbuka;
  set coloredAzbuka (List<AzbukaSimpleItem> value) {
    _coloredAzbuka.assignAll(value);
    Azbuka().currentAzbuka = value.map((v) => v.letter).toList();
  }



  /// Методы

  void tryIncreaseScrambleLength() {
    if (scrambleLength < 40) scrambleLength += 1;
  }

  void tryDecreaseScrambleLength() {
    if (scrambleLength > 3) scrambleLength -= 1;
  }

  void resetScrambleLength() {
    scrambleLength = 14;
  }

  void generateNewScramble() {
    _conditions = blindCube.generateScrambleWithParam(checkEdge: isEdgeEnabled, checkCorner: isCornerEnabled, lenScramble: scrambleLength);
    currentScramble = _conditions.scramble;
    currentDecision = (showDecision) ? _conditions.decision : _conditions.decisionInfo;
  }

  updateInputScrambleText() {
    inputScramble = currentScramble;
  }

  updateCurrentScrambleFromInput() {
    currentScramble = inputScramble;
    cube.executeScrambleWithReset(currentScramble);
    _conditions = blindCube.getDecisionForScramble(currentScramble);
    currentDecision = (showDecision) ? _conditions.decision : _conditions.decisionInfo;
  }

  inputLetter(String letter) {
    switch(letter) {
      case "W":
        inputModifier(letter.toLowerCase());
        break;
      case "2":
        inputModifier(letter);
        break;
      case "'":
        inputModifier(letter);
        break;
      case "DEL":
        inputBackSpace();
        break;

      default:
        print("Default value $letter");
        inputScramble += " $letter";
    }

  }

  inputModifier(String modifier) {
    print("input modifier $modifier");
    inputScramble = inputScramble.trim();
    var lastSymbol = inputScramble[inputScramble.length - 1];
    if (lastSymbol != "" && lastSymbol != "'" && lastSymbol != "2") {
      inputScramble += modifier;
    }
  }

  inputBackSpace() {
    inputScramble = inputScramble.trim();
    var len = inputScramble.length;
    if (len > 0) {
      inputScramble = inputScramble.substring(0, len - 1);
    }
    inputScramble = inputScramble.trim();
  }

  loadMyAzbuka() {
    cube.executeScramble("z'");
    currentAzbuka = Azbuka().currentAzbuka;
  }

  loadMaximAzbuka() {
    cube.executeScramble("z");
    currentAzbuka = Azbuka().currentAzbuka;
  }
}

