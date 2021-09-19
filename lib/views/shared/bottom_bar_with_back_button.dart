import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class BottomBarWithBackButton extends StatelessWidget {
  const BottomBarWithBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.centerLeft,
      height: 50,
      child: InkWell(
        child: Container(
          padding: UIHelper.horizontalSymmetricMediumPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                color: backgroundColor,
              ),
              Text(
                StrRes.backButtonText,
                style: const TextStyle()
                    .copyWith(fontSize: 14, color: backgroundColor),
              ),
            ],
          ),
        ),
        onTap: () {
          Get.back<void>();
        },
      ),
    );
  }
}