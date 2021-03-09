import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/settings_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class SwipeSettings extends StatelessWidget {
  const SwipeSettings({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final SettingsController _settings = Get.find();
    return Obx(
      () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                StrRes.settingsSwipe,
                style: Get.textTheme.headline5,
            ),
            SizedBox(
              height: UIHelper.SpaceSmall,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
              title: Text(
                StrRes.settingsSwipeMenuText,
                style: Get.textTheme.headline6,
              ),
              value: _settings.isSwipeEnabled.value,
              onChanged: (v) {
                _settings.isSwipeEnabled.value = v;
              },
            ),
          ]),
    );
  }
}
