import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

class BottomBarWithBackButton extends StatelessWidget {
  const BottomBarWithBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return BottomAppBar(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, color: backgroundColor,),
                Text(R.backButtonText,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: backgroundColor, fontSize: 14),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Get.back();
        },
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}