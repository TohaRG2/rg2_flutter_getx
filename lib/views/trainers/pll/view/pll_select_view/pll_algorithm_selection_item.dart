import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rg2_flutter_getx/database/entitys/pll_trainer_item.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class PllAlgorithmSelectionItem extends StatelessWidget {
  final PllTrainerItem _pllTrainerItem;

  PllAlgorithmSelectionItem({PllTrainerItem item}) : _pllTrainerItem = item;

  @override
  Widget build(BuildContext context) {
    var imagePath = _pllTrainerItem.imagePath;
    print(imagePath);
    return Container(
      padding: const EdgeInsets.all(UIHelper.SpaceMini),
      child: Card(
        elevation: 8.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: imagePath.endsWith(".svg") ?
                  SvgPicture.asset(imagePath, height: 70, width: 70,) :
                  Image.asset(imagePath, height: 70, width: 70,),
              ),
              Text("${_pllTrainerItem.currentName}")
              //Text("${_pllTrainerItem.customName}")
            ],
          ),
        ),
      ),
    );
  }
}
