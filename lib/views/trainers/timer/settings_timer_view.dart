import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/scramble_text_widget.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';

class SettingsTimerView extends StatelessWidget {
  final TimerSettingsController _controller = Get.find();
  final ScrambleGenController _genController = Get.find();
  final Color _backgroundColor = Get.theme.backgroundColor;

  @override
  Widget build(BuildContext context) {
    final List<bool> _selections = List.generate(3, (index) => false);
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
          () => Stack(
            children: [
              Column(
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
                  /// Кнопки точной настройки частоты
                  Container(
                    child: ToggleButtons(
                      children: [
                        Icon(Icons.chevron_left_rounded),
                        Text("${_controller.metronomFrequency}"),
                        Icon(Icons.chevron_right_rounded)
                      ],
                      isSelected: _selections,
                      onPressed: (index) {
                        if (index == 0) {
                          _controller.decreaseMetronomFrequency();
                        } else if (index == 1) {
                          _controller.resetMetronomFrequency();
                        } else if (index == 2) {
                          _controller.increaseMetronomFrequency();
                        }
                      },
                    ),
                  ),
                  /// Слайдер выбора частоты метронома
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
                    value: _controller.scrambleTextRatio,
                    min: 0.7,
                    max: 1.3,
                    divisions: 6,
                    activeColor: Theme.of(context).accentColor,
                    onChanged: (value) {
                      _controller.scrambleTextRatio = value;
                    },
                    onChangeStart: (double startValue) {
                      _controller.showScramble = true;
                    },
                    onChangeEnd: (double startValue) {
                      _controller.showScramble = false;
                    },
                  ),
                ],
              ),
              Visibility(
                visible: _controller.showScramble,
                child: Positioned(
                  width: Get.width,
                  height: _controller.scrambleBarHeight,
                  child: Container(
                    color: _backgroundColor,
                    child: ScrambleTextWidget(
                      text: _genController.currentScramble,
                      textRatio: _controller.scrambleTextRatio,
                    ),
                  ),
                )
              ),
            ]
          ),
        ),
        bottomNavigationBar: BottomBarWithBackButton(),
    );
  }


}
