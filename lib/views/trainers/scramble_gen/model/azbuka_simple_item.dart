import 'dart:core';

class ColoredAzbukaItem{
  final int index;
  final int colorNumber;
  final String letter;

  const ColoredAzbukaItem({required this.index, required this.colorNumber, required this.letter});

  @override
  String toString() {
    return "($index, $colorNumber, $letter)";
  }
}
