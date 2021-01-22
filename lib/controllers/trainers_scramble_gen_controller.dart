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
    mainCube = BlindCube(azbuka: Azbuka().currentAzbuka);
    mainCube.executeScrambleWithReset(currentScramble);
    settingsCube = BlindCube(azbuka: Azbuka().currentAzbuka);
    _conditions = mainCube.getDecisionForScramble(currentScramble);
    currentDecision = showDecision ? _conditions.decision : _conditions.decisionInfo;

    settingsColoredAzbuka = settingsCube.getColoredAzbuka();
    mainColoredAzbuka = mainCube.getColoredAzbuka(withLetters: false);
    super.onInit();
  }

  BlindCube settingsCube;
  BlindCube mainCube;

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

  // создаем observable азбуку, чтобы обновлять куб на экране, при изменении цветов или букв
  RxList<AzbukaSimpleItem> _settingsColoredAzbuka = List<AzbukaSimpleItem>().obs;
  List<AzbukaSimpleItem> get settingsColoredAzbuka => _settingsColoredAzbuka;
  set settingsColoredAzbuka (List<AzbukaSimpleItem> value) {
    _settingsColoredAzbuka.assignAll(value);
    Azbuka().currentAzbuka = value.map((v) => v.letter).toList();
  }

  // создаем observable азбуку, чтобы обновлять куб на экране, при изменении цветов или букв
  RxList<AzbukaSimpleItem> _mainColoredAzbuka = List<AzbukaSimpleItem>().obs;
  List<AzbukaSimpleItem> get mainColoredAzbuka => _mainColoredAzbuka;
  set mainColoredAzbuka (List<AzbukaSimpleItem> value) {
    _mainColoredAzbuka.assignAll(value);
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
    _conditions = mainCube.generateScrambleWithParam(checkEdge: isEdgeEnabled, checkCorner: isCornerEnabled, lenScramble: scrambleLength);
    currentScramble = _conditions.scramble;
    currentDecision = (showDecision) ? _conditions.decision : _conditions.decisionInfo;
    mainColoredAzbuka = mainCube.getColoredAzbuka(withLetters: false);
  }

  void updateInputScrambleText() {
    inputScramble = currentScramble;
  }

  void updateCurrentScrambleFromInput() {
    currentScramble = inputScramble;
    mainCube.executeScrambleWithReset(currentScramble);
    _conditions = mainCube.getDecisionForScramble(currentScramble);
    currentDecision = (showDecision) ? _conditions.decision : _conditions.decisionInfo;
    mainColoredAzbuka = mainCube.getColoredAzbuka(withLetters: false);
  }

  void inputLetter(String letter) {
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

  void inputModifier(String modifier) {
    print("input modifier $modifier");
    inputScramble = inputScramble.trim();
    var lastSymbol = inputScramble[inputScramble.length - 1];
    if (lastSymbol != "" && lastSymbol != "'" && lastSymbol != "2") {
      inputScramble += modifier;
    }
  }

  void inputBackSpace() {
    inputScramble = inputScramble.trim();
    var len = inputScramble.length;
    if (len > 0) {
      inputScramble = inputScramble.substring(0, len - 1);
    }
    inputScramble = inputScramble.trim();
  }

  /// Представляем кубик в виде 9 строк по 12 элементов из списка элементов куба в 54 элемента
  List<List<AzbukaSimpleItem>> asTableRows(List<AzbukaSimpleItem> cube) {
    List<List<AzbukaSimpleItem>> result = List();

    // заполняем табличку из 108 элементов прозрачными (7), пустыми ("") элементами
    var table = List.generate(108, (_) => AzbukaSimpleItem(colorNumber: 7, letter: ""));
    // ставим на свои места значения ячеек кубика
    if (cube.length == 54) {
      for (int i = 0; i < 9; i++) {
        table[(i ~/ 3) * 12 + 3 + i % 3] = cube[i];
        table[(i ~/ 3 + 3) * 12 + i % 3] = cube[i + 9];
        table[(i ~/ 3 + 3) * 12 + 3 + i % 3] = cube[i + 18];
        table[(i ~/ 3 + 3) * 12 + 6 + i % 3] = cube[i + 27];
        table[(i ~/ 3 + 3) * 12 + 9 + i % 3] = cube[i + 36];
        table[(i ~/ 3 + 6) * 12 + 3 + i % 3] = cube[i + 45];;
      }
    }
    // разобьем table на строки по 12 элементов (9 строк)
    var i = 0;
    while (i < table.length) {
      var row = table.getRange(i , (i + 12)).toList();
      result.add(row);
      i += 12;
    }
    return result;
  }


  void loadMyAzbuka() {
    settingsCube.executeScramble("z'");

    //TODO сделать сохранение азбуки + переопредление сторон кубика одним методом
    {
      settingsColoredAzbuka = settingsCube.getColoredAzbuka();
      mainColoredAzbuka = settingsCube.getColoredAzbuka(withLetters: false);
      mainCube.setDefaultColors(settingsCube.currentColors);
      settingsCube.setDefaultColorsByCurrent();
      mainCube.executeScrambleWithReset(currentScramble);
    }
  }

  void loadMaximAzbuka() {
    settingsCube.executeScramble("z");
    settingsColoredAzbuka = settingsCube.getColoredAzbuka();
    mainCube.setDefaultColors(settingsCube.currentColors);
    settingsCube.setDefaultColorsByCurrent();
    mainCube.executeScrambleWithReset(currentScramble);
    mainColoredAzbuka = mainCube.getColoredAzbuka(withLetters: false);
  }
}

