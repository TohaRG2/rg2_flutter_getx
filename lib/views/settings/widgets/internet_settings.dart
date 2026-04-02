import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class InternetSettings extends StatelessWidget {
  final SettingsController _settings = Get.find();

  InternetSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StrRes.internetSettingsText,
            style: Get.textTheme.headline6,
          ),
          SizedBox(height: UIHelper.SpaceSmall,),
          Padding(
            padding: const EdgeInsets.only(
                left: UIHelper.SpaceSmall, right: UIHelper.SpaceSmall),
            child: Text(
              StrRes.internetSettingsHelp,
              style: Get.textTheme.bodyText1,
            ),
          ),
          SizedBox(height: UIHelper.SpaceSmall,),
          RadioGroup<int>(
            groupValue: _settings.internetUsage,
            onChanged: (value) {
              if (value != null) {
                _settings.internetUsage = value;
              }
            },
            child: Column(
              children: [
                RadioListTile<int>(
                  title: Text(StrRes.allInternetUsingText, style: Get.textTheme.bodyText1,),
                  value: 0,
                ),
                RadioListTile<int>(
                  title: Text(StrRes.wiFiUsingText, style: Get.textTheme.bodyText1,),
                  value: 2,
                ),
                RadioListTile<int>(
                  title: Text(StrRes.disableInternetUsingText, style: Get.textTheme.bodyText1,),
                  value: 3,
                ),
              ],
            ),
          ),
          SizedBox(height: UIHelper.SpaceLarge,),
        ],
     ),
    );
  }
}
