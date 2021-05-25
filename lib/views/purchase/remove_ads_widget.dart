import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/iap/iap_controller.dart';
import 'package:rg2/controllers/iap/iap_helper.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class RemoveAds extends StatelessWidget {
  const RemoveAds({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsController _settings = Get.find();
    final IAPController iapController = Get.find();
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
            onChanged: (value) {
              if (value) {
                if (_settings.purchaserState & 1 != 0) {
                  _settings.isAdDisabled = value;
                } else {
                  iapController.buy(IAPHelper.adsRemoveId);
                }
              } else {
                _settings.isAdDisabled = false;
              }
            },
          ),
        ]),
    );
  }
}
