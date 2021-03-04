import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/res/trainersMenu/azbuka_trainer.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/controller/azbuka_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/view/settings_scramble_gen_view.dart';

class SettingsAzbukaTrainerView extends StatelessWidget {
  final AzbukaSettingsController _controller = Get.find();
  final ScrambleGenSettingsView _azbukaView = ScrambleGenSettingsView();

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
                  padding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                  child: Text(StrRes.azbukaTrainerSettingsTrainingTitle, style: Get.textTheme.headline5,)
                ),

                /// Чекбоксы Углы/Ребра
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                        title: Text(StrRes.azbukaTrainerSettingsCorner),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _controller.isCornerEnabled,
                        onChanged: (value) {
                          _controller.isCornerEnabled = value;
                        }),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          title: Text(StrRes.azbukaTrainerSettingsEdge),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _controller.isEdgeEnabled,
                          onChanged: (value) {
                            _controller.isEdgeEnabled = value;
                          }),
                    ),
                  ],
                ),

                /// Игра на время
                SwitchListTile(
                  contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                  title: Text(StrRes.azbukaTrainerSettingsEnableTimer, style:Get.textTheme.headline6,),
                  value: _controller.isTimerEnabled,
                  onChanged: (value) {
                    _controller.isTimerEnabled = value;
                  },
                ),

                /// Кнопки настройки времени ответа
                buildSetAnswerTime(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Кнопки навтройки автопродолжения при успешном ответе
                buildSetGoodTime(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Кнопки навтройки автопродолжения при ошибочном ответе
                buildSetBadTime(),
                SizedBox(height: UIHelper.SpaceMedium,),

                /// Настройки азбуки
                _azbukaView.buildTableAndButtons(),
              ],
            )
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
        text: StrRes.azbukaTrainerSettingsTimeForAnswer,
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
        text: StrRes.azbukaTrainerSettingsTimeForGoodAnswer,
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
        text: StrRes.azbukaTrainerSettingsTimeForBadAnswer,
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


}
