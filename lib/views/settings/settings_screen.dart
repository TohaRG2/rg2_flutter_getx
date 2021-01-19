import "package:flutter/material.dart";
import 'package:rg2_flutter_getx/views/settings/elements/purchase_settings.dart';
import 'package:rg2_flutter_getx/views/settings/elements/swipe_settings.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

import 'elements/helpSettings.dart';
import 'elements/internetSettings.dart';
import 'elements/themeSettings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(R.settingsTitle,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline5.color)
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      //ListView c выбором темы
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(UIHelper.SpaceSmall),
          child: Column(
            children: [
              ThemeSettings(),
              SizedBox(
                height: UIHelper.SpaceMedium,
              ),
              HelpSettings(),
              SizedBox(
                height: UIHelper.SpaceMedium,
              ),
              SwipeSettings(),
              SizedBox(
                height: UIHelper.SpaceMedium,
              ),
              PurchaseSettings(),
              SizedBox(
                height: UIHelper.SpaceMedium,
              ),
              SizedBox(
                height: UIHelper.SpaceSmall,
              ),
              InternetSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
