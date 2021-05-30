import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/iap/iap_controller.dart';
import 'package:rg2/controllers/iap/iap_helper.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class OpenAllPuzzles extends StatelessWidget {
  const OpenAllPuzzles({Key key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final SettingsController _settings = Get.find();
    final IAPController iapController = Get.find();
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //     StrRes.settingsPurchase,
          //     style: Get.textTheme.headline5,
          // ),
          // SizedBox(
          //   height: UIHelper.SpaceSmall,
          // ),
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.purchasePuzzlesText,
              style: Get.textTheme.headline6,
            ),
            value: _settings.isAllPuzzlesEnabled,
            onChanged: (value) {
              if (value) {
                _settings.isAllPuzzlesEnabled = true;
                //TODO Расскоментировать когда одобрит эппл
                // if (_settings.purchaserState & 2 != 0) {
                //   _settings.isAllPuzzlesEnabled = value;
                // } else {
                //   iapController.buy(IAPHelper.openAllPuzzlesId);
                // }
              } else {
                _settings.isAllPuzzlesEnabled = false;
              }
            },
          ),
        ]),
    );
  }
}
