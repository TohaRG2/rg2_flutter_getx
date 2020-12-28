import 'dart:core';

abstract class Phase {
  int count;
  String phase;
  List<String> titles();
  List<String> icons();
  List<String> descriptions();
  List<String> urls();
  List<String> comments();
}
