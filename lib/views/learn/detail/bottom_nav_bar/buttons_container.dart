import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_button.dart';
import 'favourite_button.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    Key key,
    @required this.size,
    @required this.iconColor,
  }) : super(key: key);

  final Size size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
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
              print("back_pressed");
              Get.back();
            },
          ),
          IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: iconColor,
              ),
              onPressed: () {
                print("Shared pressed");
                Scaffold.of(context).openDrawer();
              }),
          Container(
            width: size.width * 0.20,
          ),
          EditButton(),
          FavouriteButton(),
        ],
      ),
    );
  }
}