import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_controller.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';

class TrainerViewMenuItem extends StatelessWidget {
  final TrainersController _controller = Get.find();
  final TrainerMenuItem item;
  final Function(TrainerMenuItem) onItemSelected;
  final Function(TrainerMenuItem) onHelpSelected;
  final Function(TrainerMenuItem) onSettingsSelected;

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
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            softWrap: true,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(item.getIcHelpPath(), width: 30, color: _primaryColor),
                  ),
                  onTap: () {
                    onHelpSelected(item);
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(item.getIcSettingsPath(), width: 30, color: _primaryColor),
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
