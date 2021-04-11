import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/in_app_purchase_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/get_money_view_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class GetMoneyDialog extends GetWidget<InAppPurchaseController> {

  @override
  Widget build(BuildContext context) {
    return _showDialog(context);
  }

  Widget _showDialog(BuildContext context) {
    var _primaryColor = Get.theme.primaryColor;
    return SafeArea(
      child: Center(
        child: Container(
          width: context.mediaQuerySize.width - 50,
          height: context.mediaQuerySize.height - 50,
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(UIHelper.SpaceSmall),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
                        child: Text("У вас 100 монеток",
                          style: Get.textTheme.headline5.copyWith(fontSize: 18),
                          softWrap: true,
                        ),
                      ),
                    ),
                    Image.asset("assets/images/icons/coins.png", width: 80,),
                  ],
                ),
                //Spacer(),
                Expanded(
                  child: Material(
                    child: ListView.builder(
                      itemCount: controller.listItems.length,
                      itemBuilder: (_, index) {
                        return GetMoneyViewItem(index: index);
                      },
                    ),
                  ),
                ),
                Text("isAvailable ${controller.isAvailable}",
                    style: Get.textTheme.headline4.copyWith(fontSize: 20.0, color: Get.textTheme.headline5.color),),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(_primaryColor),
                          ),
                          child: Text(StrRes.backButtonText)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
  );
  }
}
