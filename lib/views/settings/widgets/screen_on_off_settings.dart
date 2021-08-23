import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';


class ScreenOnOffSettings extends StatelessWidget {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    // Wakelock.enable();
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StrRes.screenOnOffSettingsText,
            style: Get.textTheme.headline6,
          ),
          SizedBox(
            height: UIHelper.SpaceSmall,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.screenOnOffSettingsGlobal,
              style: Get.textTheme.bodyText1,
            ),
            value: _settings.alwaysScreenOnGlobal,
            onChanged: (value) {
              _settings.alwaysScreenOnGlobal = value;
              if (value) _settings.alwaysScreenOnTimer = value;
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.screenOnOffSettingsInTimer,
              style: Get.textTheme.bodyText1,
            ),
            value: _settings.alwaysScreenOnTimer,
            onChanged: (value) {
              _settings.alwaysScreenOnTimer = value;
              if (!value) _settings.alwaysScreenOnGlobal = value;
            },
          ),
        ],
      ),
    );
  }
}
