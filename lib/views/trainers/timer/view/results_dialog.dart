import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/result_dialog_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/saved_result_list_for_dialog.dart';

class TimerResultsDialog extends StatelessWidget {
  final ResultDialogController _controller = Get.find();

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
          child: (_controller.timeNoteItems.length == 0)
              ? Center(
              child: Text(
                StrRes.timerResultNothing,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.headline5,
              ))
              : SavedResultListForDialog()
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
