import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/iap/iap_controller.dart';
import 'package:rg2/controllers/iap/model/store_state.dart';
import 'package:rg2/views/purchase/remove_ads_widget.dart';
import 'package:rg2/views/purchase/open_all_puzzles_widget.dart';
import 'package:rg2/views/shared/preloader.dart';
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
      switch (iapController.storeState) {
        case StoreState.loading:
          return Preloader();
        case StoreState.available:
          return _selectItemsToPurchase();
        case StoreState.notAvailable:
          return _marketLoadOrNotAvailable();
      }
      return _marketLoadOrNotAvailable();
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
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Доступные покупки",
                textAlign: TextAlign.center,
                style: Get.textTheme.headline5.copyWith(color: Get.theme.primaryColor),
              ),
              SizedBox(height: UIHelper.SpaceMedium,),
              OpenAllPuzzles(),
              SizedBox(height: UIHelper.SpaceSmall,),
              RemoveAds(),
            ],
          )
        ),
        _reloadButton(),
      ],
    );
  }

  _reloadButton() {
    return Positioned(
      bottom: UIHelper.SpaceMedium,
      right: UIHelper.SpaceMedium,
      left: UIHelper.SpaceMedium,
      child: ElevatedButton(
        onPressed: () {
          iapController.restorePurchases();
        },
        child: Text("Восстановить покупки"),
      ),
    );
  }

}
