import 'dart:core';

abstract class Moves {
  int count;
  String eType;
  List<String> moves();
  List<String> icons();
  List<String> toasts();
}
