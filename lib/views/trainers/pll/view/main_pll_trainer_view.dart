import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/bottom_menu_bar_pll_trainer.dart';

class MainPllTrainerView extends StatelessWidget {
  final PllTrainerController _controller = Get.find();

  final List<String> _pllButtonsNamesRow1 = ["Ga", ""  , "Y" , "F" , "H" , "E" ];
  final List<String> _pllButtonsNamesRow2 = ["Gb", "Na", "Ra", "Ja", "Ua", "Aa"];
  final List<String> _pllButtonsNamesRow3 = ["Gc", "Nb", "Rb", "Jb", "Ub", "Ab"];
  final List<String> _pllButtonsNamesRow4 = ["Gd", ""  , "V" , "T" , "Z" , ""  ];
  final _horizontalBorder = 3.0;
  final _verticalBorder = 0.0;
  final _goodIconPath = "assets/images/trainers/pll_trainer/ok_icon.png";
  final _badIconPath = "assets/images/trainers/pll_trainer/delete_icon.png";
  final _timerIconPath = "assets/images/trainers/timer.png";

  @override
  Widget build(BuildContext context) {
    _controller.loadDataFromBase();
    return Scaffold(
      /// Основное окно тренера
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("PLL Trainer",
            style: TextStyle(
            color: Get.textTheme.headline5.color)),
        )
      ),

      /// Выбираем что отобразить, игру или начальный экрна с кнопкой
      body: Obx(() {
        return _controller.showStartScreen ? buildStartScreen() : buildGameScreen();
      }),

      bottomNavigationBar: PllTrainerBottomMenuBar(),
    );
  }

  /// Начальный экран с кнопкой "Начать"
  Widget buildStartScreen() {
    return Obx(
      () => Center(
        child: _controller.isStartButtonEnabled ? startButton() : CircularProgressIndicator(),
      ),
    );
  }

  /// Кнопка Начать игру
  Widget startButton() {
    return RaisedButton(
      color: Get.theme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
    return Obx(() {
      return Stack( children: [
        buildMainGame(),
        Visibility(
          visible: _controller.isShowResultEnabled,
          child: buildResultScreen()
        ),
      ]);
    });
  }

  /// Основной экран игры с индикатором, количеством ответов, кубиком и кнопками с вариантами
  Widget buildMainGame() {
    var is2side = _controller.twoSideRecognition;
    var showAllVariants = _controller.showAllVariants;
    return Container(
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
          Row(children: [Text("${_controller.hint}")]),

          // Изображение кубика
          Expanded(
            child: Container(
              child: Center(
                  child: is2side ? _controller.cubeImage.getPll2SideImage() : _controller.cubeImage.getPll3SideImage()
              ),
          )),

          // ряд кнопок с ответами
          (showAllVariants) ? buildTableWith21Button() : buildTableWithCustomButtons(),
        ],
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
      case ResultVariant.RIGHT:
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
      case ResultVariant.WRONG:
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
      case ResultVariant.TIME_OVER:
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
      case ResultVariant.UNKNOWN:
        result = Image.asset("assets/images/trainers/pll_trainer/ok_icon.png", width: 150, height: 150, color: Colors.white,);
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
        Text(message, style: Get.textTheme.headline4,),
        SizedBox(height: UIHelper.SpaceSmall,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// Кнопка "Пауза/Прервать"
            FlatButton(
                color: Get.theme.primaryColor,
                onPressed: () {
                  _controller.pauseOrResetTrainer();
                },
                child: Text(_controller.cancelButtonText)),

            /// Кнопка "Далее"
            FlatButton(
                color: Get.theme.accentColor,
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
    return FlatButton(
      color: Get.theme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Text("$letter"),
      onPressed: () {
        _controller.checkAnswerByString(letter);
      },
    );
  }

  /// Табличка из N-кнопок
  //TODO Доделать: не обновлять кнопки каждую секунду, цвет шапки в тренажере, цвета кнопок, убрирать подвал и шапку при игре
  Widget buildTableWithCustomButtons() {
    var list = _controller.getListOfVariants();
    print("list = $list");
    List<TableRow> rows = [];
    for (var i = 0; i < list.length; i+=2) {
      rows.add(TableRow(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: _horizontalBorder, vertical: _verticalBorder),
              child: FlatButton(
                color: Get.theme.primaryColor,
                child: Text("${list[i]}", softWrap: true, textAlign: TextAlign.center,),
                onPressed: () {
                  _controller.checkAnswerByString(list[i]);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _horizontalBorder, vertical: _verticalBorder),
              child: FlatButton(
                color: Get.theme.primaryColor,
                child: Text("${list[i+1]}", softWrap: true, textAlign: TextAlign.center,),
                onPressed: () {
                  _controller.checkAnswerByString(list[i+1]);
                },
              ),
            ),
          ]
      ));
    }
    print("rows Complete");
    return Table(
      children: rows,
    );
  }

}
