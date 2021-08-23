import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/shared/menu_card_item.dart';

class DrawerMenuItem extends StatelessWidget {
  final MainDBItem item;
  final Function(MainDBItem) onItemSelected;

  DrawerMenuItem({this.item, this.onItemSelected});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: MenuCardItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              item.getAssetFilePath(), // _learnController.getAssetFilePath(item.icon, item.phase),
              height: 60,
            ),
            SizedBox(width: 15,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      softWrap: true,
                      maxLines: 2,
                      style: Get.textTheme.bodyText1,
                    ),
                    Visibility(
                      visible: item.comment.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          item.comment,
                          maxLines: 1,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      onTap: () {
        onItemSelected(item);
      },
    );
  }
}
