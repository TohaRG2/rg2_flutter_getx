import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

import 'blind_cube_support_arrays.dart';

///
/// Сущность для представления кубика
///

class Cube {

  /// Представление кубика в виде непрерывного списка из 54 элементов (6 граней * 9 наклеек на каждой)
  List<int> _cube = List.filled(54, 0);
  List<int> get asList => _cube;

  /// Бэкап кубика
  List<int> _backup = [];

  /// Цвета сторон кубика
  /// 0 - синий, 1 - оранжевый, 2 - белый, 3 - красный, 4 - желтый, 5 - зеленый
  /// + 2 цвета (обычно интерпретируются как 6 - черный и 7 - прозрачный)
  List<int> _defaultColorsSide = [0,1,2,3,4,5,6,7];

  /// номера центральных элементов кубика (см.диаграмму в конце этого класса)
  static const List<int> _centersPositions = [4, 13, 22, 31, 40, 49];

  /// Список из 6-ти текущих цветов в кубике (его центров)
  List<int> get currentColorsNumbers => _centersPositions.map((pos) => asList[pos]).toList();

  List<Color> get currentCenterColors => _centersPositions.map((e) => cubeColor[_cube[e]]).toList();
  
  /// номера элементов для 3хстороннего PLL
  static const List<int> _3sideElements = [11, 14, 17, 45, 46, 47, 33, 30, 27];

  /// возвращаем список из 9-ти цветов (верхних боковых элементов) для отображения PLL с 3-х сторон
  List<Color> get threeSidePllColors => _3sideElements.map((e) => cubeColor[_cube[e]]).toList();

  /// номера элементов для 2хстороннего PLL
  static const List<int> _2sideElements = [45, 46, 47, 33, 30, 27];

  /// возвращаем список из 6-ти цветов (верхних боковых элементов) для отображения PLL с 2-х сторон
  List<Color> get twoSidePllColors => _2sideElements.map((e) => cubeColor[_cube[e]]).toList();

  /// Конструкторы
  Cube() {
    resetCube();
  }

  /// Устанавливаем цвета в кубике в зависимости от переданного параметра
  setDefaultColors(List<int> list) {
    if (list.length < 9) {
      list.asMap().forEach((index, colorNum) {
        _defaultColorsSide[index] = colorNum;
      });
    }
  }

  /// Устанавливаем цвета в кубике по цветам текущих центров
  setDefaultColorsByCurrent() {
    currentColorsNumbers.asMap().forEach((index, colorNum) {
        _defaultColorsSide[index] = colorNum;
    });
  }


  /// Обнуляем кубик (возвращаем в исходное состояние)
  void resetCube() {
    print ("resetCube");
    for(int i=0; i < _cube.length; i++){
      _cube[i] = _defaultColorsSide[i ~/ 9];
    }
  }

  /// Генерируем случайный скрамбл заданной длины
  String generateScramble(int length) {
    print("Генерируем новый скрамбл длинны $length");
    var random = Random();
    var scramble = "";
    //счетчик количества сгенерированных позиций в скрамбле
    var i = 0;
    var prevRandom = random.nextInt(6);     //генерируем число от 0 до 5
    var prevPrevRandom = random.nextInt(6);     //генерируем число от 0 до 5
    var map = { 0 : "R", 1 : "L", 2 : "F", 3 : "B", 4 : "U", 5 : "D"};    //располагаем парами RL, FB, UD

    do {
      var curRandom = random.nextInt(6);
      //Не повторяем одно вращение два раза,
      if (curRandom != prevRandom) {
        //но оно может быть парным (RL UD FB), при условии, что предыдущий ход был не парный, т.е. не равен текущему
        //т.е. R L R - нельзя, а R F R - можно и D L R - можно
        if ((curRandom ~/ 2 != prevRandom ~/ 2) || (curRandom != prevPrevRandom)) {
          i++;
          scramble += "${map[curRandom]}";
          // выбираем модификатор, т.е. ход будет обычный, против часовой или двойной
          var modifier = random.nextInt(3);
          if (modifier == 0) {
            scramble += " "; //просто пробел
          } else if (modifier == 1) {
            scramble += "' "; //добавляем ' с пробелом
          } else if (modifier == 2) {
            scramble += "2 "; //добавляем 2 с пробелом
          }
          prevPrevRandom = prevRandom;
          prevRandom = curRandom;
        }
      }
    } while (i < length);

    return scramble.trim();
  }

  /// Переопределяем метод, чтобы вывести кубик (цвета) в виде таблицы в текстовом виде, для вывода в консоль
  @override
  String toString() {
    var result = "";
    var table = asTable();
    for(int i=0; i < table.length; i++) {
      if (i % 12 == 0) {
        result += "\n";
      }
      result += "${table[i]} ";
    }
    result = result.replaceAll("7", " ");
    return result;
  }

  /// Представляем кубик в виде таблицы из 108 элементов (9 строк по 12 элементов) в пустых ячейках 7
  List<int> asTable() {
    // заполняем табличку прозрачными пустыми элементами
    List<int> table = List.generate(108, (_) => 7);
    // ставим на свои места значения ячеек кубика
    for(int i=0; i < 9; i++) {
      table[(i ~/3) * 12 + 3 + i % 3] = _cube[i];
      table[(i ~/3 + 3) * 12 + i % 3] = _cube[i + 9];
      table[(i ~/3 + 3) * 12 + 3 + i % 3] = _cube[i + 18];
      table[(i ~/3 + 3) * 12 + 6 + i % 3] = _cube[i + 27];
      table[(i ~/3 + 3) * 12 + 9 + i % 3] = _cube[i + 36];
      table[(i ~/3 + 6) * 12 + 3 + i % 3] = _cube[i + 45];
    }
    return table;
  }

  /// Применяем скрамбл к текущему положению кубика
  executeScramble(String scramble) {
    var normalizedScramble = _normalizeScramble(scramble);
    List<String> list = normalizedScramble.split(" ");
    list.forEach((element) {
      switch(element) {
        case "R"  :  _moveR();   break;
        case "R1" :  _moveRb();  break;
        case "R2" :  _moveR2();  break;
        case "F"  :  _moveF();   break;
        case "F1" :  _moveFb();  break;
        case "F2" :  _moveF2();  break;
        case "U"  :  _moveU();   break;
        case "U1" :  _moveUb();  break;
        case "U2" :  _moveU2();  break;
        case "L"  :  _moveL();   break;
        case "L1" :  _moveLb();  break;
        case "L2" :  _moveL2();  break;
        case "B"  :  _moveB();   break;
        case "B1" :  _moveBb();  break;
        case "B2" :  _moveB2();  break;
        case "D"  :  _moveD();   break;
        case "D1" :  _moveDb();  break;
        case "D2" :  _moveD2();  break;
        case "E"  :  _moveE();   break;
        case "E1" :  _moveEb();  break;
        case "E2" :  _moveE2();  break;
        case "M"  :  _moveM();   break;
        case "M1" :  _moveMb();  break;
        case "M2" :  _moveM2();  break;
        case "S"  :  _moveS();   break;
        case "S1" :  _moveSb();  break;
        case "S2" :  _moveS2();  break;
        case "RW" :  _moveRw();  break;
        case "RW1":  _moveRwb(); break;
        case "RW2":  _moveRw2(); break;
        case "RW21": _moveRw2(); break;
        case "UW" :  _moveUw();  break;
        case "UW1":  _moveUwb(); break;
        case "UW2":  _moveUw2(); break;
        case "DW" :  _moveDw();  break;
        case "DW1":  _moveDwb(); break;
        case "DW2":  _moveDw2(); break;
        case "LW" :  _moveLw();  break;
        case "LW1":  _moveLwb(); break;
        case "LW2":  _moveLw2(); break;
        case "FW" :  _moveFw();  break;
        case "FW1":  _moveFwb(); break;
        case "FW2":  _moveFw2(); break;
        case "BW" :  _moveBw();  break;
        case "BW1":  _moveBwb(); break;
        case "BW2":  _moveBw2(); break;
        case "Z"  :  _moveZ();   break;
        case "Z1" :  _moveZb();  break;
        case "Z2" :  _moveZ2();  break;
        case "X"  :  _moveX();   break;
        case "X1" :  _moveXb();  break;
        case "X2" :  _moveX2();  break;
        case "Y"  :  _moveY();   break;
        case "Y1" :  _moveYb();  break;
        case "Y2" :  _moveY2();  break;
      }
    });
  }
  
  /// Применяем скрамбл предварительно обнулив кубик
  executeScrambleWithReset(String scramble) {
    resetCube();
    executeScramble(scramble);
  }

  /// Преобразуем скрамбл из вида (r U') к Rw U1
  String _normalizeScramble(String scramble){
    scramble = scramble.replaceAll("'", "1");
    scramble = scramble.replaceAll("r", "Rw");
    scramble = scramble.replaceAll("l", "Lw");
    scramble = scramble.replaceAll("u", "Uw");
    scramble = scramble.replaceAll("d", "Dw");
    scramble = scramble.replaceAll("f", "Fw");
    scramble = scramble.replaceAll("b", "Bw");
    scramble = scramble.replaceAll("(", "");
    scramble = scramble.replaceAll(")", "");
    scramble = scramble.replaceAll("[", "");
    scramble = scramble.replaceAll("]", "");
    scramble = scramble.replaceAll("  ", " ");
    return scramble.replaceAll("21", "2").toUpperCase();
  }

  /// Сохраняем в backup копию текущего кубика
  backupCube() {
    _backup = _cube.toList();
  }
  
  /// Восстанавливаем из копии, если она есть или обнуляем куб
  restoreFromBackup() {
    if (_backup.length == 54) {
      _cube = _backup.toList();
    } else {
      resetCube();
    }
  }

  /// берем цвета из currentColors и обновляем их в _colorsSide, чтобы кубик сбрасывался уже к новому начальному состоянию
  updateDefaultColorsToCurrent() {
    currentColorsNumbers.asMap().forEach((index, value) {
      _defaultColorsSide[index] = value;
    });
  }

  ///
  /// Элементарные ходы
  ///

  _changeElements(int firstElement, int secondElement) {
    int buf = _cube[firstElement];
    _cube[firstElement] = _cube[secondElement];
    _cube[secondElement] = buf;
  }
  
  _moveR() {
    _changeElements(20, 2);
    _changeElements(23, 5);
    _changeElements(26, 8);
    _changeElements(20, 42);
    _changeElements(23, 39);
    _changeElements(26, 36);
    _changeElements(20, 47);
    _changeElements(23, 50);
    _changeElements(26, 53);
    //Меняем бок
    _changeElements(27, 29);
    _changeElements(27, 35);
    _changeElements(27, 33);
    _changeElements(30, 28);
    _changeElements(30, 32);
    _changeElements(30, 34);
  }

  _moveRb() {
    //Меняем фронт
    _changeElements(20, 47);
    _changeElements(23, 50);
    _changeElements(26, 53);
    _changeElements(20, 42);
    _changeElements(23, 39);
    _changeElements(26, 36);
    _changeElements(20, 2);
    _changeElements(23, 5);
    _changeElements(26, 8);
    //Меняем бок
    _changeElements(27, 33);
    _changeElements(27, 35);
    _changeElements(27, 29);
    _changeElements(30, 34);
    _changeElements(30, 32);
    _changeElements(30, 28);
  }

  _moveR2() {
    _moveR();
    _moveR();
  }

  _moveF() {
    //Меняем фронт
    _changeElements(26, 35);
    _changeElements(25, 34);
    _changeElements(24, 33);
    _changeElements(26, 44);
    _changeElements(25, 43);
    _changeElements(24, 42);
    _changeElements(26, 17);
    _changeElements(25, 16);
    _changeElements(24, 15);
    //Меняем бок
    _changeElements(46, 50);
    _changeElements(46, 52);
    _changeElements(46, 48);
    _changeElements(45, 47);
    _changeElements(45, 53);
    _changeElements(45, 51);
  }

  _moveFb() {
    //Меняем фронт
    _changeElements(26, 17);
    _changeElements(25, 16);
    _changeElements(24, 15);
    _changeElements(26, 44);
    _changeElements(25, 43);
    _changeElements(24, 42);
    _changeElements(26, 35);
    _changeElements(25, 34);
    _changeElements(24, 33);
    //Меняем бок
    _changeElements(46, 48);
    _changeElements(46, 52);
    _changeElements(46, 50);
    _changeElements(45, 51);
    _changeElements(45, 53);
    _changeElements(45, 47);
  }

  _moveF2() {
    _moveF();
    _moveF();
  }

  _moveU() {
    //Меняем фронт
    _changeElements(45, 11);
    _changeElements(46, 14);
    _changeElements(47, 17);
    _changeElements(45, 8);
    _changeElements(46, 7);
    _changeElements(47, 6);
    _changeElements(45, 33);
    _changeElements(46, 30);
    _changeElements(47, 27);
    //Меняем бок
    _changeElements(26, 24);
    _changeElements(26, 18);
    _changeElements(26, 20);
    _changeElements(25, 21);
    _changeElements(25, 19);
    _changeElements(25, 23);
  }

  _moveUb() {
    //Меняем фронт
    _changeElements(45, 33);
    _changeElements(46, 30);
    _changeElements(47, 27);
    _changeElements(45, 8);
    _changeElements(46, 7);
    _changeElements(47, 6);
    _changeElements(45, 11);
    _changeElements(46, 14);
    _changeElements(47, 17);
    //Меняем бок
    _changeElements(26, 20);
    _changeElements(26, 18);
    _changeElements(26, 24);
    _changeElements(25, 23);
    _changeElements(25, 19);
    _changeElements(25, 21);
  }

  _moveU2() {
    _moveU();
    _moveU();
  }

  _moveL() {
    //Меняем фронт
    _changeElements(18, 45);
    _changeElements(21, 48);
    _changeElements(24, 51);
    _changeElements(18, 44);
    _changeElements(21, 41);
    _changeElements(24, 38);
    _changeElements(18, 0);
    _changeElements(21, 3);
    _changeElements(24, 6);
    //Меняем бок
    _changeElements(11, 17);
    _changeElements(11, 15);
    _changeElements(11, 9);
    _changeElements(14, 16);
    _changeElements(14, 12);
    _changeElements(14, 10);
  }

  _moveLb() {
    //Меняем фронт
    _changeElements(18, 0);
    _changeElements(21, 3);
    _changeElements(24, 6);
    _changeElements(18, 44);
    _changeElements(21, 41);
    _changeElements(24, 38);
    _changeElements(18, 45);
    _changeElements(21, 48);
    _changeElements(24, 51);
    //Меняем бок
    _changeElements(11, 9);
    _changeElements(11, 15);
    _changeElements(11, 17);
    _changeElements(14, 10);
    _changeElements(14, 12);
    _changeElements(14, 16);
  }

  _moveL2() {
    _moveL();
    _moveL();
  }

  _moveB() {
    //Меняем фронт
    _changeElements(18, 9);
    _changeElements(19, 10);
    _changeElements(20, 11);
    _changeElements(18, 36);
    _changeElements(19, 37);
    _changeElements(20, 38);
    _changeElements(18, 27);
    _changeElements(19, 28);
    _changeElements(20, 29);
    //Меняем бок
    _changeElements(7, 3);
    _changeElements(7, 1);
    _changeElements(7, 5);
    _changeElements(8, 6);
    _changeElements(8, 0);
    _changeElements(8, 2);
  }

  _moveBb() {
    //Меняем фронт
    _changeElements(18, 27);
    _changeElements(19, 28);
    _changeElements(20, 29);
    _changeElements(18, 36);
    _changeElements(19, 37);
    _changeElements(20, 38);
    _changeElements(18, 9);
    _changeElements(19, 10);
    _changeElements(20, 11);
    //Меняем бок
    _changeElements(7, 5);
    _changeElements(7, 1);
    _changeElements(7, 3);
    _changeElements(8, 2);
    _changeElements(8, 0);
    _changeElements(8, 6);
  }

  _moveB2() {
    _moveB();
    _moveB();
  }

  _moveD() {
  // Меняем фронт
    _changeElements(51, 35);
    _changeElements(52, 32);
    _changeElements(53, 29);
    _changeElements(51, 2);
    _changeElements(52, 1);
    _changeElements(53, 0);
    _changeElements(51, 9);
    _changeElements(52, 12);
    _changeElements(53, 15);
  // Меняем бок
    _changeElements(43, 39);
    _changeElements(43, 37);
    _changeElements(43, 41);
    _changeElements(42, 36);
    _changeElements(42, 38);
    _changeElements(42, 44);
  }

  _moveDb() {
    //Меняем фронт
    _changeElements(51, 9);
    _changeElements(52, 12);
    _changeElements(53, 15);
    _changeElements(51, 2);
    _changeElements(52, 1);
    _changeElements(53, 0);
    _changeElements(51, 35);
    _changeElements(52, 32);
    _changeElements(53, 29);
    //Меняем бок
    _changeElements(43, 41);
    _changeElements(43, 37);
    _changeElements(43, 39);
    _changeElements(42, 44);
    _changeElements(42, 38);
    _changeElements(42, 36);
  }

  _moveD2() {
    _moveD();
    _moveD();
  }

  _moveE() {
    _changeElements(48, 34);
    _changeElements(49, 31);
    _changeElements(50, 28);
    _changeElements(48, 5);
    _changeElements(49, 4);
    _changeElements(50, 3);
    _changeElements(48, 10);
    _changeElements(49, 13);
    _changeElements(50, 16);
  }

  _moveEb() {
    _changeElements(48, 10);
    _changeElements(49, 13);
    _changeElements(50, 16);
    _changeElements(48, 5);
    _changeElements(49, 4);
    _changeElements(50, 3);
    _changeElements(48, 34);
    _changeElements(49, 31);
    _changeElements(50, 28);
  }

  _moveE2() {
    _moveE();
    _moveE();
  }

  _moveM() {
    _changeElements(19, 46);
    _changeElements(22, 49);
    _changeElements(25, 52);
    _changeElements(19, 43);
    _changeElements(22, 40);
    _changeElements(25, 37);
    _changeElements(19, 1);
    _changeElements(22, 4);
    _changeElements(25, 7);
  }

  _moveMb() {
    _changeElements(19, 1);
    _changeElements(22, 4);
    _changeElements(25, 7);
    _changeElements(19, 43);
    _changeElements(22, 40);
    _changeElements(25, 37);
    _changeElements(19, 46);
    _changeElements(22, 49);
    _changeElements(25, 52);
  }

  _moveM2() {
    _moveM();
    _moveM();
  }

  _moveS() {
    _changeElements(21, 30);
    _changeElements(22, 31);
    _changeElements(23, 32);
    _changeElements(21, 39);
    _changeElements(22, 40);
    _changeElements(23, 41);
    _changeElements(21, 12);
    _changeElements(22, 13);
    _changeElements(23, 14);
  }

  _moveSb() {
    _changeElements(21, 12);
    _changeElements(22, 13);
    _changeElements(23, 14);
    _changeElements(21, 39);
    _changeElements(22, 40);
    _changeElements(23, 41);
    _changeElements(21, 30);
    _changeElements(22, 31);
    _changeElements(23, 32);
  }

  _moveS2() {
    _moveS();
    _moveS();
  }

  _moveRw() {    //Uw - верхние два слоя
    _moveR();
    _moveMb();
  }

  _moveRwb() {   //Uw' - верхние два слоя
    _moveRb();
    _moveM();
  }

  _moveRw2() {     //Uw2 - верхние два слоя
    _moveRw();
    _moveRw();
  }

  _moveUw() {   //Uw - верхние два слоя
    _moveU();
    _moveEb();
  }

  _moveUwb() {   //Uw' - верхние два слоя
    _moveUb();
    _moveE();
  }

  _moveUw2() {   //Uw2 - верхние два слоя
    _moveUw();
    _moveUw();
  }

  _moveDw() {      //Dw - нижние два слоя
    _moveD();
    _moveE();
  }

  _moveDwb() {
    _moveDb();
    _moveEb();
  }

  _moveDw2() {
    _moveDw();
    _moveDw();
  }

  _moveLw() {      //Uw - верхние два слоя
    _moveL();
    _moveM();
  }

  _moveLwb() {     //Uw' - верхние два слоя
    _moveLb();
    _moveMb();
  }

  _moveLw2() {     //Uw2 - верхние два слоя
    _moveLw();
    _moveLw();
  }

  _moveFw() {      //Uw - верхние два слоя
    _moveF();
    _moveS();
  }

  _moveFwb() {     //Uw' - верхние два слоя
    _moveFb();
    _moveSb();
  }

  _moveFw2() {     //Uw2 - верхние два слоя
    _moveFw();
    _moveFw();
  }

  _moveBw() {
    //Uw - верхние два слоя
    _moveB();
    _moveSb();
  }

  _moveBwb() {
    //Uw' - верхние два слоя
    _moveBb();
    _moveS();
  }

  _moveBw2() {
    //Uw2 - верхние два слоя
    _moveBw();
    _moveBw();
  }

  _moveZ() {
    //Uw2 - верхние два слоя
    _moveFw();
    _moveBb();
  }

  _moveZb() {
    _moveBw();
    _moveFb();
  }

  _moveZ2() {
    _moveZ();
    _moveZ();
  }

  _moveY() {
    //Uw2 - верхние два слоя
    _moveUw();
    _moveDb();
  }

  _moveYb() {
    _moveDw();
    _moveUb();
  }

  _moveY2() {
    _moveY();
    _moveY();
  }

  _moveX() {
    _moveRw();
    _moveLb();
  }

  _moveXb() {
    _moveLw();
    _moveRb();
  }

  _moveX2() {
    //x2
    _moveX();
    _moveX();
  }
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
