
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Get.textTheme.button.color,
  primary: Get.theme.primaryColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle raisedButtonStyleWithPadding = ElevatedButton.styleFrom(
  onPrimary: Get.textTheme.button.color,
  primary: Get.theme.primaryColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final ButtonStyle raisedAccentButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Get.textTheme.button.color,
  primary: Get.theme.accentColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle raisedAccentButtonStyleWithPadding = ElevatedButton.styleFrom(
  onPrimary: Get.textTheme.button.color,
  primary: Get.theme.accentColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: Get.theme.primaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);
