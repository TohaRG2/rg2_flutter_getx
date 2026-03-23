import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/menu_card_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class FavouriteDialogCardItem extends StatelessWidget {
  final _learnController = Get.find<LearnController>();
  final MainDBItem _item;

  FavouriteDialogCardItem(this._item);

  @override
  Widget build(BuildContext context) {
    final _imagePath = _item.getAssetFilePath(); // _learnController.getAssetFilePath(_item.icon, _item.phase);
    final List<Widget> actions = getActions();

    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: actions,
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: actions,
      ),
      child: GestureDetector(
        child: MenuCardItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(_imagePath, height: 66,),
              SizedBox(width: 15,),
              Expanded(
                child: Text(
                  _item.title,
                  softWrap: true,
                  maxLines: 3,
                  style: (Get.textTheme.titleSmall ?? const TextStyle()).copyWith(fontSize: 18),
                ),
              ),
              const Handle(
                delay: Duration(milliseconds: 100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Icon(
                    Icons.drag_handle_outlined,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          _learnController.onFavouriteItemClick(_item);
        },
      ),
    );
  }

  List<Widget> getActions() {
    return [
      SlidableAction(
        onPressed: (_) {
          _learnController.removeElementFromFavourites(_item);
        },
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: StrRes.deleteItem,
      ),
    ];
  }

}
