import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/dialogs/favourites/favourite_dialog_list.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class FavouriteDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Get.theme.primaryColor;
    return SafeArea(
      child: Center(
        child: Container(
          width: context.mediaQuerySize.width - 50,
          height: context.mediaQuerySize.height - 50,
          //GetX variant of MediaQuery.of(context).size.height - 50,
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(UIHelper.SpaceSmall),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StrRes.favouritesTitle, style: Get.textTheme.headline5),
                ),
                FavouriteListView(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: UIHelper.SpaceSmall),
                      child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(_primaryColor),
                          ),
                          child: Text(StrRes.backButtonText)),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
                        child: Text(
                          StrRes.favouriteDialogHint,
                          style: Get.textTheme.headline6.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }

}

class FavouriteListView extends StatelessWidget {
  final _learnController = Get.find<LearnController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Expanded(
          child: (_learnController.pages[0].currentList.length == 0)
              ? Center(
              child: Text(
                StrRes.nothingInFavourites,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline5,
              ))
              : FavouriteDialogList()),
    );
  }
}
