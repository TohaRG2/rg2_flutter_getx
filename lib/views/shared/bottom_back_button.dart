import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class BottomBackButton extends StatelessWidget {
  const BottomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
