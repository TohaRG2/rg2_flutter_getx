import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class ScrambleGenController extends GetxController {

  @override
  void onInit() {
    print("onInit ScrambleGenerator Controller Start");
    _isEdgeEnabled.value = GetStorage().read(Const.IS_EDGE_ENABLED) ?? true;
    _isCornerEnabled.value = GetStorage().read(Const.IS_CORNER_ENABLED) ?? true;
    _scrambleLength.value = GetStorage().read(Const.SCRAMBLE_LENGTH) ?? 14;
    _currentScramble.value = GetStorage().read(Const.CURRENT_SCRAMBLE) ?? "R F L B U2 L B' R F' D B R L F D R' D L";
    super.onInit();
  }

  final _isEdgeEnabled = true.obs;
  bool get isEdgeEnabled => _isEdgeEnabled.value;
  set isEdgeEnabled(bool value) {
    _isEdgeEnabled.value = value;
    GetStorage().write(Const.IS_EDGE_ENABLED, value);
  }

  final _isCornerEnabled = true.obs;
  bool get isCornerEnabled => _isCornerEnabled.value;
  set isCornerEnabled(bool value) {
    _isCornerEnabled.value = value;
    GetStorage().write(Const.IS_CORNER_ENABLED, value);
  }

  final _scrambleLength = 14.obs;
  int get scrambleLength => _scrambleLength.value;
  set scrambleLength(int value) {
    _scrambleLength.value = value;
    GetStorage().write(Const.SCRAMBLE_LENGTH, value);
  }

  final _currentScramble = "R F L B U2 L B' R F' D B R L F D R' D L".obs;
  String get currentScramble => _currentScramble.value;
  set currentScramble(String value) {
    _currentScramble.value = value;
    GetStorage().write(Const.CURRENT_SCRAMBLE, value);
  }

  final _currentDecision = "(А Ш Ч М) Эк (У Г Ш Р)".obs;
  String get currentDecision => _currentDecision.value;
  set currentDecision(String value) {
    _currentDecision.value = value;
  }

  /// Методы

  void tryIncreaseScrambleLength() {
    if (scrambleLength < 40) scrambleLength += 1;
  }

  void tryDecreaseScrambleLength() {
    if (scrambleLength > 3) scrambleLength -= 1;
  }

  void resetScrambleLength() {
    scrambleLength = 14;
  }


}

