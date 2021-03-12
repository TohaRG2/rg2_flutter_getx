import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_detail_controller.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/favourites/dialog/favourite_dialog.dart';

class FavouriteButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    LearnDetailController _controller = Get.find();
    final _iconColor = Theme.of(context).scaffoldBackgroundColor;
    return Obx(() {
        bool _isFavourite = _controller.currentItem.value.isFavourite;
        return GestureDetector(
          child: Container(
            color: Colors.transparent,  // Выглядит странно, но без этого область нажатия на иконку не увеличивается на величину padding
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10.0, top: 15.0, bottom: 15.0, left: 5.0),
              child: Icon( _isFavourite ?
              Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: _iconColor,
              ),
            ),
          ),
          onTap: () {
            _controller.changeCurrentFavStatus();
          },
          onLongPress: () {
            Get.dialog(FavouriteDialog());
          },
        );
      }
    );
  }
}
