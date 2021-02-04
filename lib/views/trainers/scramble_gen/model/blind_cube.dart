import 'dart:core';
import 'package:flutter/material.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/trainers/scramble_gen/model/azbuka_simple_item.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/trainers/scramble_gen/model/pair_for_melting.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/trainers/scramble_gen/model/scramble_decision_condition.dart';
import 'blind_cube_support_arrays.dart';
import 'cube.dart';
import 'package:sortedmap/sortedmap.dart';

class BlindCube extends Cube {

  /// Азбука из 54 элементов для блайнда
  List<String> azbuka = List.filled(54, " ");

  BlindCube({this.azbuka}) : super();

  BlindCube.colored({List<int> colors, this.azbuka}) {
    setDefaultColors(colors);
    resetCube();
  }
  
  /// номера центральных элементов кубика (см.диаграмму в конце этого класса)
  static const List<int> _centersPositions = [4, 13, 22, 31, 40, 49];

  /// берем два массива: цвета кубика и азбуку и делаем из них один
  List<ColoredAzbukaItem> getColoredAzbuka() {
    var result = List<ColoredAzbukaItem>();
    var colors = asList;
    colors.asMap().forEach((index, color) {
      result.add(ColoredAzbukaItem(index: index, colorNumber: color, letter: azbuka[index]));
    });
    return result;
  }

  /// на входе - цветная азбука
  /// устанавливаем цвета граней и азбуку по входу и сбрасываем куб
  resetByColoredAzbuka(List<ColoredAzbukaItem> coloredAzbuka) {
    coloredAzbuka.asMap().forEach((index, simpleItem) {
      azbuka[index] = simpleItem.letter;  
    });
    print(azbuka);
    List<int> colors =  _centersPositions.map((pos) => coloredAzbuka[pos].colorNumber).toList();
    setDefaultColors(colors);
    resetCube();
  }

  void updateLetterInAzbuka(int index, String letter) {
    azbuka[index] = letter;
  }

  /// Возвращаем подходящий под условия переплавки скрамбл и перемешиваем по нему кубик
  ScrambleDecisionCondition generateScrambleWithParam({bool checkEdge, bool checkCorner, int lenScramble}) {
    //print("Ищем скрамбл подходящий по параметрам переплавок буфера и длине");
    ScrambleDecisionCondition condition;
    var scramble = "";
    var result = true;
    do {
      //сгенерируем скрамбл длинны указанной в поле ScrambleLength
      scramble = generateScramble(lenScramble);
      //scramble = "B' L U2 D F' U' L F'";   //для него решение для моей азбуки (ТНПРКИХЦЧДО)Эк(БГФЖВЗМ)
      //разбираем кубик по скрамблу
      executeScrambleWithReset(scramble);
      // получаем решение кубика (scramble, decision, isEdgeMelted, isCornerMelted)
      condition = _getDecision(forScramble: scramble);
      var isEdgeMelted = condition.isEdgeMelted;
      var isCornerMelted = condition.isCornerMelted;

      // считаем, что скрамбл соответствует условиям
      result = true;
      // проверяем были ли переплавки
      if (isEdgeMelted && checkEdge) {result = false;}
      if (isCornerMelted && checkCorner) {result = false;}
    //выходим из цикла, если скрамбл соответствует условиям
    } while (!result);
    // Перемешиваем кубик по скрамблу, иначе полуим собранный куб
    executeScrambleWithReset(scramble);
    return condition;
  }

  ///Получаем решение для блайнда для заданного скрамбла и азбуки
  ScrambleDecisionCondition getDecisionForScramble(String scramble) {
    backupCube();
    executeScrambleWithReset(scramble);
    var conditions = _getDecision();
    restoreFromBackup();
    return conditions;
  }

  /// Решаем текущее состояние кубика и возвращаем решение блайнда + были ли переплавки буферов
  /// String solve; bool edgeBuffer; bool cornerBuffer;
  /// можно передать в качестве параметра скрамбл, тогда он будет в решении, иначе скрамбл в решении = ""
  ScrambleDecisionCondition _getDecision({String forScramble = ""}) {
    var decision = "(";
    var isEdgeMelted = false;
    var isCornerMelted = false;

    //решаем ребра
    do {
      //сначала ребра: смотрим что в буфере ребер
      var sumColor = _getColorOfElement(23, 30);
      //если там буферный элемент, т.е. его цвета как цвета верхнего и правого центров (22 и 31 элементы), то ставим признак переплавки
      if ((sumColor == _getColorOfElement(22, 31)) || (sumColor == _getColorOfElement(31, 22))) {
        isEdgeMelted = true;
      }
      // ставим на место ребро из буфера и сохраняем результаты выполнения одной "буквы"
      decision = _edgeBufferSolve(_getEdgePosition(sumColor), decision);
      // выполняем пока все ребра не будут на своих местах
    } while (!_isAllEdgesOnItsPlace().allComplete);

    decision = decision.trim();
    decision += ")";

    // Проверяем нужен ли экватор, и выполняем его если надо
    var solveSize = decision.split(" ").length;
    if (solveSize % 2 != 0 && decision != "()") {
      decision += " Эк";
      _equator();
    }

    //решаем углы
    decision += " (";
    do {
      //сначала ребра: смотрим что в буфере углов (врхняя и левая наклейка заднего левого верхнего угла, т.е. элементы 18 и 11)
      final sumColor = _getColorOfElement(18,11);
      //если там буферный элемент, то ставим признак переплавки (верхний, левый и заднний центры это элементы 22, 13 и 4)
      //если верх белый, то 4,22 = сине-белый, 22,13 = бело-оранжевый, 13,4 = оранжево-синий
      if ((sumColor == _getColorOfElement(4,22)) || (sumColor == _getColorOfElement(22,13)) || (sumColor == _getColorOfElement(13,4))) {
        isCornerMelted = true;
      }
      // ставим на место угол из буфера и сохраняем результаты выполнения одной "буквы"
      decision = _cornerBufferSolve(_getCornerPosition(sumColor), decision);
    // выполняем пока все углы не будут на своих местах
    } while (!_isAllCornersOnItsPlace().allComplete);

    decision = decision.trim();
    decision += ")";

    return ScrambleDecisionCondition(scramble: forScramble, decision: decision, isEdgeMelted: isEdgeMelted, isCornerMelted: isCornerMelted);
  }


  /// Установка на свое место элемента цвета elementPosition находящегося в буфере ребер
  /// Возвращает SolveCube = куб после выполнения установки и решение solve + текущий ход
  String _edgeBufferSolve(int elementPosition, String solve) {
    var solv = solve;

    if (!((elementPosition == 23) || (elementPosition == 30))) { //проверяем, не буфер ли?, если нет, то добоавляем букву к решению
      solv += azbuka[elementPosition] + " "; //если буфер, то будем его переплавлять и букву уже
    } //подставим в рекурсии
    switch (elementPosition) {
      case 1 : _blind1(); break;
      case 3 : _blind3(); break;
      case 5 : _blind5(); break;
      case 7 : _blind7(); break;
      case 10 : _blind10(); break;
      case 12 : _blind12(); break;
      case 14 : _blind14(); break;
      case 16 : _blind16(); break;
      case 19 : _blind19(); break;
      case 21 : _blind21(); break;
      case 23 : // для бело-красного ребра
        var pair4Melting = _isAllEdgesOnItsPlace();
        if (!pair4Melting.allComplete) {
          //переплавляем буфер (рекурсия)
          solv = _meltingEdge(solv, pair4Melting.elementsNotOnPlace);
        }
        break;
      case 25 : _blind25(); break;
      case 28 : _blind28(); break;
      case 30 : //для красно-белого ребра
        var pair4Melting = _isAllEdgesOnItsPlace();
        if (!pair4Melting.allComplete) {
          //переплавляем буфер (рекурсия)
          solv = _meltingEdge(solv, pair4Melting.elementsNotOnPlace);
        }
        break;
      case 32 : _blind32(); break;
      case 34 : _blind34(); break;
      case 37 : _blind37(); break;
      case 39 : _blind39(); break;
      case 41 : _blind41(); break;
      case 43 : _blind43(); break;
      case 46 : _blind46(); break;
      case 48 : _blind48(); break;
      case 50 : _blind50(); break;
      case 52 : _blind52(); break;
    }
    return solv;
  }

  String _meltingEdge(String solv, List<int> edgesListNotOnPlace) {
    var positionToMelting = 0;
    // цикл поиска свободной корзины
    var j = 0;
    while (positionToMelting == 0) {
      var i = 0;
      do {
        // Если ребро не на месте и нашлось в приоритетах, то выбираем его
        if (edgesListNotOnPlace[i] == edgePriority[j]) {
          positionToMelting = edgePriority[j];
        } //ищем ребра на своем месте по приоритету edgePriority
        i++;
      } while (i < edgesListNotOnPlace.length);
      j++;
    }
    //переплавляем буфер (рекурсия)
    return _edgeBufferSolve(positionToMelting, solv);
  }

  /// Проверяем все ли грани на своих местах
  PairForMelting _isAllEdgesOnItsPlace() {
    //предположим что все на местах
    var result = true;

    List<int> edgesListNotOnPlace = List();
    dopEdge.forEach((mainPosition, slavePosition) {
      var mainColor = asList[mainPosition];
      var slaveColor = asList[slavePosition];
      var defaultColor = 0;
      _centersPositions.asMap().forEach((index, position) {
        if (asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
        if (asList[position] == slaveColor) { defaultColor += (index + 1); }
      });
      var itemPosition = mainEdge[defaultColor];
      if (itemPosition != mainPosition) {
        //значит элемент не на месте, сбрасываем флаг и добавляем его в список
        result = false;
        edgesListNotOnPlace.add(mainPosition);
      }
    });

    return PairForMelting(allComplete: result, elementsNotOnPlace: edgesListNotOnPlace);
  }

  /// Получаем позицию ребра, в зависимости от его цвета
  /// цвет в данном случае двухзначное число
  int _getEdgePosition(int color) {
    //определить по цветам центров значение цвета для дефолтного кубика
    var mainColor = (color ~/ 10) - 1;
    var slaveColor = (color % 10) - 1;
    var defaultColor = 0;
    // перебираем центральные элементы кубика и сравниваем их цвет с цветом ребра, получаем цвет в дефолтном кубике (белый верх, зеленый фронт)
    _centersPositions.asMap().forEach((index, position) {
      if (asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
      if (asList[position] == slaveColor) { defaultColor += (index + 1); }
    });
    // возвращаем номер элемента, по таблице для дефолтного кубика
    return mainEdge[defaultColor];
  }

  
  /// Установка на свое место элемента цвета elementPosition находящегося в буфере углов
  /// Возвращает SolveCube = куб после выполнения установки и решение solve + текущий ход
  String _cornerBufferSolve(int elementPosition, String solve) {
    var solv = solve;
    //если с не равно 18,11 или 6, то буфер не на месте и добавляем букву к решению
    if (!(elementPosition == 18 || elementPosition == 11 || elementPosition == 6)) {
      solv += azbuka[elementPosition] + " ";
    }
    switch (elementPosition) {
      case 0 : _blind0(); break;
      case 2 : _blind2(); break;
      case 6 :
        var pair4Melting = _isAllCornersOnItsPlace();
        if (!pair4Melting.allComplete) {
          solv = _meltingCorner(solv, pair4Melting.elementsNotOnPlace);
        }
        break;
      case 8 : _blind8(); break;
      case 9 : _blind9(); break;
      case 11 :
        var pair4Melting = _isAllCornersOnItsPlace();
        if (!pair4Melting.allComplete) {
          solv = _meltingCorner(solv, pair4Melting.elementsNotOnPlace);
        }
        break;
      case 15 : _blind15(); break;
      case 17 : _blind17(); break;
      case 18 :
        var pair4Melting = _isAllCornersOnItsPlace();
        if (!pair4Melting.allComplete) {
          solv = _meltingCorner(solv, pair4Melting.elementsNotOnPlace);
        }
        break;
      case 20 : _blind20(); break;
      case 24 : _blind24(); break;
      case 26 : _blind26(); break;
      case 27 : _blind27(); break;
      case 29 : _blind29(); break;
      case 33 : _blind33(); break;
      case 35 : _blind35(); break;
      case 36 : _blind36(); break;
      case 38 : _blind38(); break;
      case 42 : _blind42(); break;
      case 44 : _blind44(); break;
      case 45 : _blind45(); break;
      case 47 : _blind47(); break;
      case 51 : _blind51(); break;
      case 53 : _blind53(); break;
    }
    return solv;
  }

  /// Переплавка буфера углов
  String _meltingCorner(String solv, List<int> cornersListNotOnPlace) {
    var positionOfElement = 0;
    // цикл поиска свободной корзины
    var j = 0;
    while (positionOfElement == 0) {
      var i = 0;
      do {
        if (cornerPriority[j] == cornersListNotOnPlace[i]) {
          positionOfElement = cornerPriority[j];
        } //ищем ребра на своем месте по приоритету cornerPriority
        i++;
      } while (i < cornersListNotOnPlace.length);
      j++;
    }
    //переплавляем буфер (рекурсия)
    return _cornerBufferSolve(positionOfElement, solv);
  }

  ///проверяем все ли углы на своих местах, т.к. буфер оказался на своем месте
  PairForMelting _isAllCornersOnItsPlace() {
    //предположим что все на местах
    var result = true;
    //Обнуляем список углов стоящих на своих местах
    List<int> cornersListNotOnPlace = List();
    dopCorner.forEach((mainPosition, slavePosition) {
      var mainColor = asList[mainPosition];
      var slaveColor = asList[slavePosition];
      var defaultColor = 0;
      _centersPositions.asMap().forEach((index, position) {
        if (asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
        if (asList[position] == slaveColor) { defaultColor += (index + 1); }
      });
      var itemPosition = mainCorner[defaultColor];
      if (itemPosition != mainPosition) {
        //значит элемент не на месте
        result = false;
        cornersListNotOnPlace.add(mainPosition);
      }
    });

    return PairForMelting(allComplete: result, elementsNotOnPlace: cornersListNotOnPlace);
  }

  /// Получаем позицию угла, в зависимости от его цвета
  /// цвет в данном случае двухзначное число
  int _getCornerPosition(int color) {
    //определить по цветам центров значение цвета для дефолтного кубика
    var mainColor = (color ~/ 10) - 1;
    var slaveColor = (color % 10) - 1;
    var defaultColor = 0;
    // перебираем центральные элементы кубика и сравниваем их цвет с цветом ребра, получаем цвет в дефолтном кубике (белый верх, зеленый фронт)
    _centersPositions.asMap().forEach((index, position) {
      if (asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
      if (asList[position] == slaveColor) { defaultColor += (index + 1); }
    });
    // возвращаем номер элемента, по таблице для дефолтного кубика
    return mainCorner[defaultColor];
  }


  ///получаем цвет переданных ячеек куба (двузначное число, первая и вторая цифры которого соответствую искомым цветам)
  int _getColorOfElement(int firstElement, int secondElement) {
   return (asList[firstElement] + 1) * 10 + asList[secondElement] + 1;
  }

  /// Алгоритм "Запад"
  _west() {
    executeScramble("R U R' U' R' F R2 U' R' U' R U R' F'");
  }

  /// Алгоритм "Юг"
  _south() {
    executeScramble("R U R' F' R U R' U' R' F R2 U' R' U'");
  }

  /// Алгоритм "Экватор"
  _equator() {
    executeScramble("R U R' F' R U2 R' U2 R' F R U R U2 R' U'");
  }

  /// Алгоритм "Австралия"
  _australia() {
    executeScramble("F R U' R' U' R U R' F' R U R' U' R' F R F'");
  }

  //белосинее ребро
  _blind19() {
    executeScramble("M2 D' L2");
    _west();
    executeScramble("L2 D M2");
  }

  //белозеленое
  _blind25() {
    _south();
  }

  //белооранжевое
  _blind21() {
    _west();
  }

  //зеленобелое
  _blind46() {
    executeScramble("M D' L2");
    _west();
    executeScramble("L2 D M'");
  }

  //зеленокрасное
  _blind50() {
    executeScramble("Dw2 L");
    _west();
    executeScramble("L' Dw2");
  }

  //зеленожелтое
  _blind52() {
    executeScramble("M'");
    _south();
    executeScramble("M");
  }

  //зеленооранжевое
  _blind48() {
    executeScramble("L'");
    _west();
    executeScramble("L");
  }

  //синебелое
  _blind7() {
    executeScramble("M");
    _south();
    executeScramble("M'");
  }

  //синекрасное
  _blind5() {
    executeScramble("Dw2 L'");
    _west();
    executeScramble("L Dw2");
  }

  //синежелтое
  _blind1() {
    executeScramble("D2 M'");
    _south();
    executeScramble("M D2");
  }

  //синеоранжевое
  _blind3() {
    executeScramble("L");
    _west();
    executeScramble("L'");
  }

  //оранжевобелое
  _blind14() {
    executeScramble("L2 D M'");
    _south();
    executeScramble("M D' L2");
  }

  //оранжевозеленое
  _blind16() {
    executeScramble("Dw' L");
    _west();
    executeScramble("L' Dw");
  }

  //оранжевожелтое
  _blind12() {
    executeScramble("D M'");
    _south();
    executeScramble("M D'");
  }

  //оранжевосинее
  _blind10() {
    executeScramble("Dw L'");
    _west();
    executeScramble("L Dw'");
  }

  //краснозеленое
  _blind34() {
    executeScramble("Dw' L'");
    _west();
    executeScramble("L Dw");
  }

  //красножелтое
  _blind32() {
    executeScramble("D' M'");
    _south();
    executeScramble("M D");
  }

  //красносинее
  _blind28() {
    executeScramble("Dw L");
    _west();
    executeScramble("L' Dw'");
  }

  //желтосинее
  _blind37() {
    executeScramble("D L2");
    _west();
    executeScramble("L2 D'");
  }

  //желтокрасное
  _blind39() {
    executeScramble("D2 L2");
    _west();
    executeScramble("L2 D2");
  }

  //желтозеленое
  _blind43() {
    executeScramble("D' L2");
    _west();
    executeScramble("L2 D");
  }

  //желтооранжевое
  _blind41() {
    executeScramble("L2");
    _west();
    executeScramble("L2");
  }

//--------------------------------------------------------------------------------------------------

  //белосинекрасный угол
  _blind20() {
    executeScramble("R D' F'");
    _australia();
    executeScramble("F D R'");
  }

  //белокраснозеленый угол
  _blind26() {
    _australia();
  }

  //белозеленооранжевый угол
  _blind24() {
    executeScramble("F' D R");
    _australia();
    executeScramble("R' D' F");
  }

  //зеленооранжевобелый
  _blind45() {
    executeScramble("F' D F'");
    _australia();
    executeScramble("F D' F");
  }

  //зеленобелосиний
  _blind47() {
    executeScramble("F R");
    _australia();
    executeScramble("R' F'");
  }

  //зеленокрасножелтый
  _blind53() {
    executeScramble("R");
    _australia();
    executeScramble("R'");
  }

  //зеленожелтооранжевый
  _blind51() {
    executeScramble("D F'");
    _australia();
    executeScramble("F D'");
  }

  //синекраснобелый
  _blind8() {
    executeScramble("R'");
    _australia();
    executeScramble("R");
  }

  //синежелтокрасный
  _blind2() {
    executeScramble("D' F'");
    _australia();
    executeScramble("F D");
  }

  //синеоранжевожелтый
  _blind0() {
    executeScramble("D2 R");
    _australia();
    executeScramble("R' D2");
  }

  //оранжевобелозеленый
  _blind17() {
    executeScramble("F");
    _australia();
    executeScramble("F'");
  }

  //оранжевозеленожелтый
  _blind15() {
    executeScramble("D R");
    _australia();
    executeScramble("R' D'");
  }

  //оранжевожелтосиний
  _blind9() {
    executeScramble("D2 F'");
    _australia();
    executeScramble("F D2");
  }

  //краснобелосиний
  _blind27() {
    executeScramble("R2 F'");
    _australia();
    executeScramble("F R2");
  }

  //краснозеленобелый
  _blind33() {
    executeScramble("R' F'");
    _australia();
    executeScramble("F R");
  }

  //красножелтозеленый
  _blind35() {
    executeScramble("F'");
    _australia();
    executeScramble("F");
  }

  //красносинежелтый
  _blind29() {
    executeScramble("R F'");
    _australia();
    executeScramble("F R'");
  }

  //желтосинеоранжевый
  _blind38() {
    executeScramble("D' R2");
    _australia();
    executeScramble("R2 D");
  }

  //желтокрасносиний
  _blind36() {
    executeScramble("R2");
    _australia();
    executeScramble("R2");
  }

  //желтозеленокрасный
  _blind42() {
    executeScramble("D R2");
    _australia();
    executeScramble("R2 D'");
  }

  //желтооранжевозеленый
  _blind44() {
    executeScramble("D2 R2");
    _australia();
    executeScramble("R2 D2");
  }

///       Расположение элементов в кубике
///
///                0   1   2
///                3   4   5
///                6   7   8
///    9  10  11  18  19  20  27  28  29  36  37  38
///   12  13  14  21  22  23  30  31  32  39  40  41
///   15  16  17  24  25  26  33  34  35  42  43  44
///               45  46  47
///               48  49  50
///               51  52  53


}
