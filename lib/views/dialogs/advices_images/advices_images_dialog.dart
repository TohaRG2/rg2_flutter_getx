import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/buttons_style.dart';

import 'image_slider.dart';

/// диалог с просмотром советов по программе
///

class AdvicesImagesDialog extends StatefulWidget {
  @override
  _AdvicesImagesDialogState createState() => _AdvicesImagesDialogState();
}

class _AdvicesImagesDialogState extends State<AdvicesImagesDialog>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(StrRes.infoAdviceTitle, style: Get.theme.textTheme.headline5),
                  ),
                  Expanded(
                    child: Container(
                      child: ComplicatedImageDemo()
                    )
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: flatButtonStyle,
                        child: Text("Назад"),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      //Text("$_current"),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

}
