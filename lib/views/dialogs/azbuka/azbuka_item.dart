import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/dialogs/azbuka/azbuka_dialog_controller.dart';
import 'package:rg2/database/entitys/basic_move.dart';

class AzbukaItem extends StatelessWidget {
  final BasicMove item;
  final _controller = Get.find<AzbukaDialogController>();

  AzbukaItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        child: Container(
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(item.move, style: Get.textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  // SvgPicture.asset(
                  //   _controller.getAssetAzbukaFilePathSvg(item.icon, item.eType),
                  //   height: 70,
                  // ),
                  Image.asset(
                    _controller.getAssetAzbukaFilePathPng(item.icon, item.eType),
                    height: 70,
                  )
                ),
              ]
            ),
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
                snackStyle: SnackStyle.FLOATING,
                titleText: Center(child: Text("Подсказка:")),
                duration: Duration(seconds: 5)
            );
          }
        },
      ),
    );
  }
}
