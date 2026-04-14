import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/model/result_variants.dart';
import 'package:rg2/views/trainers/pll/controller/pll_trainer_controller.dart';
import 'package:rg2/views/trainers/pll/view/bottom_menu_bar_pll_trainer.dart';
import 'package:rg2/views/trainers/pll/view/widgets/trainer_counts.dart';
import 'package:rg2/views/trainers/pll/view/widgets/overlay_dialog.dart';
import 'package:rg2/views/trainers/pll/view/widgets/answer_table.dart';

class MainPllTrainerView extends StatelessWidget {
  final PllTrainerController _controller = Get.find();
  final SettingsController _settingsController = Get.find();

  bool get _godMode => _settingsController.godMode;

  final List<String> _pllButtonsNamesRow1 = ["Ga", "", "Y", "F", "H", "E"];
  final List<String> _pllButtonsNamesRow2 = ["Gb", "Na", "Ra", "Ja", "Ua", "Aa"];
  final List<String> _pllButtonsNamesRow3 = ["Gc", "Nb", "Rb", "Jb", "Ub", "Ab"];
  final List<String> _pllButtonsNamesRow4 = ["Gd", "", "V", "T", "Z", ""];

  final _goodIconPath = StrRes.TrainerGoodIconPath;
  final _badIconPath = StrRes.TrainerBadIconPath;
  final _timerIconPath = StrRes.TrainerTimerIconPath;

  @override
  Widget build(BuildContext context) {
    _controller.loadDataFromBase();
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
          child: Text(StrRes.pllTrainerTitle,
              style: TextStyle(color: Get.textTheme.headlineSmall?.color)),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),

      /// Выбираем что отобразить, кнопку или прелоадер
      body: _controller.isStartButtonEnabled
          ? Center(child: startButton())
          : Center(child: CircularProgressIndicator()),

      bottomNavigationBar: PllTrainerBottomMenuBar(),
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
    var is2side = _controller.twoSideRecognition;
    var showAllVariants = _controller.showAllVariants;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
          child: Column(
            children: [
              // Индикатор оставшего времени
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

              // Счет
              PllTrainerCounts(
                wrongCount: _controller.quizGame.wrongAnswerCount,
                rightCount: _controller.quizGame.rightAnswerCount,
                badIconPath: _badIconPath,
                goodIconPath: _goodIconPath,
              ),

              // Подсказка
              Visibility(
                  visible: _godMode,
                  child: Row(children: [Text("${_controller.hint}")])),

              // Изображение кубика
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                    child: is2side
                        ? _controller.pllCubeImage.getPll2SideImage()
                        : _controller.pllCubeImage.getPll3SideImage()),
              )),

              // ряд кнопок с ответами
              PllAnswerTable(
                rows: showAllVariants
                    ? [
                        _pllButtonsNamesRow1,
                        _pllButtonsNamesRow2,
                        _pllButtonsNamesRow3,
                        _pllButtonsNamesRow4
                      ]
                    : _controller.textForButtons,
                onAnswer: (text) => _controller.checkAnswerByString(text),
              ),

              // немного пустого места после кнопок
              const SizedBox(height: UIHelper.SpaceSmall),
            ],
          ),
        ),
      ),
    );
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
