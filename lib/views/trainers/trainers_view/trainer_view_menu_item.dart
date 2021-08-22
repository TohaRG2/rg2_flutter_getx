import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/shared/menu_card_item.dart';
import 'package:rg2/views/trainers/model/trainer_menu_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class TrainerViewMenuItem extends StatelessWidget {
  final TrainerMenuItem item;
  final Function(TrainerMenuItem) onItemSelected;
  final Function(TrainerMenuItem) onHelpSelected;
  final Function(TrainerMenuItem) onSettingsSelected;

  final double _iconWidth = 25.0;

  TrainerViewMenuItem({this.item, this.onItemSelected, this.onHelpSelected, this.onSettingsSelected});

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      child: MenuCardItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(item.getAssetFilePath(), height: 65,),
            SizedBox(width: 15,),
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
                        style: Get.textTheme.bodyText1,
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
      onTap: () {
        onItemSelected(item);
      },
    );
  }
}
