import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/result_view_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/result_view/saved_result_list_item.dart';

class SavedResultListView extends StatelessWidget {
  final _controller = Get.find<ResultViewController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var items = _controller.timeNoteItems;
      return Container(
        child: ListView(
          children: items.map((item) =>
            SavedResultListItem(item: item),
          ).toList(),
      ));
    });
  }
}
