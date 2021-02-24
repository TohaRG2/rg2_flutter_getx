import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class HelpSettings extends StatelessWidget {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    var clickCount = 0;
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// Подсказки по программе, при 5-ти кратном нажатии режим разработчика
          GestureDetector(
            child: Text(
              _settings.godMode ? "${StrRes.miniHelpSettingsText} +" : StrRes.miniHelpSettingsText,
              style: Get.textTheme.headline5,
            ),
            onTap: () {
              _settings.tryChangeGodMode();
            },
          ),
          SizedBox(
            height: UIHelper.SpaceSmall,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.miniHelpSettingsSwitch,
              style: Get.textTheme.headline6,
            ),
            value: _settings.isStartHelpEnabled.value,
            onChanged: (v) {
              _settings.isStartHelpEnabled.value = v;
            },
          ),
        ],
      ),
    );
  }
}
