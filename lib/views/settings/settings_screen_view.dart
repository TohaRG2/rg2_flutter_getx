import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/help/bottom_bar_with_back_button.dart';

import 'widgets/helpSettings.dart';
import 'widgets/internetSettings.dart';
import 'widgets/swipe_settings.dart';
import 'widgets/theme_settings.dart';
import 'widgets/user_auth_settings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(StrRes.settingsTitle,
            style: TextStyle(
              color: Get.textTheme.headline5.color)
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      //ListView c выбором темы
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(UIHelper.SpaceSmall),
          child: Column(
            children: [
              UserAuthSettings(),
              SizedBox(height: UIHelper.SpaceMedium,),
              ThemeSettings(),
              SizedBox(height: UIHelper.SpaceMedium,),
              HelpSettings(),
              SizedBox(height: UIHelper.SpaceMedium,),
              SwipeSettings(),
              SizedBox(height: UIHelper.SpaceMedium,),
              SizedBox(height: UIHelper.SpaceSmall,),
              InternetSettings(),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsScreenWithBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsScreen(),
      bottomNavigationBar: BottomBarWithBackButton(),
    );
  }
}
