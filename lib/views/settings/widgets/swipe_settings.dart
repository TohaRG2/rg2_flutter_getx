import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class SwipeSettings extends StatelessWidget {
  final SettingsController settings = Get.find();

  SwipeSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Читаем themeChanged для реактивного обновления при смене темы
        // ignore: unused_local_variable
        final _ = settings.themeChanged.value;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                StrRes.settingsSwipe,
                style: Get.textTheme.headline6,
            ),
            SizedBox(
              height: UIHelper.SpaceSmall,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
              title: Text(
                StrRes.settingsSwipeMenuText,
                style: Get.textTheme.bodyText1,
              ),
              value: settings.isSwipeEnabled,
              onChanged: (value) {
                settings.isSwipeEnabled = value;
              },
            ),
          ]);
      },
    );
  }
}
