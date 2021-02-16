import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_settings_controller.dart';

class SettingsPllTrainerView extends StatelessWidget {
  final PllSettingsController _controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(StrRes.pllTrainerSettingsTitle, style: TextStyle(color: Get.textTheme.headline5.color)),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
        body: Obx(() {
          /// Обработчик нажатий на кнопки изменений частоты метронома
          // создаем пустой обработчик
          var _onChangeTimerEnabled;
          if (_controller.isTimerEnabled) {
            //и переопредяем его, если таймер включен
            _onChangeTimerEnabled = (index) {
              if (index == 0) {
                _controller.decreaseTimerTime();
              } else if (index == 1) {
                _controller.resetTimerTime();
              } else if (index == 2) {
                _controller.increaseTimerTime();
              }
            };
          }

          /// Обработчик нажатий на кнопки изменений количества вариантов ответов
          // создаем пустой обработчик
          var _onChangeVariants;
          if (!_controller.showAllVariants) {
            //и переопредяем его, если отображаем не все варианты
            _onChangeVariants = (index) {
              if (index == 0) {
                _controller.decreaseVariantsCount();
              } else if (index == 1) {
                //_controller.resetVariantsCount();
              } else if (index == 2) {
                _controller.increaseVariantsCount();
              }
            };
          }

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(UIHelper.SpaceSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(StrRes.pllTrainerSettingsWhatsTraining, style: Get.textTheme.headline5,)
                  ),

                  /// Случайная сторона
                  SwitchListTile(
                    contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                    title: Text(StrRes.pllTrainerSettingsRandomSide, style: Get.textTheme.headline6,),
                    value: _controller.randomFrontSide,
                    onChanged: (v) {
                      _controller.randomFrontSide = v;
                    },
                  ),

                  /// Выбор количества сторон
                  ListTile(
                    contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                    title: Text(StrRes.pllTrainerSettings2SideRecognition, style: Get.textTheme.headline6,),
                    trailing: Radio(
                      value: true,
                      groupValue: _controller.twoSideRecognition,
                      onChanged: (v) {
                        _controller.twoSideRecognition = v;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                    title: Text(StrRes.pllTrainerSettings3SideRecognition, style: Get.textTheme.headline6,),
                    trailing: Radio(
                      value: false,
                      groupValue: _controller.twoSideRecognition,
                      onChanged: (v) {
                        _controller.twoSideRecognition = v;
                      },
                    ),
                  ),

                  /// Игра на время
                  SwitchListTile(
                    contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                    title: Text(StrRes.pllTrainerSettingsEnableTimer, style:Get.textTheme.headline6,),
                    value: _controller.isTimerEnabled,
                    onChanged: (v) {
                      _controller.isTimerEnabled = v;
                    },
                  ),

                  /// Кнопки настройки времени ответа
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
                    child: Row(
                      children: [
                        Expanded(
                            child: Opacity(
                              opacity: _controller.isTimerEnabled ? 1.0 : 0.5,
                              child: Text(StrRes.pllTrainerSettingsTimeForAnswer,
                                style: Get.textTheme.headline6,
                              ),
                            )
                        ),
                        Container(
                          child: ToggleButtons(
                            children: [
                              Icon(Icons.chevron_left_rounded),
                              Text("${_controller.timeForAnswer}"),
                              Icon(Icons.chevron_right_rounded)
                            ],
                            isSelected: [false, false, false],
                            onPressed: _onChangeTimerEnabled,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: UIHelper.SpaceMedium,),
                  /// Варианты ответов
                  Text(StrRes.pllTrainerSettingsAnswerVariants, style: Get.textTheme.headline5,),

                  /// Выбор вариантов
                  ListTile(
                    contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall, top: UIHelper.SpaceSmall),
                    title: Text(StrRes.pllTrainerSettingsAllVariants, style: Get.textTheme.headline6,),
                    trailing: Radio(
                      value: true,
                      groupValue: _controller.showAllVariants,
                      onChanged: (v) {
                        _controller.showAllVariants = v;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                    title: Text(StrRes.pllTrainerSettingsNotAllVariants, style: Get.textTheme.headline6,),
                    trailing: Radio(
                      value: false,
                      groupValue: _controller.showAllVariants,
                      onChanged: (v) {
                        _controller.showAllVariants = v;
                      },
                    ),
                  ),
                  SizedBox(height: UIHelper.SpaceSmall,),

                  /// Кнопки настройки количества вариантов для ответа
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
                    child: Row(
                      children: [
                        Expanded(
                            child: Opacity(
                              opacity: _controller.showAllVariants ? 0.5 : 1.0,
                              child: Text(StrRes.pllTrainerSettingsVariantsCount,
                                style: Get.textTheme.headline6,
                              ),
                            )
                        ),
                        Container(
                          child: ToggleButtons(
                            children: [
                              Icon(Icons.chevron_left_rounded),
                              Text("${_controller.variantsCount}"),
                              Icon(Icons.chevron_right_rounded)
                            ],
                            isSelected: [false, false, false],
                            onPressed: _onChangeVariants,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: UIHelper.SpaceMedium,),

                  /// Кнопка Выбрать/Переименовать алгоритмы
                  Center(
                    child: FlatButton(
                      color: Get.theme.accentColor,
                      onPressed: () {
                        print("Rename algoritms pressed");
                      },
                      child: Text(StrRes.pllTrainerSettingsRenameAlgButtonText, style: Get.textTheme.bodyText2,)
                    ),
                  ),

                ],
              ),
            ),
          );
        }),

        bottomNavigationBar: BottomBarWithBackButton(),
    );
  }
}
