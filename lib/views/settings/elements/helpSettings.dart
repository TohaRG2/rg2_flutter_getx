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
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StrRes.miniHelpSettingsText,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: UIHelper.SpaceSmall,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.miniHelpSettingsSwitch,
              style: Theme.of(context).textTheme.headline6,
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
