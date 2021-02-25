import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/controller/azbuka_trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/view/bottom_menu_bar_azbuka_trainer.dart';

class MainAzbukaTrainerView extends StatelessWidget {
  final AzbukaTrainerController _controller = Get.find();

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
        //_controller.startTrainer();
      },
      child: Container(
          padding: const EdgeInsets.all(UIHelper.SpaceSmall),
          child: Text("Начать", style: Get.textTheme.headline5,)
      ),
    );
  }


  Widget buildGameScreen() {
    return SafeArea(child: Center(child: Text("Игра")));
  }

}
