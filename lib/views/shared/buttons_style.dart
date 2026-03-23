
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/theme_compat.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Get.textTheme.button.color,
  backgroundColor: Get.theme.primaryColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle raisedButtonStyleWithPadding = ElevatedButton.styleFrom(
  foregroundColor: Get.textTheme.button.color,
  backgroundColor: Get.theme.primaryColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final ButtonStyle raisedAccentButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Get.textTheme.button.color,
  backgroundColor: Get.theme.accentColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 10),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle raisedAccentButtonStyleWithPadding = ElevatedButton.styleFrom(
  foregroundColor: Get.textTheme.button.color,
  backgroundColor: Get.theme.accentColor,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Get.theme.primaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);
