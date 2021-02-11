import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class SavedResultDialogListItem extends StatelessWidget {
  final TimeNoteItem _item;

  SavedResultDialogListItem({TimeNoteItem item, Key key,}) : _item = item, super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(_item.dateTime);
    var _backgroundColor = Get.theme.backgroundColor;
    return Slidable(
      actionPane: const SlidableBehindActionPane(),

      child: Container(
        margin: const EdgeInsets.all(UIHelper.SpaceSmall),
        child: Card(
          elevation: 8.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: UIHelper.SpaceSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$formattedDate", style: Get.textTheme.subtitle1,),
                      Text("${_item.solvingTime}", style: Get.textTheme.headline5.copyWith(color: Get.theme.accentColor),),
                  ],),
                ),
                Visibility(
                  visible: _item.scramble != "",
                  child: Row(
                    children: [
                      Text("Скрамбл: ", style: Get.textTheme.subtitle2),
                      Text("${_item.scramble}", style: Get.textTheme.subtitle2,),
                    ],
                  )),
                Visibility(
                  visible: _item.comment != "",
                  child: Row(
                    children: [
                      Text("Коммент: ", style: Get.textTheme.subtitle2),
                      Text("${_item.comment}", style: Get.textTheme.subtitle2,),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
