import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

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
              R.appTheme,
              style: Theme.of(context).textTheme.headline5,
            ),
            /// Свитч выбора темная или светлая схема
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: UIHelper.SpaceSmall),
              title: Text(
                R.darkTheme,
                style: Theme.of(context).textTheme.headline6,
              ),
              value: _settings.isDarkThemeSelect.value,
              onChanged: (v) {
                _settings.isDarkThemeSelect.value = v;
              },
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
                        R.primaryColor,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      CircleAvatar(
                          backgroundColor: _settings.primaryThemeColor.value,
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
                      R.accentColor,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    CircleAvatar(
                        backgroundColor: _settings.accentThemeColor.value,
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
                R.textSize,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            /// Слайдер выбора размера шрифта
            Slider(
              value: _settings.textScaleFactor.value,
              min: 0.7,
              max: 1.3,
              divisions: 6,
              activeColor: Theme.of(context).accentColor,
              label: _settings.textScaleFactor.value.toStringAsFixed(2),
              onChanged: (value) {
                _settings.textScaleFactor.value = value;
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
            selectedColor: _settings.accentThemeColor.value,
            onColorChange: (color) {
              _settings.accentThemeColor.value = color;
            },
          ),
          CloseButton(
            color: _settings.accentThemeColor.value,
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
            selectedColor: _settings.primaryThemeColor.value,
            onColorChange: (color) {
              _settings.primaryThemeColor.value = color;
            },
          ),
          CloseButton(
            color: _settings.accentThemeColor.value,
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
