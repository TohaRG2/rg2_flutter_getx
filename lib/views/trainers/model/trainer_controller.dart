import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/model/result_variants.dart';
import 'package:rg2_flutter_getx/views/trainers/model/trainer_state.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_game.dart';

class TrainerController extends GetxController {

  final _showStartScreen = true.obs;
  set showStartScreen(value) => _showStartScreen.value = value;
  get showStartScreen => _showStartScreen.value;

  final _isShowResultEnabled = false.obs;
  bool get isShowResultEnabled => _isShowResultEnabled.value;
  set isShowResultEnabled(value) => _isShowResultEnabled.value = value;

  final _hint = "".obs;
  String get hint => _hint.value;
  set hint(value) => _hint.value = value;

  final _cancelButtonText = "".obs;
  String get cancelButtonText => _cancelButtonText.value;
  set cancelButtonText(value) => _cancelButtonText.value = value;

  final _secondsRemains = 0.obs;
  int get secondsRemains => _secondsRemains.value;
  set secondsRemains(value) => _secondsRemains.value = value;


  ResultVariants answerResult = ResultVariants.UNKNOWN;
  QuizGame quizGame;
  List<List<String>> textForButtons = List();


}
