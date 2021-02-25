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
        /// Обработчик нажатий на кнопки изменений времени ответа на вопрос
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
                  child: Row(
                    children: [
                      Expanded(
                          child: Opacity(
                            opacity: _controller.isTimerEnabled ? 1.0 : 0.5,
                            child: Text(StrRes.azbukaTrainerSettingsTimeForAnswer,
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

}
