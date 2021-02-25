import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/trainersMenu/azbuka_trainer.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/controller/azbuka_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';

class SettingsAzbukaTrainerView extends StatelessWidget {
  final AzbukaSettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(azbukaTrainerTitle, style: TextStyle(color: Get.textTheme.headline5.color)),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Obx(() {
        return Container(

        );
      }),
      bottomNavigationBar: BottomBarWithBackButton(),
    );
  }
}
