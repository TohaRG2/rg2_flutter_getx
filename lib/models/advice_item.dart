import 'dart:core';

class AdviceItem {
  String adviceImagePath;
  String adviceText;

  AdviceItem({required this.adviceImagePath, required this.adviceText});

  @override
  String toString() {
    return "($adviceText, $adviceImagePath)";
  }
}
