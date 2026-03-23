import 'dart:core';

abstract class Moves {
  int get count;
  String get eType;
  List<String> moves();
  List<String> icons();
  List<String> toasts();
}
