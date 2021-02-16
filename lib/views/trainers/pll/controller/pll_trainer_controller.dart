import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_game.dart';

class PllTrainerController extends GetxController {

  final _showBottomBar = true.obs;
  bool get showBottomBar => _showBottomBar.value;
  set showBottomBar(value) => _showBottomBar.value = value;

  //QuizGame quizGame = QuizGame(answersList: );

}