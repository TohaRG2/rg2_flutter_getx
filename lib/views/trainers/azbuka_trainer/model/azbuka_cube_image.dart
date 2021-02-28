import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/blind_cube_support_arrays.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/cube.dart';

class AzbukaCubeImage {
  //String _scramble = "";
  int _slot = 0;
  Cube _cube = Cube();

  AzbukaCubeImage({String scramble, int slot}) {
    //this._scramble = scramble;
    this._slot = slot;
    // развернем кубик, чтобы его было удобнее отображать (первыми тремя сторонами см.коммент внизу)
    _cube.executeScramble("$scramble y y");
  }

  // функция преобразующая int в String и добавляющая 0 перед однозначным числом
  String _twoDigits(int n) {
    if (n < 10 && n >= 0) return "0$n";
    return "$n";
  }

  Widget getScrambledDrawable() {
    // созданем массив [0,1,2,3,4...26,27]
    var list = List.generate(28, (int index) => index, growable: false);
    var imageList = list.map((i) {
      // определяем цвет элемента кубика (0-ой элемент это фон, для него 6-ой цвет (черный))
      // картинка "azbuka_2s_01" - это 26ой элемент в кубике
      var colorNum = (i == 0) ? 6 : _cube.asList[27-i];
      return Image.asset("$_imgPath/azbuka_2s_${_twoDigits(i)}.png", color: cubeColor[colorNum],);
    }).toList(growable: true);
    imageList.add(Image.asset("$_imgPath/azbuka_slot_$_slot.png"));

    return Stack(children: imageList);
  }


  /// Companion objects (Static)

  static const _imgPath = "assets/images/trainers/azbuka_cube";
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