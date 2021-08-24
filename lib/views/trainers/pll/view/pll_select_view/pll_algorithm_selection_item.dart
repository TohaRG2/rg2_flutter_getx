import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/pll_trainer_item.dart';
import 'package:rg2/views/shared/menu_card_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class PllAlgorithmSelectionItem extends StatelessWidget {
  final PllTrainerItem _pllTrainerItem;
  final Function(bool value, PllTrainerItem pllTrainerItem) _onChangeCheckBoxValue;
  final Function(PllTrainerItem pllTrainerItem) _onItemTap;

  PllAlgorithmSelectionItem({
    @required PllTrainerItem item, 
    @required Function(bool value, PllTrainerItem pllTrainerItem) onCheckBoxChange,
    @required Function(PllTrainerItem pllTrainerItem) onTap,
  }) : _pllTrainerItem = item, 
       _onChangeCheckBoxValue = onCheckBoxChange,
       _onItemTap = onTap;

  @override
  Widget build(BuildContext context) {
    var imagePath = _pllTrainerItem.imagePath;
    return GestureDetector(
      onTap: () => _onItemTap(_pllTrainerItem),
      child: MenuCardItem(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: imagePath.endsWith(".svg") ?
                SvgPicture.asset(imagePath, height: 65, width: 65,) :
                Image.asset(imagePath, height: 65, width: 65,),
            ),
            SizedBox(width: UIHelper.SpaceSmall,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${_pllTrainerItem.internationalName} ${_pllTrainerItem.maximName}",
                    style: Get.textTheme.subtitle1.copyWith(fontSize: 14, color: Get.theme.primaryColor),
                  ),
                  SizedBox(height: 8.0,),
                  Text("Название для кнопок:",
                    style: Get.textTheme.subtitle1.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 8.0,),
                  Text("${_pllTrainerItem.currentName}",
                    style: Get.textTheme.subtitle1.copyWith(fontSize: 14, color: Get.theme.accentColor),
                  )
                ],
              ),
            ),
            Checkbox(
              value: _pllTrainerItem.isChecked,
              onChanged: (value) => _onChangeCheckBoxValue(value, _pllTrainerItem),
            )
          ],
        ),
      ),
    );
  }
}
