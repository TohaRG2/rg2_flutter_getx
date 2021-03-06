import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';

import 'edit_button.dart';
import 'favourite_button.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    Key key,
    @required this.width,
    @required this.iconColor,
  }) : super(key: key);

  final double width;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: iconColor,
            ),
            splashColor: Colors.white,
            onPressed: () {
              logPrint("back_pressed");
              Get.back();
            },
          ),
          IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: iconColor,
              ),
              onPressed: () {
                logPrint("Shared pressed");
                Scaffold.of(context).openDrawer();
              }),
          Container(
            width: width * 0.20,
          ),
          EditButton(),
          FavouriteButton(),
        ],
      ),
    );
  }
}