import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class PurchaseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BigDialog(
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: _bottomBar(),
      ),
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
    return Center(
      child: Text(StrRes.moneyDialogTemporaryUnavailable,
        textAlign: TextAlign.center,
        style: Get.textTheme.headline5.copyWith(color: Get.theme.primaryColor),
      ),
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
          ],
        ),
      ),
    );
  }

}
