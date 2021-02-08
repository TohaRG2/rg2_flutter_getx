import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/learn/detail/learn_detail_screen.dart';

class FavouriteDialogCardItem extends StatelessWidget {
  final _learnController = Get.find<LearnController>();
  final MainDBItem _item;

  FavouriteDialogCardItem(this._item);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final _imagePath = _learnController.getAssetFilePath(_item.icon, _item.phase);
    final List<Widget> actions = [
      SlideAction(
        closeOnTap: true,
        color: Colors.redAccent,
        onTap: () {
          _learnController.removeElementFromFavourites(_item);
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              const SizedBox(height: 4),
              Text(
                StrRes.deleteItem,
                style: textTheme.bodyText2.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      actions: actions,
      secondaryActions: actions,
      child: GestureDetector(
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _imagePath.endsWith(".svg") ?
                      SvgPicture.asset(_imagePath, height: 65,) :
                      Image.asset(_imagePath, height: 65,),
                  ),
                  Expanded(
                    child: Text(
                      _item.title,
                      softWrap: true,
                      maxLines: 3,
                      style: theme.textTheme.headline6.copyWith(fontSize: 18),
                    ),
                  ),
                  const Handle(
                    delay: Duration(milliseconds: 100),
                    child: Icon(
                      Icons.drag_handle_outlined,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          if (_item.url == "submenu") {
            _learnController.changePageAndPhaseTo(_item.description);
            do
              Get.back();
            while (Get.currentRoute != "/");
          } else {
            _learnController.changePageAndPhaseTo(_item.phase);
            do
              Get.back();
            while (Get.currentRoute != "/");
            Get.to(LearnDetailScreen(_item.phase, _item.id),
                transition: Transition.fadeIn);

          }
        },
      ),
    );
  }
}
