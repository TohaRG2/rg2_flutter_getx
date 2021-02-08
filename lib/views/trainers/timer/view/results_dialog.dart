import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class TimerResultsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var backgroundColor = Get.theme.scaffoldBackgroundColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            StrRes.timerResultTitle,
            style: TextStyle(color: Theme.of(context).textTheme.headline5.color),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        
      ),

      bottomNavigationBar: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceMedium),
            child: FlatButton(
              color: Get.theme.primaryColor,
              child: Text("Назад"),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
