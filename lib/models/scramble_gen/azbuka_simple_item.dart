import 'dart:core';

class ColoredAzbukaItem{
  int colorNumber;
  String letter;

  ColoredAzbukaItem({this.colorNumber, this.letter});

  @override
  String toString() {
    return "($colorNumber, $letter)";
  }
}
