import 'dart:core';

abstract class Phase {
  int get count;
  String get phase;
  List<String> titles();
  List<String> icons();
  List<String> descriptions();
  List<String> urls();
  List<String> comments();
}
