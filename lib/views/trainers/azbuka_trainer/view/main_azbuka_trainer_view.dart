import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/controller/azbuka_trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/view/bottom_menu_bar_azbuka_trainer.dart';
import 'package:rg2_flutter_getx/views/trainers/model/result_variants.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_variant.dart';

class MainAzbukaTrainerView extends StatelessWidget {
  final AzbukaTrainerController _controller = Get.find();
  final SettingsController _settingsController = Get.find();

  bool get _godMode => _settingsController.godMode;

  final _horizontalBorder = 3.0;
  final _verticalBorder = 0.0;
  final _goodIconPath = StrRes.TrainerGoodIconPath;
  final _badIconPath = StrRes.TrainerBadIconPath;
  final _timerIconPath = StrRes.TrainerTimerIconPath;

  /// Самое главное окно игры
  @override
  Widget build(BuildContext context) {
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
          child: Text(StrRes.azbukaTrainerTitle,
              style: TextStyle(color: Get.textTheme.headline5.color)),
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(children: [
        buildMainGame(),

        /// Окно с результатами ответа и кнопками продолжить/начать с начала
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
          child: Column(
            children: [
              /// Индикатор оставшего времени
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

              /// Счет игры
              buildTrainerCounts(),

              /// Подсказка, если включен "режим разработчика"
              Visibility(
                  visible: _godMode,
                  child: Row(children: [Text("${_controller.hint}")])
              ),

              /// Изображение кубика
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: _controller.azbukaCubeImage.getScrambledDrawable(),
                  )
                ),
              ),

              /// ряд кнопок с ответами
              buildTableWithButton(),

              /// немного пустого места после кнопок
              SizedBox(height: UIHelper.SpaceSmall,),
            ],
          ),
        ),
      ),
    );
  }

  /// Виджет с кастомными вариантами ответов
  Widget buildTableWithButton() {
    List<QuizVariant> _showAllVariants = _controller.quizGame.answersList;
    List<List<String>> _tableRows = _variantsToTableRows(_showAllVariants, 6);
    return Table(
      children: _tableRows.map((row) =>
        TableRow(
          children: row.map((letter) =>
              Container(
                padding: EdgeInsets.symmetric(horizontal: _horizontalBorder, vertical: _verticalBorder),
                child: buildSmallButton(letter),
              )
          ).toList()
        )
      ).toList(),
    );
  }

  /// Преобразуем список из List<QuizVariant> в List<List<String>> для удобного вывода кнопок таблицей
  List<List<String>> _variantsToTableRows(List<QuizVariant> quizVariants, int divideBy) {
    var result = List<List<String>>();
    var variants = quizVariants.map((e) => e.value).toList();
    variants.sort();

    for (var i = 0; i < variants.length; i += divideBy) {
      var row = variants.getRange(i, i + divideBy).toList();
      result.add(row);
    }

    return result;
  }

  /// Маленькая кнопочка для вариантов ответов
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
      /// Диалог, если ответ верный
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

      /// Диалог, если ответ неверный
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

      /// Диалог, если время закончилось
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

      /// Диалог, если что-то пошло не так... не должны сюда пападать
      case ResultVariants.UNKNOWN:
        result = Image.asset(_badIconPath, width: 150, height: 150, color: Colors.white,);
        break;
    }
    return result;
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

}
