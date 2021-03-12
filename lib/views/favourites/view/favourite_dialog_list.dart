import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';
import 'package:rg2/views/favourites/view/favourite_dialog_card_item.dart';

class FavouriteDialogList extends StatelessWidget {
  final _favController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return ImplicitlyAnimatedReorderableList<MainDBItem>(
        items: _favController.favourites,
        spawnIsolate: true,
        areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
        onReorderFinished: (item, from, to, newList) {
          print("reorder - $from to $to, item - $item");
          _favController.reorderFavouritesElements(newList);
        },
        itemBuilder: (context, itemAnimation, item, index) {
          return Reorderable(
            key: ValueKey(item),
            builder: (context, dragAnimation, inDrag) {
              return AnimatedBuilder(
                  animation: dragAnimation,
                  builder: (context, child) {
                    Widget card = FavouriteDialogCardItem(item);

                    if (!inDrag) {
                      card = SizeFadeTransition(
                        animation: itemAnimation,
                        child: card,
                      );
                    }

                    return card;
                  });
            },
          );
        },
    );
  }
}
