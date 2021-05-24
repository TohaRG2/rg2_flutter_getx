import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/ads/ad_state_controller.dart';
import 'package:rg2/controllers/iap/in_app_purchase_controller_old.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/bottom_back_button.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/shared/url_helper.dart';


//TODO Удалить этот диалог, т.к. больше не нужен
class GetMoneyDialog extends StatelessWidget { //GetWidget<InAppPurchaseController> {
  final SettingsController _settings = Get.find();
  final AdStateController _adController = Get.put(AdStateController());

  @override
  Widget build(BuildContext context) {
    return BigDialog(
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: BottomBackButton(),
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
            Text(StrRes.moneyDialogThanks, style: Get.textTheme.headline5,),
            SizedBox(height: UIHelper.SpaceMedium,),
            Text(StrRes.moneyDialogSubscribeToYoutube),
            SizedBox(height: UIHelper.SpaceSmall,),
            ElevatedButton(
                onPressed: () {
                  UrlHelper.onUrlTap(StrRes.moneyDialogSubscribeUrl);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width, 40)
                ) ,
                child: Text(StrRes.moneyDialogSubscribeButtonText)),
            SizedBox(height: UIHelper.SpaceMedium,),
            Text(StrRes.moneyDialogGratitude),
            SizedBox(height: UIHelper.SpaceSmall,),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(Get.width, 40)
              ) ,
              child: Text(StrRes.moneyDialogShowAdsButtonText))
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
                child: Text(
                    StrRes.moneyDialogRemainCoinsText1 +
                    "${_settings.coinsToEnableAllPuzzle - _settings.coins} " +
                    StrRes.moneyDialogRemainCoinsText2
                )),
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(StrRes.moneyDialogTemporaryUnavailable,
            textAlign: TextAlign.center,
            style: Get.textTheme.headline5.copyWith(color: Get.theme.primaryColor),
          ),
          SizedBox(height: UIHelper.SpaceMedium,),
          Text(StrRes.moneyDialogTemporaryUnavailable2, textAlign: TextAlign.center,),
          TextButton(
            child: Text("Показать рекламу"),
            onPressed: () {
              // _adController.showInterstitialAd();
            },
          ),
        ],
      ),
    );
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
            child: //Obx( () =>
                Text(
                // "У вас ${controller.getCoins()} монеток",
                "У вас 100 монеток",
                style: Get.textTheme.headline5.copyWith(fontSize: 18),
                softWrap: true,
              ),
            //),
          ),
        ),
        Image.asset(
          StrRes.moneyDialogPathToCoinsImage,
          width: 50,
        ),
      ],
    );
  }
}
