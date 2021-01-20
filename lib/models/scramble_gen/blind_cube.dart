import 'dart:core';
import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/azbuka_simple_item.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/pair_for_melting.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/scramble_decision_condition.dart';
import 'blind_cube_support_arrays.dart';
import '../cube.dart';
import 'package:sortedmap/sortedmap.dart';

class BlindCube {
  /// Представление кубика в виде непрерывного списка из 54 элементов (6 граней * 9 наклеек на каждой)
  final Cube cube;
  /// Азбука из 54 элементов для блайнда
  List<String> azbuka = List.filled(54, " ");

  BlindCube({this.cube, this.azbuka});
  
  /// номера центральных элементов кубика (см.диаграмму в конце этого класса)
  static const List<int> _centersPositions = [4, 13, 22, 31, 40, 49];

  /// берем два массива: цвета кубика и азбуку и делаем из них один
  List<AzbukaSimpleItem> get coloredAzbuka {
    var colors = cube.asList;
    List<AzbukaSimpleItem> result = List();
    colors.asMap().forEach((index, color) {
      result.add(AzbukaSimpleItem(colorNumber: color, letter: azbuka[index]));
    });
    return result;
  }

  /// Возвращаем подходящий под условия переплавки скрамбл и перемешиваем по нему кубик
  ScrambleDecisionCondition generateScrambleWithParam({bool checkEdge, bool checkCorner, int lenScramble}) {
    //print("Ищем скрамбл подходящий по параметрам переплавок буфера и длине");
    ScrambleDecisionCondition condition;
    var scramble = "";
    var result = true;
    do {
      result = true;
      //сгенерируем скрамбл длинны указанной в поле ScrambleLength
      scramble = cube.generateScramble(lenScramble);
      //scramble = "B' L U2 D F' U' L F'";   //для него решение для моей азбуки (ТНПРКИХЦЧДО)Эк(БГФЖВЗМ)
      //разбираем кубик по скрамблу
      cube.executeScrambleWithReset(scramble);
      // получаем решение кубика (solve, isEdgeMelted, isCornerMelted)
      condition = _getDecision(azbuka);
      var isEdgeMelted = condition.isEdgeMelted;
      var isCornerMelted = condition.isCornerMelted;

      condition.scramble = scramble;
      print(condition);

      if (isEdgeMelted && checkEdge) {result = false;}
      if (isCornerMelted && checkCorner) {result = false;}
    } while (!result);
    // Перемешиваем кубик по скрамблу, иначе полуим собранный куб
    cube.executeScrambleWithReset(scramble);
    return condition;
  }

  ///Получаем решение для блайнда для заданного скрамбла и азбуки
  ScrambleDecisionCondition getDecisionForScramble(String scramble) {
    cube.backupCube();
    cube.executeScrambleWithReset(scramble);
    var conditions = _getDecision(azbuka);
    cube.restoreFromBackup();
    return conditions;
  }

  /// Решаем текущее состояние кубика и возвращаем решение блайнда + были ли переплавки буферов
  /// String solve; bool edgeBuffer; bool cornerBuffer; 
  ScrambleDecisionCondition _getDecision(List<String> azbuka) {
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
      decision = _edgeBufferSolve(getEdgePosition(sumColor), decision, azbuka);
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
      decision = _cornerBufferSolve(getCornerPosition(sumColor), decision, azbuka);
    // выполняем пока все углы не будут на своих местах
    } while (!_isAllCornersOnItsPlace().allComplete);

    decision = decision.trim();
    decision += ")";

    return ScrambleDecisionCondition(decision: decision, isEdgeMelted: isEdgeMelted, isCornerMelted: isCornerMelted);
  }


  /// Установка на свое место элемента цвета elementPosition находящегося в буфере ребер
  /// Возвращает SolveCube = куб после выполнения установки и решение solve + текущий ход
  String _edgeBufferSolve(int elementPosition, String solve, List<String> azbuka) {
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
          solv = _meltingEdge(solv, pair4Melting.elementsNotOnPlace, azbuka);
        }
        break;
      case 25 : _blind25(); break;
      case 28 : _blind28(); break;
      case 30 : //для красно-белого ребра
        var pair4Melting = _isAllEdgesOnItsPlace();
        if (!pair4Melting.allComplete) {
          //переплавляем буфер (рекурсия)
          solv = _meltingEdge(solv, pair4Melting.elementsNotOnPlace, azbuka);
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

  String _meltingEdge(String solv, List<int> edgesListNotOnPlace, List<String> azbuka) {
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
    return _edgeBufferSolve(positionToMelting, solv, azbuka);
  }

  /// Проверяем все ли грани на своих местах
  PairForMelting _isAllEdgesOnItsPlace() {
    //предположим что все на местах
    var result = true;

    List<int> edgesListNotOnPlace = List();
    dopEdge.forEach((mainPosition, slavePosition) {
      var mainColor = cube.asList[mainPosition];
      var slaveColor = cube.asList[slavePosition];
      var defaultColor = 0;
      _centersPositions.asMap().forEach((index, position) {
        if (cube.asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
        if (cube.asList[position] == slaveColor) { defaultColor += (index + 1); }
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
  int getEdgePosition(int color) {
    //определить по цветам центров значение цвета для дефолтного кубика
    var mainColor = (color ~/ 10) - 1;
    var slaveColor = (color % 10) - 1;
    var defaultColor = 0;
    // перебираем центральные элементы кубика и сравниваем их цвет с цветом ребра, получаем цвет в дефолтном кубике (белый верх, зеленый фронт)
    _centersPositions.asMap().forEach((index, position) {
      if (cube.asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
      if (cube.asList[position] == slaveColor) { defaultColor += (index + 1); }
    });
    // возвращаем номер элемента, по таблице для дефолтного кубика
    return mainEdge[defaultColor];
  }

  
  /// Установка на свое место элемента цвета elementPosition находящегося в буфере углов
  /// Возвращает SolveCube = куб после выполнения установки и решение solve + текущий ход
  String _cornerBufferSolve(int elementPosition, String solve, List<String> azbuka) {
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
          solv = _meltingCorner(solv, pair4Melting.elementsNotOnPlace, azbuka);
        }
        break;
      case 8 : _blind8(); break;
      case 9 : _blind9(); break;
      case 11 :
        var pair4Melting = _isAllCornersOnItsPlace();
        if (!pair4Melting.allComplete) {
          solv = _meltingCorner(solv, pair4Melting.elementsNotOnPlace, azbuka);
        }
        break;
      case 15 : _blind15(); break;
      case 17 : _blind17(); break;
      case 18 :
        var pair4Melting = _isAllCornersOnItsPlace();
        if (!pair4Melting.allComplete) {
          solv = _meltingCorner(solv, pair4Melting.elementsNotOnPlace, azbuka);
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
  String _meltingCorner(String solv, List<int> cornersListNotOnPlace, List<String> azbuka) {
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
    return _cornerBufferSolve(positionOfElement, solv, azbuka);
  }

  ///проверяем все ли углы на своих местах, т.к. буфер оказался на своем месте
  PairForMelting _isAllCornersOnItsPlace() {
    //предположим что все на местах
    var result = true;
    //Обнуляем список углов стоящих на своих местах
    List<int> cornersListNotOnPlace = List();
    dopCorner.forEach((mainPosition, slavePosition) {
      var mainColor = cube.asList[mainPosition];
      var slaveColor = cube.asList[slavePosition];
      var defaultColor = 0;
      _centersPositions.asMap().forEach((index, position) {
        if (cube.asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
        if (cube.asList[position] == slaveColor) { defaultColor += (index + 1); }
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
  int getCornerPosition(int color) {
    //определить по цветам центров значение цвета для дефолтного кубика
    var mainColor = (color ~/ 10) - 1;
    var slaveColor = (color % 10) - 1;
    var defaultColor = 0;
    // перебираем центральные элементы кубика и сравниваем их цвет с цветом ребра, получаем цвет в дефолтном кубике (белый верх, зеленый фронт)
    _centersPositions.asMap().forEach((index, position) {
      if (cube.asList[position] == mainColor) { defaultColor += (index + 1) * 10; }
      if (cube.asList[position] == slaveColor) { defaultColor += (index + 1); }
    });
    // возвращаем номер элемента, по таблице для дефолтного кубика
    return mainCorner[defaultColor];
  }


  ///получаем цвет переданных ячеек куба (двузначное число, первая и вторая цифры которого соответствую искомым цветам)
  int _getColorOfElement(int firstElement, int secondElement) {
   return (cube.asList[firstElement] + 1) * 10 + cube.asList[secondElement] + 1;
  }

  /// Алгоритм "Запад"
  _west() {
    cube.executeScramble("R U R' U' R' F R2 U' R' U' R U R' F'");
  }

  /// Алгоритм "Юг"
  _south() {
    cube.executeScramble("R U R' F' R U R' U' R' F R2 U' R' U'");
  }

  /// Алгоритм "Экватор"
  _equator() {
    cube.executeScramble("R U R' F' R U2 R' U2 R' F R U R U2 R' U'");
  }

  /// Алгоритм "Австралия"
  _australia() {
    cube.executeScramble("F R U' R' U' R U R' F' R U R' U' R' F R F'");
  }

  //белосинее ребро
  _blind19() {
    cube.executeScramble("M2 D' L2");
    _west();
    cube.executeScramble("L2 D M2");
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
    cube.executeScramble("M D' L2");
    _west();
    cube.executeScramble("L2 D M'");
  }

  //зеленокрасное
  _blind50() {
    cube.executeScramble("Dw2 L");
    _west();
    cube.executeScramble("L' Dw2");
  }

  //зеленожелтое
  _blind52() {
    cube.executeScramble("M'");
    _south();
    cube.executeScramble("M");
  }

  //зеленооранжевое
  _blind48() {
    cube.executeScramble("L'");
    _west();
    cube.executeScramble("L");
  }

  //синебелое
  _blind7() {
    cube.executeScramble("M");
    _south();
    cube.executeScramble("M'");
  }

  //синекрасное
  _blind5() {
    cube.executeScramble("Dw2 L'");
    _west();
    cube.executeScramble("L Dw2");
  }

  //синежелтое
  _blind1() {
    cube.executeScramble("D2 M'");
    _south();
    cube.executeScramble("M D2");
  }

  //синеоранжевое
  _blind3() {
    cube.executeScramble("L");
    _west();
    cube.executeScramble("L'");
  }

  //оранжевобелое
  _blind14() {
    cube.executeScramble("L2 D M'");
    _south();
    cube.executeScramble("M D' L2");
  }

  //оранжевозеленое
  _blind16() {
    cube.executeScramble("Dw' L");
    _west();
    cube.executeScramble("L' Dw");
  }

  //оранжевожелтое
  _blind12() {
    cube.executeScramble("D M'");
    _south();
    cube.executeScramble("M D'");
  }

  //оранжевосинее
  _blind10() {
    cube.executeScramble("Dw L'");
    _west();
    cube.executeScramble("L Dw'");
  }

  //краснозеленое
  _blind34() {
    cube.executeScramble("Dw' L'");
    _west();
    cube.executeScramble("L Dw");
  }

  //красножелтое
  _blind32() {
    cube.executeScramble("D' M'");
    _south();
    cube.executeScramble("M D");
  }

  //красносинее
  _blind28() {
    cube.executeScramble("Dw L");
    _west();
    cube.executeScramble("L' Dw'");
  }

  //желтосинее
  _blind37() {
    cube.executeScramble("D L2");
    _west();
    cube.executeScramble("L2 D'");
  }

  //желтокрасное
  _blind39() {
    cube.executeScramble("D2 L2");
    _west();
    cube.executeScramble("L2 D2");
  }

  //желтозеленое
  _blind43() {
    cube.executeScramble("D' L2");
    _west();
    cube.executeScramble("L2 D");
  }

  //желтооранжевое
  _blind41() {
    cube.executeScramble("L2");
    _west();
    cube.executeScramble("L2");
  }

//--------------------------------------------------------------------------------------------------

  //белосинекрасный угол
  _blind20() {
    cube.executeScramble("R D' F'");
    _australia();
    cube.executeScramble("F D R'");
  }

  //белокраснозеленый угол
  _blind26() {
    _australia();
  }

  //белозеленооранжевый угол
  _blind24() {
    cube.executeScramble("F' D R");
    _australia();
    cube.executeScramble("R' D' F");
  }

  //зеленооранжевобелый
  _blind45() {
    cube.executeScramble("F' D F'");
    _australia();
    cube.executeScramble("F D' F");
  }

  //зеленобелосиний
  _blind47() {
    cube.executeScramble("F R");
    _australia();
    cube.executeScramble("R' F'");
  }

  //зеленокрасножелтый
  _blind53() {
    cube.executeScramble("R");
    _australia();
    cube.executeScramble("R'");
  }

  //зеленожелтооранжевый
  _blind51() {
    cube.executeScramble("D F'");
    _australia();
    cube.executeScramble("F D'");
  }

  //синекраснобелый
  _blind8() {
    cube.executeScramble("R'");
    _australia();
    cube.executeScramble("R");
  }

  //синежелтокрасный
  _blind2() {
    cube.executeScramble("D' F'");
    _australia();
    cube.executeScramble("F D");
  }

  //синеоранжевожелтый
  _blind0() {
    cube.executeScramble("D2 R");
    _australia();
    cube.executeScramble("R' D2");
  }

  //оранжевобелозеленый
  _blind17() {
    cube.executeScramble("F");
    _australia();
    cube.executeScramble("F'");
  }

  //оранжевозеленожелтый
  _blind15() {
    cube.executeScramble("D R");
    _australia();
    cube.executeScramble("R' D'");
  }

  //оранжевожелтосиний
  _blind9() {
    cube.executeScramble("D2 F'");
    _australia();
    cube.executeScramble("F D2");
  }

  //краснобелосиний
  _blind27() {
    cube.executeScramble("R2 F'");
    _australia();
    cube.executeScramble("F R2");
  }

  //краснозеленобелый
  _blind33() {
    cube.executeScramble("R' F'");
    _australia();
    cube.executeScramble("F R");
  }

  //красножелтозеленый
  _blind35() {
    cube.executeScramble("F'");
    _australia();
    cube.executeScramble("F");
  }

  //красносинежелтый
  _blind29() {
    cube.executeScramble("R F'");
    _australia();
    cube.executeScramble("F R'");
  }

  //желтосинеоранжевый
  _blind38() {
    cube.executeScramble("D' R2");
    _australia();
    cube.executeScramble("R2 D");
  }

  //желтокрасносиний
  _blind36() {
    cube.executeScramble("R2");
    _australia();
    cube.executeScramble("R2");
  }

  //желтозеленокрасный
  _blind42() {
    cube.executeScramble("D R2");
    _australia();
    cube.executeScramble("R2 D'");
  }

  //желтооранжевозеленый
  _blind44() {
    cube.executeScramble("D2 R2");
    _australia();
    cube.executeScramble("R2 D2");
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
