import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/shared/bottom_bar_with_back_button.dart';
import 'package:rg2/views/trainers/timer/controller/timer_settings_controller.dart';
import 'package:rg2/views/trainers/timer/view/scramble_text_widget.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';

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
          child: Text(StrRes.timerSettingsTitle, style: TextStyle(color: Get.textTheme.headline6.color)),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      //ListView c выбором темы
      body: Obx(() {
        /// Обработчик нажатий на кнопки изменений частоты метронома
        var _onChangeMetronomFrequencyByButtons;
        if (_controller.isMetronomEnabled) {
          _onChangeMetronomFrequencyByButtons = (index) {
            if (index == 0) {
              _controller.decreaseMetronomFrequency();
            } else if (index == 1) {
              _controller.resetMetronomFrequency();
            } else if (index == 2) {
              _controller.increaseMetronomFrequency();
            }
          };
        }

        /// Обработчик изменений слайдера частоты метронома
        var _onChangeMetronomFrequency;
        if (_controller.isMetronomEnabled) {
          _onChangeMetronomFrequency = (value) {
            _controller.metronomFrequency = value.toInt();
          };
        }

        /// Обработчик изменений слайдера размера шрифта скрамбла
        var _onChangeScrambleRatio;
        var _onChangeStartScrambleRatio;
        var _onChangeEndScrambleRatio;
        if (_controller.showScramble) {
          _onChangeScrambleRatio = (value) {
            _controller.scrambleTextRatio = value;
          };
          _onChangeStartScrambleRatio = (value) {
            _controller.showScrambleExample = true;
          };
          _onChangeEndScrambleRatio = (value) {
            _controller.showScrambleExample = false;
          };
        }

        return Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /// Задержка 0,5 сек перед стартом
                    SwitchListTile(
                      contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                      title: Text(
                        StrRes.timerDelayedStartText,
                        style: Get.textTheme.bodyText1,
                      ),
                      value: _controller.isDelayedStart,
                      onChanged: (v) {
                        _controller.isDelayedStart = v;
                      },
                    ),
                    SizedBox(height: UIHelper.SpaceSmall,),
                    /// Управление таймером одной рукой
                    SwitchListTile(
                      contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                      title: Text(
                        StrRes.timerOneHandedText,
                        style: Get.textTheme.bodyText1,
                      ),
                      value: _controller.isOneHanded,
                      onChanged: (v) {
                        _controller.isOneHanded = v;
                      },
                    ),
                    SizedBox(height: UIHelper.SpaceSmall,),
                    /// Цветные или белые иконки
                    SwitchListTile(
                      contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                      title: Text(
                        StrRes.timerIsIconColored,
                        style: Get.textTheme.bodyText1,
                      ),
                      value: _controller.isIconsColored,
                      onChanged: (v) {
                        _controller.isIconsColored = v;
                      },
                    ),
                    SizedBox(height: UIHelper.SpaceSmall,),
                    /// Метроном
                    SwitchListTile(
                      contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                      title: Text(
                        StrRes.timerMetronomText,
                        style: Get.textTheme.bodyText1,
                      ),
                      value: _controller.isMetronomEnabled,
                      onChanged: (v) {
                        _controller.isMetronomEnabled = v;
                      },
                    ),
                    /// Кнопки точной настройки частоты
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
                      child: Row(
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: _controller.isMetronomEnabled ? 1.0 : 0.5,
                              child: Text(
                                StrRes.timerMetronomFrequencyText,
                                style: Get.textTheme.bodyText1,
                              ),
                            )
                          ),
                          Container(
                            child: ToggleButtons(
                              children: [
                                Icon(Icons.chevron_left_rounded),
                                Text("${_controller.metronomFrequency}"),
                                Icon(Icons.chevron_right_rounded)
                              ],
                              isSelected: _selections,
                              onPressed: _onChangeMetronomFrequencyByButtons,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /// Слайдер выбора частоты метронома
                    Slider(
                      value: _controller.metronomFrequency.toDouble() ,
                      min: 1,
                      max: 240,
                      divisions: 240,
                      activeColor: Get.theme.accentColor,
                      label: _controller.metronomFrequency.toString(),
                      onChanged: _onChangeMetronomFrequency,
                    ),
                    /// Свитч отображения скрамбла
                    SwitchListTile(
                      contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                      title: Text(
                        StrRes.timerShowScrambleText,
                        style: Get.textTheme.bodyText1,
                      ),
                      value: _controller.showScramble,
                      onChanged: (value) {
                        _controller.showScramble = value;
                      },
                    ),
                    /// Текст "Размер шрифта"
                    Padding(
                      padding: const EdgeInsets.only(left: UIHelper.SpaceSmall),
                      child: Opacity(
                        opacity: _controller.showScramble ? 1.0 : 0.5,
                        child: Text(
                          StrRes.timerScrambleTextSize,
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                    ),
                    /// Слайдер выбора размера шрифта
                    Slider(
                      value: _controller.scrambleTextRatio,
                      min: 0.7,
                      max: 1.3,
                      divisions: 6,
                      activeColor: Get.theme.accentColor,
                      onChanged: _onChangeScrambleRatio,
                      onChangeStart: _onChangeStartScrambleRatio,
                      onChangeEnd: _onChangeEndScrambleRatio,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
                visible: _controller.showScrambleExample,
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
        );
      }),
      bottomNavigationBar: BottomBarWithBackButton(),
    );
  }


}
