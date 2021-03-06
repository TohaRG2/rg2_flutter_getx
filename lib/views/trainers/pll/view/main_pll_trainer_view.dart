import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/buttons_style.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/model/result_variants.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/bottom_menu_bar_pll_trainer.dart';

class MainPllTrainerView extends StatelessWidget {
  final PllTrainerController _controller = Get.find();
  final SettingsController _settingsController = Get.find();

  bool get _godMode => _settingsController.godMode;

  final List<String> _pllButtonsNamesRow1 = ["Ga", ""  , "Y" , "F" , "H" , "E" ];
  final List<String> _pllButtonsNamesRow2 = ["Gb", "Na", "Ra", "Ja", "Ua", "Aa"];
  final List<String> _pllButtonsNamesRow3 = ["Gc", "Nb", "Rb", "Jb", "Ub", "Ab"];
  final List<String> _pllButtonsNamesRow4 = ["Gd", ""  , "V" , "T" , "Z" , ""  ];
  final _horizontalBorder = 3.0;
  final _verticalBorder = 0.0;
  final _goodIconPath = StrRes.TrainerGoodIconPath;
  final _badIconPath = StrRes.TrainerBadIconPath;
  final _timerIconPath = StrRes.TrainerTimerIconPath;

  @override
  Widget build(BuildContext context) {
    _controller.loadDataFromBase();
    return Obx(() {
      return _controller.showStartScreen ? buildStartScreen() : buildGameScreen();
    });
  }

  /// Основное окно тренера
  Widget buildStartScreen() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(StrRes.pllTrainerTitle,
              style: TextStyle(color: Get.textTheme.headline5.color)),
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
        child: Text("Начать", style: Get.textTheme.headline5,)
      ),
    );
  }

  /// Основной экран игры (стэк из основного экрана и экрана с результатами ответа
  Widget buildGameScreen() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(children: [
        buildMainGame(),
        Visibility(
            visible: _controller.isShowResultEnabled,
            child: buildResultScreen()
        ),
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
                var _color = _controller.quizGame.timerProgress < 0.25 ? Colors.red : Colors.green;
                return LinearPercentIndicator(
                  //width: Get.size.width,
                  lineHeight: 5.0,
                  percent: _controller.quizGame.timerProgress,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: _color,
                );
              }),

              // Счет
              buildTrainerCounts(),

              // Подсказка
              Visibility(
                visible: _godMode,
                child: Row(children: [Text("${_controller.hint}")])
              ),

              // Изображение кубика
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                      child: is2side ? _controller.pllCubeImage.getPll2SideImage() : _controller.pllCubeImage.getPll3SideImage()
                  ),
              )),

              // ряд кнопок с ответами
              (showAllVariants) ? buildTableWith21Button() : buildTableWithCustomButtons(),

              // немного пустого места после кнопок
              SizedBox(height: UIHelper.SpaceSmall,),
            ],
          ),
        ),
      ),
    );
  }

  /// Счетчики правильных и неправильных ответов
  Widget buildTrainerCounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(_badIconPath, height: 40, color: Colors.red,),
            Text("${_controller.quizGame.wrongAnswerCount}",
              style: Get.textTheme.headline3,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(_goodIconPath, height: 40, color: Colors.green,),
            Text("${_controller.quizGame.rightAnswerCount}",
              style: Get.textTheme.headline3,
            ),
          ],
        )
      ],
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
    Widget result;
    switch (_controller.answerResult) {
      // Диалог, если ответ верный
      case ResultVariants.RIGHT:
        var buttonText = (_controller.secondsRemains != 0) ? "Далее (${_controller.secondsRemains} сек)" : "Далее";
        var message = StrRes.pllTrainerRightTitle;
        result = buildOverlayDialog(
            buttonText: buttonText,
            message: message,
            imagePath: _goodIconPath,
            imageColor: Colors.green
        );
        break;

      // Диалог, если ответ неверный
      case ResultVariants.WRONG:
        var buttonText = (_controller.secondsRemains != 0) ? "Продолжить (${_controller.secondsRemains} сек)" : "Продолжить";
        var message = "${StrRes.pllTrainerWrongTitle}${_controller.hint}";
        result = buildOverlayDialog(
          buttonText: buttonText,
          message: message,
          imagePath: _badIconPath,
          imageColor: Colors.red
        );
        break;

      // Диалог, если время закончилось
      case ResultVariants.TIME_OVER:
        var buttonText = (_controller.secondsRemains != 0) ? "Продолжить (${_controller.secondsRemains} сек)" : "Продолжить";
        var message = "${StrRes.pllTrainerTimeOverTitle}${_controller.hint}";
        result = buildOverlayDialog(
            buttonText: buttonText,
            message: message,
            imagePath: _timerIconPath,
            imageColor: Colors.red
        );
        break;

        // Диалог, если что-то пошло не так... не должны сюда пападать
      case ResultVariants.UNKNOWN:
        result = Image.asset(_badIconPath, width: 150, height: 150, color: Colors.white,);
        break;
    }
    return result;
  }

  /// Универсальный диалог
  Widget buildOverlayDialog({String buttonText, String message, String imagePath, Color imageColor}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: UIHelper.SpaceMedium,),
        Image.asset(
          imagePath,
          width: 100,
          height: 100,
          color: imageColor,
        ),
        SizedBox(height: UIHelper.SpaceSmall,),
        Text(message, style: Get.textTheme.headline4, softWrap: true, textAlign: TextAlign.center, ),
        SizedBox(height: UIHelper.SpaceSmall,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// Кнопка "Пауза/Прервать"
            ElevatedButton(
                style: raisedButtonStyleWithPadding,
                onPressed: () {
                  _controller.pauseOrResetTrainer();
                },
                child: Text(_controller.cancelButtonText)),

            /// Кнопка "Далее"
            ElevatedButton(
                style: raisedAccentButtonStyleWithPadding,
                onPressed: () {
                  _controller.nextQuestion();
                },
                child: Text(buttonText)),
          ],
        ),
        SizedBox(height: UIHelper.SpaceMedium,)
      ],
    );
  }


  /// Табличка из 21(24) кнопок с международными вариантами ответов
  Widget buildTableWith21Button() {
    var _tableRows = [_pllButtonsNamesRow1, _pllButtonsNamesRow2, _pllButtonsNamesRow3, _pllButtonsNamesRow4];
    return Table(
      children: _tableRows.map((row) =>
        TableRow(
          children: row.map((letter) =>
            Container(
              padding: EdgeInsets.symmetric(horizontal: _horizontalBorder, vertical: _verticalBorder),
              child: (letter != "") ? buildSmallButton(letter) : Container(),
            )
          ).toList(),
        ),
      ).toList(),
    );
  }

  /// Маленькая кнопочка для международных вариантов ответов
  Widget buildSmallButton(String letter) {
    return ElevatedButton(
      style: raisedButtonStyle.copyWith(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ))),
      child: Text("$letter"),
      onPressed: () {
        _controller.checkAnswerByString(letter);
      },
    );
  }

  /// Табличка из N-кнопок
  Widget buildTableWithCustomButtons() {
    var _tableRows = _controller.textForButtons;
    return Table(
      children: _tableRows.map((row) =>
          TableRow(
            children: row.map((text) =>
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _horizontalBorder, vertical: _verticalBorder),
                  child: ElevatedButton(
                    style: raisedButtonStyle.copyWith(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text("$text", softWrap: true, textAlign: TextAlign.center,)
                    ),
                    onPressed: () {
                      _controller.checkAnswerByString(text);
                    },
                  ),
                )
            ).toList(),
          ),
      ).toList(),
    );
  }

}
