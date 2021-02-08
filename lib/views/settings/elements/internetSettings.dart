import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class InternetSettings extends StatelessWidget {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StrRes.internetSettingsText,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: UIHelper.SpaceSmall,),
          Padding(
            padding: const EdgeInsets.only(
                left: UIHelper.SpaceSmall, right: UIHelper.SpaceSmall),
            child: Text(
              StrRes.internetSettingsHelp,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: UIHelper.SpaceSmall,),
          ListTile(
            title: Text(StrRes.allInternetUsingText, style: Theme.of(context).textTheme.headline6,),
            trailing: Radio (
              value: 0,
              groupValue: _settings.internetUsage.value,
              onChanged: (v) {
                _settings.internetUsage.value = v;
              },
            ),
          ),
          ListTile(
            title: Text(StrRes.wiFiUsingText, style: Theme.of(context).textTheme.headline6,),
            trailing: Radio (
              value: 2,
              groupValue: _settings.internetUsage.value,
              onChanged: (v) {
                _settings.internetUsage.value = v;
              },
            ),
          ),
          ListTile(
            title: Text(StrRes.disableInternetUsingText, style: Theme.of(context).textTheme.headline6,),
            trailing: Radio (
              value: 3,
              groupValue: _settings.internetUsage.value,
              onChanged: (v) {
                _settings.internetUsage.value = v;
              },
            ),
          ),
          SizedBox(height: UIHelper.SpaceLarge,),
        ],
     ),
    );
  }
}
