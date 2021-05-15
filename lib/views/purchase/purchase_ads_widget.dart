import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class PurchaseAds extends StatelessWidget {
  const PurchaseAds({Key key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final SettingsController _settings = Get.find();
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.purchaseAdsText,
              style: Get.textTheme.headline6,
            ),
            value: _settings.isAdDisabled,
            onChanged: (v) {
              _settings.isAdDisabled = v;
            },
          ),
        ]),
    );
  }
}
