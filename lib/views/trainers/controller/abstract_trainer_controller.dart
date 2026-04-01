import 'package:get/get.dart';
import 'package:rg2/views/trainers/model/result_variants.dart';
import 'package:rg2/views/trainers/pll/model/quiz_game.dart';

abstract class TrainerController extends GetxController {

  final _showStartScreen = true.obs;
  set showStartScreen(dynamic value) => _showStartScreen.value = value;
  bool get showStartScreen => _showStartScreen.value;

  final _isShowResultEnabled = false.obs;
  bool get isShowResultEnabled => _isShowResultEnabled.value;
  set isShowResultEnabled(bool value) => _isShowResultEnabled.value = value;

  final _hint = "".obs;
  String get hint => _hint.value;
  set hint(dynamic value) => _hint.value = value;

  final _cancelButtonText = "".obs;
  String get cancelButtonText => _cancelButtonText.value;
  set cancelButtonText(String value) => _cancelButtonText.value = value;

  final _secondsRemains = 0.obs;
  int get secondsRemains => _secondsRemains.value;
  set secondsRemains(dynamic value) => _secondsRemains.value = value;


  ResultVariants answerResult = ResultVariants.UNKNOWN;
  late QuizGame quizGame;
  List<List<String>> textForButtons = [];


}
