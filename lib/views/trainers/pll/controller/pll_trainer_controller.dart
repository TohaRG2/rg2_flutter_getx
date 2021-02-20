import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_game.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_variant.dart';

class PllTrainerController extends GetxController {
  final Repository _repository = Get.find();

  final _showBottomBar = true.obs;
  bool get showBottomBar => _showBottomBar.value;
  set showBottomBar(value) => _showBottomBar.value = value;

  final _isStartButtonEnabled = false.obs;
  bool get isStartButtonEnabled => _isStartButtonEnabled.value;
  set isStartButtonEnabled(value) => _isStartButtonEnabled.value = value;

  QuizGame quizGame;


  /// Методы

  /// Подгружаем список с настроками PLL алгоритов из базы
  loadDataFromBase() async {
    isStartButtonEnabled = false;
    var list = await _repository.getAllPllTrainer();
    var quizVariants = list.map((pllTrainerItem) =>
        QuizVariant(1, pllTrainerItem.customName, pllTrainerItem.isChecked)
    ).toList();
    quizGame = QuizGame(
        answersList: quizVariants,
        onTimeIsOverCallback: _onTimeIsOverCallback,
        timeForAnswerInSec: 5
    );
    isStartButtonEnabled = true;
  }

  _onTimeIsOverCallback() {
    print("Time Over");
  }

  startGame() async {
    var isCorrect = true;
    do {
      var correctAnswer = quizGame.nextQuestion();
      print("Загадали - $correctAnswer");
      await Future.delayed(Duration(seconds: 1), () {});
      isCorrect = quizGame.checkAnswer(15);
      print("Проверили - $isCorrect");
      await Future.delayed(Duration(seconds: 1), () {});
    } while (!isCorrect);

  }

}
