import "package:flutter/material.dart";
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/widgets/reset_settings.dart';
import 'package:rg2/views/settings/widgets/theme_switch.dart';
import 'package:rg2/views/shared/preloader.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/help/bottom_bar_with_back_button.dart';

import 'widgets/help_settings.dart';
import 'widgets/internet_settings.dart';
import 'widgets/swipe_settings.dart';
import 'widgets/user_auth_settings.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      logPrint("SettingsScreen - ${controller.themeChanged.value}, ${controller.isDarkThemeSelect}, ${Get.theme.backgroundColor}");
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(UIHelper.SpaceSmall),
                child: Column(
                  children: [
                    UserAuthSettings(),
                    SizedBox(height: UIHelper.SpaceMedium,),
                    _themeSettings(context),
                    SizedBox(height: UIHelper.SpaceMedium,),
                    HelpSettings(),
                    SizedBox(height: UIHelper.SpaceMedium,),
                    SwipeSettings(),
                    SizedBox(height: UIHelper.SpaceMedium,),
                    SizedBox(height: UIHelper.SpaceSmall,),
                    InternetSettings(),
                    SizedBox(height: UIHelper.SpaceMedium,),
                    ResetSettings(),
                    SizedBox(height: UIHelper.SpaceLarge)
                  ],
                ),
              ),
            ),
            Visibility(
                visible: controller.showPreloader,
                child: Preloader()
            )
          ],
        ),
      );
    },
    );
  }


  Widget _themeSettings(BuildContext context) {
    return Obx(
          () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Заголовок "Внешний вид:"
          Text(
            StrRes.appTheme,
            style: Get.textTheme.headline5,
          ),
          SizedBox(
            height: UIHelper.SpaceSmall,
          ),

          /// Свитч выбора темная или светлая схема
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                  child: Text(
                    StrRes.darkTheme,
                    style: Get.textTheme.headline6,
                  )),
              ThemeSwitch(),
            ],
          ),
          SizedBox(
            height: UIHelper.SpaceSmall,
          ),

          /// Выбор цвета основного цвета
          Padding(
              padding: const EdgeInsets.only(left: UIHelper.SpaceSmall, right: UIHelper.SpaceSmall),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StrRes.primaryColor,
                      style: Get.textTheme.headline6,
                    ),
                    CircleAvatar(backgroundColor: controller.primaryThemeColor, radius: UIHelper.SpaceMedium),
                  ],
                ),
                onTap: () {
                  _selectPrimaryColor();
                },
              )),
          SizedBox(
            height: UIHelper.SpaceMedium,
          ),

          /// Выбор цвета акцента
          Padding(
            padding: const EdgeInsets.only(left: UIHelper.SpaceSmall, right: UIHelper.SpaceSmall),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StrRes.accentColor,
                    style: Get.textTheme.headline6,
                  ),
                  CircleAvatar(backgroundColor: controller.accentThemeColor, radius: UIHelper.SpaceMedium),
                ],
              ),
              onTap: () {
                _selectAccentColor();
              },
            ),
          ),
          SizedBox(
            height: UIHelper.SpaceMedium,
          ),

          /// Текст "Размер шрифта"
          Padding(
            padding: const EdgeInsets.only(left: UIHelper.SpaceSmall),
            child: Text(
              StrRes.textSize,
              style: Get.textTheme.headline6,
            ),
          ),

          /// Слайдер выбора размера шрифта
          Slider(
            value: controller.textScaleFactor,
            min: 0.7,
            max: 1.3,
            divisions: 6,
            activeColor: Theme.of(context).accentColor,
            label: controller.textScaleFactor.toStringAsFixed(2),
            onChanged: (value) {
              controller.textScaleFactor = value;
            },
          ),
        ],
      ),
    );
  }

  /// Диалоги выбора цвета https://pub.dev/packages/flutter_material_color_picker/example

  void _selectAccentColor() async {
    Get.bottomSheet(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialColorPicker(
            shrinkWrap: true,
            allowShades: true,
            selectedColor: controller.accentThemeColor,
            onColorChange: (color) {
              controller.accentThemeColor = color;
            },
          ),
          CloseButton(
            color: controller.accentThemeColor,
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }

  void _selectPrimaryColor() async {
    Get.bottomSheet(
      Row(
        children: [
          MaterialColorPicker(
            shrinkWrap: true,
            allowShades: true,
            selectedColor: controller.primaryThemeColor,
            onColorChange: (color) {
              controller.primaryThemeColor = color;
            },
          ),
          CloseButton(
            color: controller.accentThemeColor,
            onPressed: () {
              Get.back();
            },
          )
        ],
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
