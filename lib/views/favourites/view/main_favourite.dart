import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_controller.dart';
import 'package:rg2/controllers/settings_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/dialogs/favourites/favourite_dialog.dart';
import 'package:rg2/views/dialogs/favourites/favourite_dialog_list.dart';

class MainFavourite extends StatelessWidget {
  final _learnController = Get.find<LearnController>();

  @override
  Widget build(BuildContext context) {
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
          () => (_learnController.pages[0].currentList.length == 0)
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
