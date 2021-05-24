import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/iap/iap_controller.dart';
import 'package:rg2/controllers/iap/model/store_state.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/purchase/purchase_ads_widget.dart';
import 'package:rg2/views/purchase/purchase_puzzles_widget.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/help/bottom_bar_with_back_button.dart';

class PurchaseView extends StatelessWidget {
  final IAPController iapController = Get.put(IAPController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: BottomBarWithBackButton(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text("Покупки",
          style: Get.textTheme.headline5.copyWith(fontSize: 18),
          softWrap: true,
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }

  Widget _body() {
    return Obx(() {
      return (iapController.storeState == StoreState.available)
          ? _selectItemsToPurchase()
          : _marketLoadOrNotAvailable();
    });
  }

  Widget _marketLoadOrNotAvailable() {
    return Center(
      child: Text(iapController.storeStateText,
        textAlign: TextAlign.center,
        style: Get.textTheme.headline5.copyWith(color: Get.theme.primaryColor),
      ),
    );
  }

  Widget _selectItemsToPurchase() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Доступные покупки",
            textAlign: TextAlign.center,
            style: Get.textTheme.headline5.copyWith(color: Get.theme.primaryColor),
          ),
          SizedBox(height: UIHelper.SpaceMedium,),
          PurchasePuzzles(),
          SizedBox(height: UIHelper.SpaceSmall,),
          PurchaseAds(),
        ],
      )
    );
  }

}
