import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/models/advice_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/info/advice/advices.dart';

import 'image_slider.dart';

/// диалог с просмотром советов по программе
///

class AdvicesImagesDialog extends StatefulWidget {
  @override
  _AdvicesImagesDialogState createState() => _AdvicesImagesDialogState();
}

class _AdvicesImagesDialogState extends State<AdvicesImagesDialog>
    with SingleTickerProviderStateMixin {
  static List<AdviceItem> _adviceList = Advices.advicesList;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return SafeArea(
      child: Center(
        child: Container(
            width: context.mediaQuerySize.width - 50,
            height: context.mediaQuerySize.height - 50,
            decoration: BoxDecoration(
              color: _theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(R.infoAdviceTitle, style: _theme.textTheme.headline5),
                  ),
                  Expanded(
                    child: Container(
                      child: ComplicatedImageDemo()
                    )
                  ),
                  Row(
                    children: [
                      FlatButton(
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
