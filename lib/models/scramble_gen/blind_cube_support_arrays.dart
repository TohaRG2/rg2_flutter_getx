import 'dart:ui';
import 'package:flutter/material.dart';

/// Таблица для цветов кубика (используется для отображения кубика в генераторе и его настройках)
List<Color> cubeColor = [
  Colors.blue,
  Colors.orange,
  Colors.white,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.black,
  Colors.transparent,
];


///Создаем табличку (словарь) номеров основных ребер, для определенных сочетаний цветов, остальные элементы равны null
///первое число цвет, например 12 = синий 1 + оранжевый 2
///второе число номер основного(первого) цвета (места) как элемента куба (0..53)
Map mainEdge = {
  12 : 3, //для сине-оранжевого ребра
  13 : 7, //для сине-белого ребра
  14 : 5, //для сине-красного ребра
  15 : 1, //для сине-желтого ребра
  21 : 10, //для оранжево-синей ребра
  23 : 14, //для оранжево-белого ребра
  25 : 12, //для оранжево-желтого ребра
  26 : 16, //для оранжево-зеленого ребра
  31 : 19, //для бело-синей ребра
  32 : 21, //для бело-оранжевого ребра
  34 : 23, //для бело-красного ребра
  36 : 25, //для бело-зеленого ребра
  41 : 28, //для красно-синей ребра
  43 : 30, //для красно-белого ребра
  45 : 32, //для красно-желтого ребра
  46 : 34, //для красно-зеленого ребра
  51 : 37, //для желто-синей ребра
  52 : 41, //для желто-оранжевого ребра
  54 : 39, //для желто-красного ребра
  56 : 43, //для желто-зеленого ребра
  62 : 48, //для зелено-оранжевого ребра
  63 : 46, //для зелено-белого ребра
  64 : 50, //для зелено-красного ребра
  65 : 52  //для зелено-желтого ребра
};

Map dopEdge = {
  1 : 37, //сине-желтое
  3 : 10, //сине-оранжевое
  5 : 28, //сине-красное
  7 : 19, //сине-белое
  10 : 3, //оранжево-синяя
  12 : 41, //оранжево-желтое
  14 : 21, //оранжево-белое
  16 : 48, //оранжево-зеленое
  19 : 7, //бело-синяя
  21 : 14, //бело-оранжевое
  23 : 30, //бело-красное
  25 : 46, //бело-зеленое
  28 : 5, //красно-синяя
  30 : 23, //красно-белое
  32 : 39, //красно-желтое
  34 : 50, //красно-зеленое
  37 : 1, //желто-синяя
  39 : 32, //желто-красное
  41 : 12, //желто-оранжевое
  43 : 52, //желто-зеленое
  46 : 25, //зелено-белое
  48 : 16, //зелено-оранжевое
  50 : 34, //зелено-красное
  52 : 43, //зелено-желтое
};

/// Порядок поиска свободной корзины для переплавки ребра
Map edgePriority = {
    0 : 21,             // в первую очередь проверяем не занята ли бело-оранжевое ребро
    1 : 25,             // бело-зеленое
    2 : 48,             // зелено-оранжевое
    3 : 3,              // сине-оранжевое
    4 : 41,             // желто-оранжевое
    5 : 43,             // желто-зеленое
    6 : 37,             // желто-синее
    7 : 39,             // желто-красное
    8 : 7,              // сине-белое
    9 : 34,             // красно-зеленое
    10 : 28,            // красно-синее
};

///Создаем табличку номеров основных углов to для определенных сочетаний цветов (по цвету его место)
///первое число цвет to например 12 = синий 1 + оранжевый 2
///второе число номер основного(первого) цвета как элемента куба (0..53)
Map mainCorner = {
  12 : 0, //для сине-оранжево-желтого угла
  13 : 6, //для сине-бело-оранжевого угла
  14 : 8, //для сине-красно-белого угла
  15 : 2, //для сине-желто-красного угла
  21 : 11, //для оранжево-сине-белого угла
  23 : 17, //для оранжево-бело-зеленого угла
  25 : 9, //для оранжево-желто-синего угла
  26 : 15, //для оранжево-зелено-желтого угла
  31 : 20, //для бело-сине-красного угла
  32 : 18, //для бело-оранжево-синего угла
  34 : 26, //для бело-красно-зеленого угла
  36 : 24, //для бело-зелено-оранжевого угла
  41 : 29, //для красно-сине-желтого угла
  43 : 27, //для красно-бело-синего угла
  45 : 35, //для красно-желто-зеленого угла
  46 : 33, //для красно-зелено-белого угла
  51 : 38, //для желто-сине-оранжевого угла
  52 : 44, //для желто-оранжево-зеленого угла
  54 : 36, //для желто-красно-синего угла
  56 : 42, //для желто-зелено-красного угла
  62 : 45, //для зелено-оранжево-белого угла
  63 : 47, //для зелено-бело-красного угла
  64 : 53, //для зелено-красно-желтого угла
  65 : 51, //для зелено-желто-оранжевого угла
};

///Создаем табличку соответствия основного и дополнительного угла [где искать второй цвет]
///углы рассматриваем по часовой стрелке to поэтому достаточно первых двух цветов to чтобы пределить угол
///первая и вторая цифра номер соответствующих позиций угла в кубе. т.е. 0->9 to 9->38 to 38->0
Map dopCorner = {
  0: 9, //сине-оранжево-желтый Л
  2: 36, //сине-желто-красный К
  6: 18, //сине-бело-оранжевый М
  8: 27, //сине-красно-белый И
  9: 38, //оранжево-желто-синий Р
  11: 6, //оранжево-сине-белый Н
  15: 51, //оранжево-зелено-желтый П
  17: 24, //оранжево-бело-зеленый О
  18: 11, //бело-оранжево-синий А
  20: 8, //бело-сине-красный Б
  24: 45, //бело-зелено-оранжевый Г
  26: 33, //бело-красно-зеленый В
  27: 20, //красно-бело-синяя Ф
  29: 2, //красно-сине-желтая У
  33: 47, //красно-зелено-белая С
  35: 42, //красно-желто-зеленая Т
  36: 29, //желто-красно-синяя Ц
  38: 0, //желто-сине-оранжевая Х
  42: 53, //желто-зелено-красная Ч
  44: 15, //желто-оранжево-зеленая Ш
  45: 17, //зелено-оранжево-белая Д
  47: 26, //зелено-бело-красная Е
  51: 44, //зелено-желто-оранжевая З
  53: 35, //зелено-красно-желтая Ж
};

/// Порядок поиска свободной корзины для переплавки угла
Map cornerPriority = {
  0: 26, // в первую очередь проверяем не занят ли бело-красно-зеленый угол
  1: 44, // желто-зелено-оранжевый
  2: 36, // желто-красно-синий
  3: 42, // желто-красно-зеленый
  4: 38, // желто-сине-оранжевый
  5: 20, // бело-сине-красный
  6: 24, // бело-зелено-оранжевый
};
