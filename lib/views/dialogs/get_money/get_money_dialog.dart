import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/in_app_purchase_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/shared/url_helper.dart';

class GetMoneyDialog extends GetWidget<InAppPurchaseController> {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    return _showDialog(context);
  }

  Widget _showDialog(BuildContext context) {
    return SafeArea(
      child: Center(
        // Чтобы Scaffold не спрямил закругленные углы, засовываем его в контейнер с полями (margin)
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

  /// В зависимости от статуса покупок выводим  "Спасибо за покупку", "варианты покупок" или магазин временно недоступен
  Widget _body() {
    Widget body1 = _showOnlyAdVariant();
    Widget body2 = _showVariants();
    Widget storeDisabled = _storeDisabled();
    Widget storeEnabled = (_settings.isAdDisabled && _settings.isAllPuzzlesEnabled) ? body1 : body2;
    // return (controller.isAvailable) ? storeEnabled : storeDisabled;
    return (false) ? storeEnabled : storeDisabled;
  }

  /// "Сасибо за покупку" - Предлагаем подписаться на канал и посмотреть доп.рекламу
  Widget _showOnlyAdVariant() {
    return  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Спасибо, за покупку приложения!", style: Get.textTheme.headline5,),
            SizedBox(height: UIHelper.SpaceMedium,),
            Text("Надеюсь, что вы уже подписались на мой YouTube канал. А если, еще этого не сделали, то можете это сделать прямо сейчас."),
            SizedBox(height: UIHelper.SpaceSmall,),
            ElevatedButton(
                onPressed: () {
                  UrlHelper.onUrlTap("https://www.youtube.com/channel/UCpSUF7w376aCRRvzkoNoAfQ");
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width, 40)
                ) ,
                child: Text("Подписаться на канал")),
            SizedBox(height: UIHelper.SpaceMedium,),
            Text("Буду очень признателен, если вы продолжите поддерживать приложение, периодически просматривая рекламные ролики."),
            SizedBox(height: UIHelper.SpaceSmall,),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(Get.width, 40)
              ) ,
              child: Text("Посмотреть ролики"))
          ],
        )
    );
  }

  /// Предлагаем варианты покупок приложения
  Widget _showVariants() {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            Visibility(
                visible: (_settings.isAdDisabled && !_settings.isAllPuzzlesEnabled),
                child: Text("Чтобы открыть все головоломки, осталось получить ${_settings.coinsToEnableAllPuzzle - _settings.coins} бесплатных монеток")),
            SizedBox(height: UIHelper.SpaceLarge),
            // ExpansionPanelList(
            //   expansionCallback: (int index, bool isExpanded) {
            //     controller.onTapExpansion(index, isExpanded);
            //   },
            //   animationDuration: Duration(milliseconds: 600),
            //   children: controller.listItems
            //       .map((item) => _expansionPanel(item))
            //       .toList(),
            // ),
          ],
        ),
      ),
    );
  }

  /// Раскрывающаяся панель с вариантами покупок
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
            // controller.onTapBySimpleUser(item);
          },
        ),
      ),
    );
  }

  /// Сообщение о временной недоступности магазина покупок
  Widget _storeDisabled() {
    return Text("Магазин временно недоступен");
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: _currentCoinsRow(),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }

  Row _currentCoinsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
            child: Obx(
              () => Text(
                // "У вас ${controller.getCoins()} монеток",
                "У вас 100 монеток",
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
              child: Text( true ? //(controller.isAvailable) ?
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
