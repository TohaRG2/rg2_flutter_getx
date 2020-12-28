import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/settingsController.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

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
                R.settingsSwipe,
                style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: UIHelper.SpaceSmall,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
              title: Text(
                R.settingsSwipeMenuText,
                style: Theme.of(context).textTheme.headline6,
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
