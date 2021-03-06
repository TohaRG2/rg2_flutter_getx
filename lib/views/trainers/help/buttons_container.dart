import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/scramble_gen/view/settings_scramble_gen_view.dart';

//TODO Проверить, нужен ли этот класс? Удалить?
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
              logPrint("back_pressed");
              Get.back();
            },
          ),
          Container(
            width: size.width * 0.50,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: iconColor,
            ),
            splashColor: Colors.white,
            onPressed: () {
              Get.to(() => ScrambleGenSettingsView(), transition: Transition.rightToLeft);
            },
          )
          //SettingsButton(),
        ],
      ),
    );
  }
}