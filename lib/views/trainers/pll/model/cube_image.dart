

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/cube.dart';

class PllCubeImage {
  int id;
  Cube _cube;

  PllCubeImage({this.id, bool randomAUF = false, bool randomFrontSide = false}){
    if (id < 0 || id > 20) {
      id = 0;
      print("Задан некорректный id pll алгоритма, будет равен 0");
    }
    // генерируем случайный поворот верхней грани и применяем если нужно
    var rndStrAUF = "";
    for (var i = 0; i < Random().nextInt(3); i++) {
      rndStrAUF += "U ";
    }
    var aufTurn = randomAUF ? rndStrAUF : "";

    // генерируем случайный разворот кубика и применяем если надо
    var rndFS = "";
    for (var i = 0; i < Random().nextInt(3); i++) {
      rndFS += "y ";
    }
    var turnFS = randomFrontSide ? rndFS : "";

    _cube = Cube();
    var scramble = "z2 y\' $turnFS ${_scrambles[id]} $aufTurn";
    _cube.executeScramble(scramble);
  }

  Widget getPll3SideImage() {
    var pllColors = _cube.threeSidePllColors;
    var cubeSideColors = _cube.currentCenterColors;
    var backgroundImage = Image.asset(_backgroundImgPath3s);
    var topImage = Image.asset(_topImgPath3s,   color: cubeSideColors[2]);
    var leftImage = Image.asset(_leftImgPath3s, color: cubeSideColors[1],);
    var left1Image = Image.asset(_left1ImgPath3s, color: pllColors[0],);
    var left2Image = Image.asset(_left2ImgPath3s, color: pllColors[1],);
    var left3Image = Image.asset(_left3ImgPath3s, color: pllColors[2],);
    var frontImage = Image.asset(_frontImgPath3s, color: cubeSideColors[5],);
    var front1Image = Image.asset(_front1ImgPath3s, color: pllColors[3],);
    var front2Image = Image.asset(_front2ImgPath3s, color: pllColors[4],);
    var front3Image = Image.asset(_front3ImgPath3s, color: pllColors[5],);
    var rightImage = Image.asset(_rightImgPath3s, color: cubeSideColors[3],);
    var right1Image = Image.asset(_right1ImgPath3s, color: pllColors[6],);
    var right2Image = Image.asset(_right2ImgPath3s, color: pllColors[7],);
    var right3Image = Image.asset(_right3ImgPath3s, color: pllColors[8],);
    var stack = Stack(
      children: [backgroundImage, topImage,
        leftImage, left1Image, left2Image, left3Image,
        frontImage, front1Image, front2Image, front3Image,
        rightImage, right1Image, right2Image, right3Image,
      ],
    );
    return stack;
  }

  Widget getPll2SideImage() {
    var pllColors = _cube.twoSidePllColors;
    var cubeSideColors = _cube.currentCenterColors;
    var backgroundImage = Image.asset(_backgroundImgPath2s);
    var topImage = Image.asset(_topImgPath2s,   color: cubeSideColors[2]);
    var frontImage = Image.asset(_frontImgPath2s, color: cubeSideColors[5],);
    var front1Image = Image.asset(_front1ImgPath2s, color: pllColors[0],);
    var front2Image = Image.asset(_front2ImgPath2s, color: pllColors[1],);
    var front3Image = Image.asset(_front3ImgPath2s, color: pllColors[2],);
    var rightImage = Image.asset(_rightImgPath2s, color: cubeSideColors[3],);
    var right1Image = Image.asset(_right1ImgPath2s, color: pllColors[3],);
    var right2Image = Image.asset(_right2ImgPath2s, color: pllColors[4],);
    var right3Image = Image.asset(_right3ImgPath2s, color: pllColors[5],);
    var stack = Stack(
      children: [backgroundImage, topImage,
        frontImage, front1Image, front2Image, front3Image,
        rightImage, right1Image, right2Image, right3Image,
      ],
    );
    return stack;
  }


  /// Companion objects (Static)

  static const _backgroundImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s.png";
  static const _topImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_top.png";
  static const _leftImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_left.png";
  static const _left1ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_left_1.png";
  static const _left2ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_left_2.png";
  static const _left3ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_left_3.png";
  static const _frontImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_front.png";
  static const _front1ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_front_1.png";
  static const _front2ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_front_2.png";
  static const _front3ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_front_3.png";
  static const _rightImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_right.png";
  static const _right1ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_right_1.png";
  static const _right2ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_right_2.png";
  static const _right3ImgPath3s = "assets/images/trainers/pll_cube_3side/pll_3s_right_3.png";

  static const _backgroundImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s.png";
  static const _topImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_top.png";
  static const _frontImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_front.png";
  static const _front1ImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_front_1.png";
  static const _front2ImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_front_2.png";
  static const _front3ImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_front_3.png";
  static const _rightImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_right.png";
  static const _right1ImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_right_1.png";
  static const _right2ImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_right_2.png";
  static const _right3ImgPath2s = "assets/images/trainers/pll_cube_2side/pll_2s_right_3.png";


  static const _scrambles = [
    "R\' U R\' U\' R\' U\' R\' U R U R2",                                   // Ua
    "R2 U\' R\' U\' R U R U R U\' R",                                       // Ub
    "M2 U M2 U M\' U2 M2 U2 M\' U2",                                        // Z
    "M2\' U\' M2\' U2 M2\' U\' M2\'",                                       // H
    "U R U R\' U\' R\' F R2 U\' R\' U\' R U R\' F\' U\'",                   // T
    "U R U2 R\' U\' R U2 L\' U R\' U\' L U\'",                              // Jb
    "U (R\' U\' F\') (R U R\' U\') R\' F R2 U\' R\' U\' (R U R\' U R) U\'", // F
    "F R U\' R\' U\' R U R\' F\' R U R\' U\' R\' F R F\'",                  // Y
    "Rw U\' Rw F2 Rw\' U Rw F2 Rw2",                                        // Aa
    "(R U R\' F\') (Rw U R\' U\' Rw\' F R2 U\' R\')",                       // Ab
    "F\' (Rw U R\' U\') (Rw\' F R U2) (Rw U R\' U\') (Rw\' F R F\') U2",    // E
    "U R U2 R\' D R U\' R U\' R U R2 D R\' U\' R D2 U\'",                   // V
    "(R U\' L U2 R\' U L\') (R U\' L U2  R\' U L\') U",                     // Na
    "(L\' U R\') U2 (L U\' R) (L\' U R\') U2 (L U\' R) U\'",                // Nb
    "U (R\' U2 R U2) R\' F (R U R\' U\') R\' F\' R2 U\' U\'",               // Rb
    "U (R U R\' F\') (R U2 R\' U2) R\' F (R U R) U2 R\' U2",                // Ra
    "U (R\' U\' R U D\') (R2 U R\' U) (R U\' R U\') R2\' U\' D",            // Ga
    "R2 F\' R (U R U\' R\') F\' (R U2 R\' U2) R\' F2 R2",                   // Gc
    "U R2\' F2 (R U2) (R U2) R\' F (R U R\' U\') R\' F R2 U\'",             // Gd
    "U R2 U R\' U R\' U\' R U\' R2 (D U\') R\' U R D\'",                    // Gb
    "U F2 (L\' U\' L) F2 (R\' D R\' D\') R2 U\'",                           // Ja
  ];
}