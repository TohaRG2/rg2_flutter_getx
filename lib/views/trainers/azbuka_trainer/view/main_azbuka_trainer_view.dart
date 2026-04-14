import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/azbuka_trainer/controller/azbuka_trainer_controller.dart';
import 'package:rg2/views/trainers/azbuka_trainer/view/bottom_menu_bar_azbuka_trainer.dart';
import 'package:rg2/views/trainers/model/result_variants.dart';
import 'package:rg2/views/trainers/pll/model/quiz_variant.dart';
import 'package:rg2/views/trainers/pll/view/widgets/trainer_counts.dart';
import 'package:rg2/views/trainers/pll/view/widgets/overlay_dialog.dart';
import 'package:rg2/views/trainers/pll/view/widgets/answer_table.dart';

class MainAzbukaTrainerView extends StatelessWidget {
  final AzbukaTrainerController _controller = Get.find();
  final SettingsController _settingsController = Get.find();

  bool get _godMode => _settingsController.godMode;

  final _goodIconPath = StrRes.TrainerGoodIconPath;
  final _badIconPath = StrRes.TrainerBadIconPath;
  final _timerIconPath = StrRes.TrainerTimerIconPath;

  /// Самое главное окно игры
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _controller.showStartScreen
          ? buildStartScreen()
          : buildGameScreen();
    });
  }

  /// Основное окно тренера
  Widget buildStartScreen() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(StrRes.azbukaTrainerTitle,
              style: TextStyle(color: Get.textTheme.headlineSmall?.color)),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),

      /// Выбираем что отобразить, кнопку или прелоадер
      body: Center(child: startButton()),

      bottomNavigationBar: AzbukaTrainerBottomMenuBar(),
    );
  }

  /// Кнопка Начать игру
  Widget startButton() {
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        _controller.startTrainer();
      },
      child: Container(
          padding: const EdgeInsets.all(UIHelper.SpaceSmall),
          child: Text(
            "Начать",
            style: Get.textTheme.headlineSmall,
          )),
    );
  }

  /// Основной экран игры (стэк из основного экрана и экрана с результатами ответа
  Widget buildGameScreen() {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _onWillPop();
      },
      child: Stack(children: [
        buildMainGame(),

        /// Окно с результатами ответа и кнопками продолжить/начать с начала
        Visibility(
            visible: _controller.isShowResultEnabled,
            child: buildResultScreen()),
      ]),
    );
  }

  /// Обрабатываем нажатие физической кнопки назад во время игры
  Future<bool> _onWillPop() async {
    return _controller.exitTrainer();
  }

  /// Основной экран игры с индикатором, количеством ответов, кубиком и кнопками с вариантами
  Widget buildMainGame() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
          child: Column(
            children: [
              /// Индикатор оставшего времени
              Obx(() {
                var _color = _controller.quizGame.timerProgress < 0.25
                    ? Colors.red
                    : Colors.green;
                return LinearPercentIndicator(
                  lineHeight: 5.0,
                  percent: _controller.quizGame.timerProgress,
                  barRadius: const Radius.circular(2.5),
                  progressColor: _color,
                );
              }),

              /// Счет игры
              PllTrainerCounts(
                wrongCount: _controller.quizGame.wrongAnswerCount,
                rightCount: _controller.quizGame.rightAnswerCount,
                badIconPath: _badIconPath,
                goodIconPath: _goodIconPath,
              ),

              /// Подсказка, если включен "режим разработчика"
              Visibility(
                  visible: _godMode,
                  child: Row(children: [Text("${_controller.hint}")])),

              /// Изображение кубика
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: _controller.azbukaCubeImage.getScrambledDrawable(),
                    )),
              ),

              /// ряд кнопок с ответами
              PllAnswerTable(
                rows: _variantsToTableRows(_controller.quizGame.answersList, 6),
                onAnswer: (text) => _controller.checkAnswerByString(text),
              ),

              /// немного пустого места после кнопок
              const SizedBox(height: UIHelper.SpaceSmall),
            ],
          ),
        ),
      ),
    );
  }

  /// Преобразуем список из List<QuizVariant> в List<List<String>> для удобного вывода кнопок таблицей
  List<List<String>> _variantsToTableRows(
      List<QuizVariant> quizVariants, int divideBy) {
    var result = <List<String>>[];
    var variants = quizVariants.map((e) => e.value).toList();
    variants.sort();

    for (var i = 0; i < variants.length; i += divideBy) {
      var row = variants.getRange(i, i + divideBy).toList();
      result.add(row);
    }

    return result;
  }

  /// Окно с результатами ответа и кнопками продолжить/начать с начала
  Widget buildResultScreen() {
    return Stack(children: [
      // Затемняем то, что ниже
      Container(color: Colors.black45),

      // Результат ответа
      Positioned(
        left: UIHelper.SpaceMedium,
        right: UIHelper.SpaceMedium,
        bottom: UIHelper.SpaceLarge,
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: resultScreen(),
        ),
      )
    ]);
  }

  /// Выбор виджета диалога в зависимости от результата ответа
  Widget resultScreen() {
    switch (_controller.answerResult) {
      case ResultVariants.RIGHT:
        return PllOverlayDialog(
          message: StrRes.pllTrainerRightTitle,
          imagePath: _goodIconPath,
          imageColor: Colors.green,
          buttonText: (_controller.secondsRemains != 0)
              ? "Далее (${_controller.secondsRemains} сек)"
              : "Далее",
          cancelButtonText: _controller.cancelButtonText,
          onNext: () => _controller.nextQuestion(),
          onCancel: () => _controller.pauseOrResetTrainer(),
        );

      case ResultVariants.WRONG:
        return PllOverlayDialog(
          message: "${StrRes.pllTrainerWrongTitle}${_controller.hint}",
          imagePath: _badIconPath,
          imageColor: Colors.red,
          buttonText: (_controller.secondsRemains != 0)
              ? "Продолжить (${_controller.secondsRemains} сек)"
              : "Продолжить",
          cancelButtonText: _controller.cancelButtonText,
          onNext: () => _controller.nextQuestion(),
          onCancel: () => _controller.pauseOrResetTrainer(),
        );

      case ResultVariants.TIME_OVER:
        return PllOverlayDialog(
          message: "${StrRes.pllTrainerTimeOverTitle}${_controller.hint}",
          imagePath: _timerIconPath,
          imageColor: Colors.red,
          buttonText: (_controller.secondsRemains != 0)
              ? "Продолжить (${_controller.secondsRemains} сек)"
              : "Продолжить",
          cancelButtonText: _controller.cancelButtonText,
          onNext: () => _controller.nextQuestion(),
          onCancel: () => _controller.pauseOrResetTrainer(),
        );

      case ResultVariants.UNKNOWN:
      default:
        return Image.asset(
          _badIconPath,
          width: 150,
          height: 150,
          color: Colors.white,
        );
    }
  }
}

