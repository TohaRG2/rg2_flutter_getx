import 'dart:core';

class AdviceItem {
  String adviceImagePath;
  String adviceText;

  AdviceItem({this.adviceImagePath, this.adviceText});

  @override
  String toString() {
    return "($adviceText, $adviceImagePath)";
  }
}
