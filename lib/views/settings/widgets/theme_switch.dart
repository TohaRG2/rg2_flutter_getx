import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class ThemeSwitch extends GetWidget<SettingsController> {
  const ThemeSwitch({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterSwitch(
          width: 70.0,
          height: 40.0,
          toggleSize: 40.0,
          borderRadius: 20.0,
          padding: 3.0,
          activeToggleColor: Color(0xFF6E6E6E),
          inactiveToggleColor: Color(0xFF2F363D),
          activeSwitchBorder: Border.all(
            color: Color(0xFF3C3C3C),
            width: 3.0,
          ),
          inactiveSwitchBorder: Border.all(
            color: Color(0xFFD1D5DA),
            width: 3.0,
          ),
          activeColor: Color(0xFF272727),
          inactiveColor: Colors.white,
          activeIcon: Icon(
            Icons.nightlight_round,
            color: Color(0xFFF8E3A1),
          ),
          inactiveIcon: Icon(
            Icons.wb_sunny,
            color: Color(0xFFFFDF5D),
          ),
          value: controller.isDarkThemeSelect,
          onToggle: (value) {
            controller.isDarkThemeSelect = value;
          }),
    );
  }
}
