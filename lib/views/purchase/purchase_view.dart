import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/iap/iap_controller.dart';
import 'package:rg2/views/purchase/open_all_puzzles_widget.dart';
import 'package:rg2/views/purchase/remove_ads_widget.dart';
import 'package:rg2/views/shared/bottom_bar_with_back_button.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

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
        child: Text(
          'Покупки',
          style: Get.textTheme.headline5.copyWith(fontSize: 18),
          softWrap: true,
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }

  Widget _body() {
    // return Obx(() {
    //   switch (iapController.storeState) {
    //     case StoreState.loading:
    //       return Preloader();
    //     case StoreState.available:
    //       return _selectItemsToPurchase();
    //     case StoreState.notAvailable:
    //       return _marketLoadOrNotAvailable();
    //   }
    //   return _marketLoadOrNotAvailable();
    // });
    return _enableAllPurchase();
  }

  Widget _marketLoadOrNotAvailable() {
    return Center(
      child: Text(
        iapController.storeStateText,
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
        _reloadButton(),
        Spacer(),
        Text(
          'Доступные покупки',
          textAlign: TextAlign.center,
          style:
              Get.textTheme.headline5.copyWith(color: Get.theme.primaryColor),
        ),
        SizedBox(
          height: UIHelper.SpaceMedium,
        ),
        OpenAllPuzzles(),
        SizedBox(
          height: UIHelper.SpaceSmall,
        ),
        RemoveAds(),
        Spacer(),
      ],
    ));
  }

  Widget _enableAllPurchase() {
    return Center(
      child: Padding(
        padding: UIHelper.horizontalSymmetricSmallPadding,
        child: Text(
          'Огромное спасибо всем, кто уже поддержал проект материально. Ваша помощь, письма, отзывы и поддержка за все эти годы для меня очень много значат.\n\n'
          'К сожалению, в связи с введенными санкциями, на территории РФ, внутриигровые покупки, а значит и официальная поддержка автора приложения невозможны.'
          ' Поэтому, в данной ситуации, я принял решение, что в этой версии приложения не будет рекламы и '
          'все головоломки будут разблокированы.\n\n'
          'Ещe раз спасибо всем, кто поддержал приложение.',
          style: TextStyle(fontSize: 19),
        ),
      ),
    );
  }

  _reloadButton() {
    return Container(
      padding: EdgeInsets.all(UIHelper.SpaceMedium),
      child: ElevatedButton(
        onPressed: () {
          iapController.restorePurchases();
        },
        child: Text('Восстановить покупки'),
      ),
    );
  }
}
