import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_controller.dart';
import 'package:rg2/controllers/settings_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/favourites/dialog/favourite_dialog.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/favourites/view/favourite_dialog_list.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';

class MainFavourite extends StatelessWidget {
  final _favController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    _favController.reloadFromBase();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(StrRes.favouritesTitle,
                style: TextStyle(
                    color: Get.textTheme.headline5.color)
            ),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        ),
        body: Container(
            child: Obx(
          () => (_favController.favourites.length == 0)
              ? Center(
                  child: Text(
                  StrRes.nothingInFavourites,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline5,
                ))
              : FavouriteDialogList(),
        )
        )
    );
  }
}
