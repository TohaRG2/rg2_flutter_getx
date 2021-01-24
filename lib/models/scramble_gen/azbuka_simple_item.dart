import 'dart:core';

class ColoredAzbukaItem{
  int index;
  int colorNumber;
  String letter;

  ColoredAzbukaItem({this.index, this.colorNumber, this.letter});

  @override
  String toString() {
    return "($index, $colorNumber, $letter)";
  }
}
