import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class ResetSettings extends GetWidget<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          onPressed: () {
            Get.dialog(_resetDialog());
          },
          child: Text("Настройки по-умолчанию"))
      ],
    );
  }

  Widget _resetDialog() {
    return Obx(
      () => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIHelper.SpaceSmall),
        ),
        elevation: UIHelper.SpaceMedium,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceMedium, vertical: UIHelper.SpaceSmall),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Сброс настроек:", style: Get.textTheme.headline5,),
                SizedBox(height: UIHelper.SpaceMedium,),
                CheckboxListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    title: Text("Интерфейс", style: Get.textTheme.headline6,),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.resetMainSettings,
                    onChanged: (value) {
                      controller.resetMainSettings = value;
                    }),
                CheckboxListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    title: Text("Комментарии к этапам", style: Get.textTheme.headline6,),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.resetComments,
                    onChanged: (value) {
                      controller.resetComments = value;
                    }),
                CheckboxListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    title: Text("Время сборок в таймере", style: Get.textTheme.headline6,),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: controller.resetTimerTimes,
                    onChanged: (value) {
                      controller.resetTimerTimes = value;
                    }),
                SizedBox(height: UIHelper.SpaceMedium,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cancelButton(),
                    okButton(),
                  ],
                ),
              ],
          ),
        ),
      ),
    );
  }

  Widget cancelButton() {
    return TextButton(onPressed: () {
      Get.back();
    }, child: Text(StrRes.buttonCancelText));
  }

  Widget okButton() {
    return TextButton(
      onPressed: () {
        controller.resetSettings();
      },
      child: Text(StrRes.buttonOkText,
          style: TextStyle(color: Get.theme.accentColor)
    ));
  }

}
