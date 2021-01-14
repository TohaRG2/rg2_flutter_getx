import 'dart:core';
import 'dart:math';

import 'package:rg2_flutter_getx/models/scramble_gen/azbuka_simple_item.dart';

///
/// Сущность для представления кубика
///

class Cube {

  /// Представление кубика в виде непрерывного списка из 54 элементов (6 граней * 9 наклеек на каждой)
  List<int> _cube = List.filled(54, 0);
  get asList => _cube;

  /// Бэкап кубика
  List<int> _backup = List();

  /// Конструктор, при создании экземпляра обнуляем кубик
  Cube() {
    resetCube();
  }

  /// Обнуляем кубик (возвращаем в исходное состояние)
  void resetCube() {
    print ("resetCube");
    for(int i=0; i < _cube.length; i++){
      _cube[i] = i ~/ 9;
    }
  }

  /// Представляем кубик в виде таблицы из 108 элементов (9 строк по 12 элементов)
  List<AzbukaSimpleItem> asTable() {
    // заполняем табличку прозрачными пустыми элементами
    var _table = List.generate(108, (_) => AzbukaSimpleItem(color: 7, letter: ""));
    // ставим на свои места значения ячеек кубика
    for(int i=0; i < 9; i++) {
      _table[(i ~/3) * 12 + 3 + i % 3] = AzbukaSimpleItem(color: _cube[i], letter: " ");
      _table[(i ~/3 + 3) * 12 + i % 3] = AzbukaSimpleItem(color: _cube[i + 9], letter: " ");
      _table[(i ~/3 + 3) * 12 + 3 + i % 3] = AzbukaSimpleItem(color: _cube[i + 18], letter: " ");
      _table[(i ~/3 + 3) * 12 + 6 + i % 3] = AzbukaSimpleItem(color: _cube[i + 27], letter: " ");
      _table[(i ~/3 + 3) * 12 + 9 + i % 3] = AzbukaSimpleItem(color: _cube[i + 36], letter: " ");
      _table[(i ~/3 + 6) * 12 + 3 + i % 3] = AzbukaSimpleItem(color: _cube[i + 45], letter: " ");
    }
    return _table;
  }

  /// Представляем кубик в виде 9 строк по 12 элементов
  List<List<AzbukaSimpleItem>> asTableRows() {
    List<List<AzbukaSimpleItem>> result = List();
    var table = asTable();
    for(int i=0; i < 9; i++) {
      var row = table.getRange(i * 12, (i + 1) * 12).toList();
      result.add(row);
    }
    return result;
  }

  /// Генерируем скрамбл заданной длины
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
          // выбираем ход будет по часовой, против часовой или двойной
          switch (random.nextInt(3)) {
          // если по часовой
            case 0:
              scramble += " "; //просто пробел
              break;
          // против часовой стрелки
            case 1:
              scramble += "' "; //добавляем ' с пробелом
              break;
          // двойное вращение
            case 2:
              scramble += "2 "; //добавляем 2 с пробелом
              break;
          }
          prevPrevRandom = prevRandom;
          prevRandom = curRandom;
        }
      }
    } while (i < length);

    return scramble.trim();
  }

  /// Переопределяем метод, чтобы вывести кубик (в виде таблицы) в консоль
  @override
  String toString() {
    var result = "";
    var table = asTable();
    for(int i=0; i < table.length; i++) {
      if (i % 12 == 0) {
        result += "\n";
      }
      result += table[i].color.toString();
    }
    result = result.replaceAll("7", " ");
    return result;
  }

  /// Применяем скрамбл к текущему положению кубика
  executeScramble(String scramble) {
    var scrm = _normalizeScramble(scramble);
    List<String> list = scrm.split(" ");
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
        case "Rw" :  _moveRw();  break;
        case "Rw1":  _moveRwb(); break;
        case "Rw2":  _moveRw2(); break;
        case "Rw21": _moveRw2(); break;
        case "Uw" :  _moveUw();  break;
        case "Uw1":  _moveUwb(); break;
        case "Uw2":  _moveUw2(); break;
        case "Dw" :  _moveDw();  break;
        case "Dw1":  _moveDwb(); break;
        case "Dw2":  _moveDw2(); break;
        case "Lw" :  _moveLw();  break;
        case "Lw1":  _moveLwb(); break;
        case "Lw2":  _moveLw2(); break;
        case "Fw" :  _moveFw();  break;
        case "Fw1":  _moveFwb(); break;
        case "Fw2":  _moveFw2(); break;
        case "Bw" :  _moveBw();  break;
        case "Bw1":  _moveBwb(); break;
        case "Bw2":  _moveBw2(); break;
        case "z"  :  _moveZ();   break;
        case "z1" :  _moveZb();  break;
        case "z2" :  _moveZ2();  break;
        case "x"  :  _moveX();   break;
        case "x1" :  _moveXb();  break;
        case "x2" :  _moveX2();  break;
        case "y"  :  _moveY();   break;
        case "y1" :  _moveYb();  break;
        case "y2" :  _moveY2();  break;
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
    return scramble.replaceAll("21", "2");
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
    //'Меняем фронт
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
    //'Меняем фронт
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
    //'Меняем фронт
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
    //'Меняем фронт
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
    //'Меняем фронт
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
    //'Меняем фронт
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

