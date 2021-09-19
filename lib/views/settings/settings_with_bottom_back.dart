import 'package:flutter/material.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';
import 'package:rg2/views/shared/bottom_bar_with_back_button.dart';

class SettingsWithBottomBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsScreen(),
      bottomNavigationBar: BottomBarWithBackButton(),
    );
  }
}
