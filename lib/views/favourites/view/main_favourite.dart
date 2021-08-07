import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';
import 'package:rg2/views/favourites/view/favourite_dialog_list.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';

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
          actions: [
            IconButton(
              icon: const Icon(Icons.shuffle_rounded),
              color: Get.textTheme.headline5.color,
              tooltip: 'Перемешать',
              onPressed: () {
                _favController.shuffleFavourites();
              }
            ),
            IconButton(
              icon: const Icon(Icons.settings_rounded),
              color: Get.textTheme.headline5.color,
              tooltip: 'Настройки',
              onPressed: () {
                Get.to(() => SettingsScreenWithBottomBar());
              },
            ),
          ],
        ),
        body: Container(
          child: Obx(() =>
            (_favController.favourites.length == 0)
              ? Center(
                  child: Text(
                  StrRes.nothingInFavourites,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline5,
                ))
              : FavouriteDialogList(),
        )));
  }
}
