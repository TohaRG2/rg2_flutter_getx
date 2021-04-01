import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/timer/controller/result_view_controller.dart';

class SavedResultListItem extends StatelessWidget {
  final ResultViewController _controller = Get.find();
  final TimeNoteItem _item;

  SavedResultListItem({TimeNoteItem item, Key key,}) : _item = item, super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(_item.dateTime);
    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      actions: actions(),
      secondaryActions: actions(),
      child: Container(
        margin: const EdgeInsets.all(UIHelper.SpaceMini),
        child: GestureDetector(
          child: Card(
            elevation: 8.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: UIHelper.SpaceMini),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$formattedDate", style: Get.textTheme.subtitle1,),
                        Text("${_item.solvingTime}", style: Get.textTheme.headline5.copyWith(color: Get.theme.accentColor),),
                    ],),
                  ),
                  Visibility(
                    visible: _item.scramble != "",
                    child: Container(
                      padding: const EdgeInsets.only(bottom: UIHelper.SpaceMini),
                      child: Row(
                        children: [
                          Text(StrRes.timerResultItemScramble, style: Get.textTheme.subtitle2),
                          Expanded(
                            child: Text(
                              "${_item.scramble}",
                              style: Get.textTheme.subtitle2,
                              softWrap: true,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            )
                          ),
                        ],
                      ),
                    )),
                  Visibility(
                    visible: _item.comment != "",
                    child: Container(
                      padding: const EdgeInsets.only(bottom: UIHelper.SpaceMini),
                      child: Row(
                        children: [
                          Text(StrRes.timerResultItemComment, style: Get.textTheme.subtitle2),
                          Expanded(
                            child: Text(
                              "${_item.comment}",
                              style: Get.textTheme.subtitle2.copyWith(color: Get.theme.primaryColor),
                              softWrap: true,
                              textAlign: TextAlign.left,
                              maxLines: 3,
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            //print("Нажали на элемент $_item");
            showEditCommentDialog();
          },
        ),
      ),
    );
  }

  showEditCommentDialog() {
    var _textController = TextEditingController();
    _textController.text = _item.comment;
    return Get.defaultDialog(
      title: StrRes.timerResultEditItemTitle,
      content: Container(
        child: Padding(
          padding: const EdgeInsets.all(UIHelper.SpaceMedium),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: StrRes.timerEditResultHint,
                ),
                maxLines: 2,
                controller: _textController,
              ),
            ],
          ),
        ),
      ),
      buttonColor: Get.theme.secondaryHeaderColor,

      /// Кнопка Отмена
      textCancel: StrRes.buttonCancelText,
      cancelTextColor: Get.theme.primaryColor,

      /// Кнопка ОК
      textConfirm: StrRes.buttonOkText,
      confirmTextColor: Get.theme.accentColor,
      onConfirm: () => {
        _controller.updateComment(_item, _textController.text),
        Get.back()
      }
    );
  }

  List<Widget> actions() => [
    SlideAction(
      closeOnTap: true,
      color: Colors.redAccent,
      onTap: () {
        _controller.removeItem(_item);
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            const SizedBox(height: 4),
            Text(
              StrRes.deleteItem,
              style: Get.textTheme.bodyText2.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  ];

}
