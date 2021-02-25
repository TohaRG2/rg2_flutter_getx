import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/controller/azbuka_trainer_controller.dart';

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
      body: startButton(),

      bottomNavigationBar: AzbukaTrainerBottomMenuBar(),
    );
  }



  Widget buildGameScreen() {
    return SafeArea(child: Center(child: Text("Игра")));
  }

}
