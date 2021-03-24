import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/widgets/theme_switch.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class ThemeSettings extends StatelessWidget {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Заголовок "Внешний вид:"
            Text(
              StrRes.appTheme,
              style: Get.textTheme.headline5,
            ),
            SizedBox(height: UIHelper.SpaceSmall,),
            /// Свитч выбора темная или светлая схема
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: UIHelper.SpaceSmall),
                  child: Text(StrRes.darkTheme, style: Get.textTheme.headline6,)
                ),
                ThemeSwitch(),
              ],
            ),
            SizedBox(
              height: UIHelper.SpaceSmall,
            ),
            /// Выбор цвета основного цвета
            Padding(
                padding: const EdgeInsets.only(
                    left: UIHelper.SpaceSmall, right: UIHelper.SpaceSmall),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StrRes.primaryColor,
                        style: Get.textTheme.headline6,
                      ),
                      CircleAvatar(
                          backgroundColor: _settings.primaryThemeColor,
                          radius: UIHelper.SpaceMedium),
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
              padding: const EdgeInsets.only(
                  left: UIHelper.SpaceSmall, right: UIHelper.SpaceSmall),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StrRes.accentColor,
                      style: Get.textTheme.headline6,
                    ),
                    CircleAvatar(
                        backgroundColor: _settings.accentThemeColor,
                        radius: UIHelper.SpaceMedium),
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
              value: _settings.textScaleFactor,
              min: 0.7,
              max: 1.3,
              divisions: 6,
              activeColor: Theme.of(context).accentColor,
              label: _settings.textScaleFactor.toStringAsFixed(2),
              onChanged: (value) {
                _settings.textScaleFactor = value;
              },
            ),
          ],
        ));
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
            selectedColor: _settings.accentThemeColor,
            onColorChange: (color) {
              _settings.accentThemeColor = color;
            },
          ),
          CloseButton(
            color: _settings.accentThemeColor,
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
            selectedColor: _settings.primaryThemeColor,
            onColorChange: (color) {
              _settings.primaryThemeColor = color;
            },
          ),
          CloseButton(
            color: _settings.accentThemeColor,
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
