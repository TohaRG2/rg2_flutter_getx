import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';
import 'package:rg2_flutter_getx/views/dialogs/favourites/favourite_dialog.dart';
import 'package:rg2_flutter_getx/views/learn/detail/learn_detail_screen.dart';

class DrawerMenuItem extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final MainDBItem item;
  final Function(MainDBItem) onItemSelected;

  DrawerMenuItem({this.item, this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    var _accentColor = Theme.of(context).accentColor;
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
                  child: SvgPicture.asset(
                    _learnController.getAssetFilePath(item.icon, item.phase),
                    height: 60,
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
                        style: Get.textTheme.bodyText2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          item.comment,
                          maxLines: 1,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                )),
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
