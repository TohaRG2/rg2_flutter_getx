import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/models/trainer_menu_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class TrainerViewMenuItem extends StatelessWidget {
  final TrainerMenuItem item;
  final Function(TrainerMenuItem) onItemSelected;
  final Function(TrainerMenuItem) onHelpSelected;
  final Function(TrainerMenuItem) onSettingsSelected;

  final double _iconWidth = 30.0;

  TrainerViewMenuItem({this.item, this.onItemSelected, this.onHelpSelected, this.onSettingsSelected});

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Theme.of(context).primaryColor;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        child: Container(
          child: Material(
            //color: Colors.amberAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black54,
            /// Если не сработали нажатия на Настройки и на Подсказки - обрабатываем нажатие на основную плашку
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    item.getAssetFilePath(),
                    height: 70,
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: UIHelper.SpaceSmall),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            softWrap: true,
                            maxLines: 2,
                            style: Get.textTheme.bodyText2,
                          ),
                        ],
                      ),
                    )),
                /// Обрабатываем нажатия на кнопки подсказок
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMedium),
                    child: Image.asset(item.getIcHelpPath(), width: _iconWidth, color: _primaryColor),
                  ),
                  onTap: () {
                    onHelpSelected(item);
                  },
                ),
                /// Обрабатываем нажатия на кнопки настроеек
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMedium),
                    child: Image.asset(item.getIcSettingsPath(), width: _iconWidth, color: _primaryColor),
                  ),
                  onTap: (){
                    onSettingsSelected(item);
                  },
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          onItemSelected(item);
        },
      ),
    );
  }
}
