import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class SavedResultDialogListItem extends StatelessWidget {
  final TimeNoteItem _item;

  SavedResultDialogListItem({TimeNoteItem item, Key key,}) : _item = item, super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_item.dateTime);
    var _backgroundColor = Get.theme.backgroundColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
      child: Material(
        color: _backgroundColor,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.black54,
        child: Container(
          //width: Get.width - 100,
          // color: Colors.red,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("${_item.solvingTime}", style: Get.textTheme.headline4,),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Text("$formattedDate")
              ),
          ],),
        ),
      ),
    );
  }
}
