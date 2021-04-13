import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/in_app_purchase_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/get_money_view_item.dart';
import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class GetMoneyDialog extends GetWidget<InAppPurchaseController> {
  @override
  Widget build(BuildContext context) {
    return _showDialog2(context);
  }

  Widget _showDialog2(BuildContext context) {
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
            margin: EdgeInsets.all(10),
            child: Scaffold(
              appBar: _appBar(),
              body: SingleChildScrollView(
                child: Obx(() =>
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      controller.onTapExpansion(index, isExpanded);
                    },
                    animationDuration: Duration(milliseconds: 600),
                    children: controller.listItems.map((item) =>
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.title),
                          );
                        },
                        body: ListTile(
                          title: Text(item.help, ),
                          trailing: Icon(Icons.arrow_right_rounded),
                          onTap: () {
                            logPrint("_showDialog2 - tapOn $item");
                          },
                        ),
                        isExpanded: item.isExpanded
                      )
                    ).toList(),
                  ),
                ),
              ),
              bottomNavigationBar: _bottomBar(_primaryColor),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
              child: Obx(
                () => Text(
                  "У вас ${controller.getCoins()} монеток",
                  style: Get.textTheme.headline5.copyWith(fontSize: 18),
                  softWrap: true,
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/images/icons/coins.png",
            width: 50,
          ),
        ],
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }

  Widget _bottomBar(Color _primaryColor) {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(_primaryColor),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StrRes.backButtonText),
            Text(
              "isStoreAvailable - ${controller.isAvailable}",
              style: Get.textTheme.headline6.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
