import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_settings_controller.dart';

class SettingsTimerView extends StatelessWidget {
  final TimerSettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(R.timerSettingsTitle, style: TextStyle(color: Get.textTheme.headline5.color)),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        ),
        //ListView c выбором темы
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Задержка 0,5 сек перед стартом
              SwitchListTile(
                contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                title: Text(
                  R.timerDelayedStartText,
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _controller.isDelayedStart,
                onChanged: (v) {
                  _controller.isDelayedStart = v;
                },
              ),
              SizedBox(height: UIHelper.SpaceMedium,),
              /// Управление таймером одной рукой
              SwitchListTile(
                contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                title: Text(
                  R.timerOneHandedText,
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _controller.isOneHanded,
                onChanged: (v) {
                  _controller.isOneHanded = v;
                },
              ),
              SizedBox(height: UIHelper.SpaceMedium,),
              /// Метроном
              SwitchListTile(
                contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                title: Text(
                  R.timerMetronomText,
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _controller.isMetronomEnabled,
                onChanged: (v) {
                  _controller.isMetronomEnabled = v;
                },
              ),
              /// Текст "Размер шрифта"
              Padding(
                padding: const EdgeInsets.only(left: UIHelper.SpaceSmall),
                child: Text(
                  R.textSize,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              /// Слайдер выбора размера шрифта
              Slider(
                value: _controller.metronomFrequency.toDouble() ,
                min: 1,
                max: 240,
                divisions: 240,
                activeColor: Theme.of(context).accentColor,
                label: _controller.metronomFrequency.toString(),
                onChanged: (value) {
                  _controller.metronomFrequency = value.toInt();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBarWithBackButton(),
    );
  }
}
