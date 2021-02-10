import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/result_dialog_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/result_dialog/saved_result_dialog_list_item.dart';

class SavedResultListForDialog extends StatelessWidget {
  final _controller = Get.find<ResultDialogController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var items = _controller.timeNoteItems;
      print("Отображаем список из ${items.length} записей");
      return Container(
        child: ListView(
          children: items.map((item) =>
            SavedResultDialogListItem(item: item),
          ).toList(),
      ));
    });
  }
}
