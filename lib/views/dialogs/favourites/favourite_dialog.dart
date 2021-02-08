import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/dialogs/favourites/favourite_dialog_list.dart';

class FavouriteDialog extends StatelessWidget {
  final _learnController = Get.find<LearnController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var _primaryColor = theme.primaryColor;
    return SafeArea(
      child: Center(
        child: Container(
          width: context.mediaQuerySize.width - 50,
          height: context.mediaQuerySize.height - 50,
          //GetX variant of MediaQuery.of(context).size.height - 50,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(
            () => Container(
              padding: EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StrRes.favouritesTitle, style: theme.textTheme.headline5),
                ),
                Expanded(
                    child: (_learnController.pages[0].currentList.length == 0)
                        ? Center(
                            child: Text(
                            StrRes.nothingInFavourites,
                            style: theme.textTheme.headline5,
                          ))
                        : FavouriteDialogList()),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          color: _primaryColor,
                          child: Text(StrRes.backButtonText)),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          StrRes.favouriteDialogHint,
                          style: theme.textTheme.headline6.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
