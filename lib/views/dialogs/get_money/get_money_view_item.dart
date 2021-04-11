import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/in_app_purchase_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class GetMoneyViewItem extends GetWidget<InAppPurchaseController> {
  const GetMoneyViewItem({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceMini, vertical: UIHelper.SpaceMini),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.black54,
        child: Row(
          children: [
            /// Примерная стоимость покупки
            // Container(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Text(controller.listItems[index].price,
            //     style: Get.textTheme.headline5,
            //   )
            // ),
            /// Основной текст
            GestureDetector(
              child: Expanded(child:
                Container(
                  padding: const EdgeInsets.symmetric(vertical: UIHelper.SpaceSmall),
                  child: Text(controller.listItems[index].title, softWrap: true,
                    style: Get.textTheme.headline5.copyWith(fontSize: 18),
                  )
                )
              ),
              onTap: (){

              },
            ),
            /// Иконка хелпа
            IconButton(icon: Icon(Icons.help_outline),
              onPressed: () {
                if (Get.isSnackbarOpen) {
                  Get.back();
                }
                Get.snackbar(
                  controller.listItems[index].help,
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.grey[800],
                  duration: Duration(seconds: 10),
                  onTap: (_) {
                    Get.back();
                  },
                );
              }
            ),
            // Container(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Text("?", style: Get.textTheme.headline5,)
            // ),
          ],
        ),
      ),
    );
  }
}
