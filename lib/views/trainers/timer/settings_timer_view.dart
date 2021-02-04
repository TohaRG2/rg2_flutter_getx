import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';

class SettingsTimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(R.timerSettingsTitle, style: TextStyle(color: Get.textTheme.headline5.color)),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        ),
        //ListView c выбором темы
        body: SingleChildScrollView(
          child: Container(child: Center(child: Text("Настройки таймера")),),
        ),
        bottomNavigationBar: BottomBarWithBackButton(),
    );
  }
}
