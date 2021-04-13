import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/in_app_purchase_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class GetMoneyDialog extends GetWidget<InAppPurchaseController> {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    return _showDialog2(context);
  }

  Widget _showDialog2(BuildContext context) {
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
              body: _body(),
              bottomNavigationBar: _bottomBar(),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            SizedBox(height: UIHelper.SpaceLarge),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                controller.onTapExpansion(index, isExpanded);
              },
              animationDuration: Duration(milliseconds: 600),
              children: controller.listItems
                  .map((item) => _expansionPanel(item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionPanel _expansionPanel(GetMoneyItem item) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: item.isExpanded,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            item.title,
            style: Get.textTheme.headline5.copyWith(fontSize: 20),
          ),
        );
      },
      body: Container(
        padding: EdgeInsets.only(bottom: UIHelper.SpaceSmall),
        child: ListTile(
          title: Text(
            item.help,
            style: Get.textTheme.bodyText2,
          ),
          trailing: Text(item.price),
          onTap: () {
            controller.onTapBySimpleUser(item);
          },
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

  Widget _bottomBar() {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Get.theme.primaryColor),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StrRes.backButtonText),
            Visibility(
              visible: _settings.godMode,
              child: Text( (controller.isAvailable) ?
                "Магазин доступен" : "Магазин недоступен",
                style: Get.textTheme.headline6.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
