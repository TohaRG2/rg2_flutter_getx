import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2/views/trainers/pll/controller/pll_settings_controller.dart';
import 'package:rg2/views/trainers/pll/view/pll_select_view/pll_algorithm_selection_view.dart';

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
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(UIHelper.SpaceSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Сложность тренировки:
                Container(
                  child: Text(StrRes.pllTrainerSettingsTrainingTitle, style: Get.textTheme.headline5,)
                ),

                /// Случайная сторона PLL алгоритма
                SwitchListTile(
                  contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                  title: Text(StrRes.pllTrainerSettingsAUF, style: Get.textTheme.headline6,),
                  value: _controller.randomAUF,
                  onChanged: (v) {
                    _controller.randomAUF = v;
                  },
                ),

                /// Случайная передняя сторона
                SwitchListTile(
                  contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                  title: Text(StrRes.pllTrainerSettingsRandomSide, style: Get.textTheme.headline6,),
                  value: _controller.randomFrontSide,
                  onChanged: (v) {
                    _controller.randomFrontSide = v;
                  },
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
                buildSetAnswerTime(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Кнопки настройки автопродолжения при успешном ответе
                buildSetGoodTime(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Кнопки настройки автопродолжения при ошибочном ответе
                buildSetBadTime(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Внешний вид кубика:
                Container(
                    child: Text(StrRes.pllTrainerSettingsCubeView, style: Get.textTheme.headline5,)
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

                SizedBox(height: UIHelper.SpaceMedium,),
                /// Варианты ответов
                Text(StrRes.pllTrainerSettingsAnswerVariants, style: Get.textTheme.headline5,),

                /// Выбор вариантов (все 21 или кастомные)
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
                buildSelectCustomVariantsCount(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Кнопка Выбрать/Переименовать алгоритмы
                buildSelectRenameButton(),
                SizedBox(height: UIHelper.SpaceMedium,),
              ],
            ),
          ),
        );
      }),

      bottomNavigationBar: BottomBarWithBackButton(),
    );
  }

  Widget buildSetAnswerTime() {
    /// Обработчик нажатий на кнопки изменений времени ответа на вопрос
    // создаем пустой обработчик
    Function _onChangeTimerEnabled;
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
    return buildSetTime(
        text: StrRes.pllTrainerSettingsTimeForAnswer,
        time: _controller.timeForAnswer.toString(),
        enabled: _controller.isTimerEnabled,
        onButtonsPressing: _onChangeTimerEnabled
    );
  }

  /// Виджет выбора времени автопродолжения при удачном ответе
  Widget buildSetGoodTime() {
    /// Обработчик нажатий на кнопки изменений времени овтопродолжения при удачном ответе
    Function _onChangeTime = (index) {
      if (index == 0) {
        _controller.decreaseGoodAnswerWaiting();
      } else if (index == 1) {
        _controller.resetGoodAnswerWaiting();
      } else if (index == 2) {
        _controller.increaseGoodAnswerWaiting();
      }
    };
    return buildSetTime(
        text: StrRes.pllTrainerSettingsTimeForGoodAnswer,
        time: (_controller.goodAnswerWaiting == 11) ? "∞" : "${_controller.goodAnswerWaiting}",
        enabled: true,
        onButtonsPressing: _onChangeTime
    );
  }


  /// Виджет выбора времени автопродолжения при ошибочном ответе
  Widget buildSetBadTime() {
    /// Обработчик нажатий на кнопки изменений времени овтопродолжения при ошибочном ответе
    Function _onChangeTime = (index) {
      if (index == 0) {
        _controller.decreaseBadAnswerWaiting();
      } else if (index == 1) {
        _controller.resetBadAnswerWaiting();
      } else if (index == 2) {
        _controller.increaseBadAnswerWaiting();
      }
    };
    return buildSetTime(
        text: StrRes.pllTrainerSettingsTimeForBadAnswer,
        time: (_controller.badAnswerWaiting == 11) ? "∞" : "${_controller.badAnswerWaiting}",
        enabled: true,
        onButtonsPressing: _onChangeTime
    );
  }

  /// Шаблон виджета выбора времени
  Widget buildSetTime({String text, String time, bool enabled, Function onButtonsPressing}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceMini),
      child: Row(
        children: [
          Expanded(
              child: Opacity(
                opacity: enabled ? 1.0 : 0.5,
                child: Text(
                  text,
                  style: Get.textTheme.headline6,
                ),
              )),
          Container(
            child: ToggleButtons(
              children: [
                Icon(Icons.chevron_left_rounded),
                Text("$time"),
                Icon(Icons.chevron_right_rounded)
              ],
              isSelected: [false, false, false],
              onPressed: onButtonsPressing,
            ),
          ),
        ],
      ),
    );
  }

  /// Кнопки изменений количества вариантов ответов
  Container buildSelectCustomVariantsCount() {
    /// Обработчик нажатий на кнопки изменений количества вариантов ответов
    // создаем пустой обработчик
    var _onChangeVariants;
    if (!_controller.showAllVariants) {
      // Переопредяем его, если отображаем не все варианты.
      // Если отображаем все варианты, то обработчик остается пустой и кнопки будут серыми
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
      child: Row(
        children: [
          Expanded(
              child: Opacity(
            opacity: _controller.showAllVariants ? 0.5 : 1.0,
            child: Text(
              StrRes.pllTrainerSettingsVariantsCount,
              style: Get.textTheme.headline6,
            ),
          )),
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
    );
  }

  Center buildSelectRenameButton() {
    return Center(
      child: ElevatedButton(
          style: raisedAccentButtonStyle,
          onPressed: () {
            Get.to(() => PllAlgorithmSelectionView(),
                transition: Transition.rightToLeft);
          },
          child: Container(
              padding: const EdgeInsets.all(UIHelper.SpaceMini),
              child: Text(
                StrRes.pllTrainerSettingsRenameAlgButtonText,
                style: Get.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ))),
    );
  }
}
