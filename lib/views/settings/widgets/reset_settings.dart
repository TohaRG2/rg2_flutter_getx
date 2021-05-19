import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

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
    return AlertDialog(
      title: Text("Вы уверены, что хотите сбросить настройки для:"),
      content: ListTile(
        title: Text("Настройки интерфейса", style: Get.textTheme.headline6,),
        trailing: Radio (
          value: 0,
          groupValue: controller.internetUsage,
          onChanged: (value) {
            controller.internetUsage = value;
          },
        ),
      ),
      actions: [
        cancelButton(),
        okButton()
      ],
    );
  }

  Widget cancelButton() {
    return TextButton(onPressed: () {
      Get.back();
    }, child: Text(StrRes.buttonCancelText));
  }

  Widget okButton() {
    return TextButton(onPressed: () {
      Get.back();
    }, child: Text(StrRes.buttonOkText));
  }

}
