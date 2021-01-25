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

    mainCube = BlindCube.colored(colors: Azbuka().currentColorsSide, azbuka: Azbuka().currentAzbuka);
    mainCube.executeScrambleWithReset(currentScramble);
    _conditions = mainCube.getDecisionForScramble(currentScramble);
    currentDecision = showDecision ? _conditions.decision : _conditions.decisionInfo;
    mainColoredAzbuka = mainCube.getColoredAzbuka();

    settingsCube = BlindCube.colored(colors: Azbuka().currentColorsSide, azbuka: Azbuka().currentAzbuka);
    settingsColoredAzbuka = settingsCube.getColoredAzbuka();
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

  final _selectedLetter = "".obs;
  String get selectedLetter => _selectedLetter.value;
  set selectedLetter(String value) {
    _selectedLetter.value = value;
  }

  String _editedLetter = "";
  String get storedLetter => _editedLetter;
  set storedLetter(String letter) {
    if (letter.length > 0) {
      _editedLetter = letter[0];
    } else {
      _editedLetter = "A";
    }
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
  RxList<ColoredAzbukaItem> _settingsColoredAzbuka = List<ColoredAzbukaItem>().obs;
  List<ColoredAzbukaItem> get settingsColoredAzbuka => _settingsColoredAzbuka;
  set settingsColoredAzbuka (List<ColoredAzbukaItem> coloredAzbuka) {
    _settingsColoredAzbuka.assignAll(coloredAzbuka);
    Azbuka().setCurrentColoredAzbuka(coloredAzbuka);
  }

  // создаем observable азбуку, чтобы обновлять куб на экране, при изменении цветов или букв
  RxList<ColoredAzbukaItem> _mainColoredAzbuka = List<ColoredAzbukaItem>().obs;
  List<ColoredAzbukaItem> get mainColoredAzbuka => _mainColoredAzbuka;
  set mainColoredAzbuka (List<ColoredAzbukaItem> value) {
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
    mainColoredAzbuka = mainCube.getColoredAzbuka();
  }

  void updateInputScrambleText() {
    inputScramble = currentScramble;
  }

  void updateCurrentScrambleFromInput() {
    currentScramble = inputScramble;
    updateMainCubePresentation();
  }


  /// Нажатие на кнопку в диалоге ввода скрамбла
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

  /// Нажатие на модификатор хода в диалоге ввода скрамбла (' 2 w)
  void inputModifier(String modifier) {
    print("input modifier $modifier");
    inputScramble = inputScramble.trim();
    var lastSymbol = inputScramble[inputScramble.length - 1];
    if (lastSymbol != "" && lastSymbol != "'" && lastSymbol != "2") {
      inputScramble += modifier;
    }
  }

  /// Нажатие на кнопку DEL в диалоге ввода скрамбла
  void inputBackSpace() {
    inputScramble = inputScramble.trim();
    var len = inputScramble.length;
    if (len > 0) {
      inputScramble = inputScramble.substring(0, len - 1);
    }
    inputScramble = inputScramble.trim();
  }

  /// Представляем кубик в виде 9 строк по 12 элементов из списка элементов куба в 54 элемента
  List<List<ColoredAzbukaItem>> asTableRows(List<ColoredAzbukaItem> cube) {
    List<List<ColoredAzbukaItem>> result = List();

    // заполняем табличку из 108 элементов прозрачными (7), пустыми ("") элементами с индексом 100
    var table = List.generate(108, (_) => ColoredAzbukaItem(index: 100, colorNumber: 7, letter: ""));
    // ставим на свои места значения ячеек кубика
    if (cube.length == 54) {
      for (int i = 0; i < 9; i++) {
        table[(i ~/ 3) * 12 + 3 + i % 3] = cube[i];
        table[(i ~/ 3 + 3) * 12 + i % 3] = cube[i + 9];
        table[(i ~/ 3 + 3) * 12 + 3 + i % 3] = cube[i + 18];
        table[(i ~/ 3 + 3) * 12 + 6 + i % 3] = cube[i + 27];
        table[(i ~/ 3 + 3) * 12 + 9 + i % 3] = cube[i + 36];
        table[(i ~/ 3 + 6) * 12 + 3 + i % 3] = cube[i + 45];
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

  void saveCurrentAzbukaSettings() {
    settingsColoredAzbuka = settingsCube.getColoredAzbuka();
    settingsCube.setDefaultColorsByCurrent();
    mainCube.setDefaultColors(settingsCube.currentColors);
    updateMainCubePresentation();
  }

  void updateMainCubePresentation() {
    mainCube.executeScrambleWithReset(currentScramble);
    mainColoredAzbuka = mainCube.getColoredAzbuka();
    _conditions = mainCube.getDecisionForScramble(currentScramble);
    currentDecision = (showDecision) ? _conditions.decision : _conditions.decisionInfo;
  }


  void loadMyAzbuka() {
    var coloredAzbuka = Azbuka().getMyColoredAzbuka();
    settingsCube.resetByColoredAzbuka(coloredAzbuka);
    saveCurrentAzbukaSettings();
  }

  void loadMaximAzbuka() {
    var coloredAzbuka = Azbuka().getMaximColoredAzbuka();
    settingsCube.resetByColoredAzbuka(coloredAzbuka);
    saveCurrentAzbukaSettings();
  }
  
  void loadCustomAzbuka() {
    var coloredAzbuka = Azbuka().loadCustomColoredAzbuka();
    settingsCube.resetByColoredAzbuka(coloredAzbuka);
    saveCurrentAzbukaSettings();
  }

  void saveCustomAzbuka() {
    var coloredAzbuka = settingsCube.getColoredAzbuka();
    Azbuka().setCurrentColoredAzbuka(coloredAzbuka);
    Azbuka().saveCustomColoredAzbuka();
  }

  void leftArrowButtonPressed() {
    settingsCube.executeScramble("z'");
    saveCurrentAzbukaSettings();
  }

  void rightArrowButtonPressed() {
    settingsCube.executeScramble("z");
    saveCurrentAzbukaSettings();
  }

  void antiClockWiseArrowButtonPressed() {
    settingsCube.executeScramble("y'");
    saveCurrentAzbukaSettings();
  }

  void clockWiseArrowButtonPressed() {
    settingsCube.executeScramble("y");
    saveCurrentAzbukaSettings();
  }

  void selectLetterMinus() {
    var ch = selectedLetter.runes.single;
    switch(selectedLetter) {
      case "Ж": ch = "Ё".runes.single; break;
      case "Ё": ch = "Е".runes.single; break;
      case "А": ch = "Z".runes.single; break;
      case "A": ch = "9".runes.single; break;
      case "0": ch = "Я".runes.single; break;
      default: ch--;
    }
    selectedLetter = String.fromCharCode(ch);

  }

  void selectLetterPlus() {
    var ch = selectedLetter.runes.single;
    switch(selectedLetter) {
      case "Я": ch = "0".runes.single; break;
      case "9": ch = "A".runes.single; break;
      case "Z": ch = "А".runes.single; break;
      case "Е": ch = "Ё".runes.single; break;
      case "Ё": ch = "Ж".runes.single; break;
      default: ch++;
    }
    selectedLetter = String.fromCharCode(ch);
  }

  void selectLetterReset() {
    selectedLetter = storedLetter;
  }

  /// Сохраняем букву в азбуку кубика, а потом по новой азбуке обновляем отображение
  /// в настройках и решение для основного кубика
  void confirmLetterSelection(int index) {
    settingsCube.updateLetterInAzbuka(index, selectedLetter);
    saveCurrentAzbukaSettings();
  }

}

