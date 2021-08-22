import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/iap/iap_controller.dart';
import 'package:rg2/controllers/iap/iap_helper.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class OpenAllPuzzles extends StatelessWidget {
  const OpenAllPuzzles({Key key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final SettingsController settings = Get.find();
    final IAPController iapController = Get.find();
    final LearnController learnController = Get.find();
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
            title: Text(
              StrRes.purchasePuzzlesText,
              style: Get.textTheme.headline6,
            ),
            value: settings.isAllPuzzlesEnabled,
            onChanged: (value) {
              if (value) {
                if (settings.purchaserState & 2 != 0) {
                  settings.isAllPuzzlesEnabled = true;
                } else {
                  iapController.buy(IAPHelper.openAllPuzzlesId);
                }
              } else {
                settings.isAllPuzzlesEnabled = false;
              }
              learnController.searchInitialization();
              learnController.searchTextListener();
            },
          ),
        ]),
    );
  }
}
