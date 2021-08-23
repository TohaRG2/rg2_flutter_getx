import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/dialogs/azbuka/azbuka_dialog_controller.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/views/learn/main_menu/main_menu_item.dart';
import 'package:rg2/views/shared/menu_card_item.dart';

class AzbukaItem extends StatelessWidget {
  final BasicMove item;
  final _controller = Get.find<AzbukaDialogController>();

  AzbukaItem(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MenuCardItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(item.move, style: Get.textTheme.headline4.copyWith(
              fontWeight: FontWeight.bold,
            )),
            SizedBox(width: 10,),
            Image.asset(
              _controller.getAssetAzbukaFilePathPng(item.icon, item.eType),
              height: 65,
            ),
          ]
        ),
      ),
      onTap: () {
        if (Get.isSnackbarOpen) {
          Get.back();
        } else {
          Get.snackbar("", "",
              messageText: Center(child: Text(item.toast)),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black54,
              colorText: Colors.white,
              snackStyle: SnackStyle.FLOATING,
              titleText: Center(child: Text("Подсказка:")),
              duration: Duration(seconds: 5)
          );
        }
      },
    );
  }
}
