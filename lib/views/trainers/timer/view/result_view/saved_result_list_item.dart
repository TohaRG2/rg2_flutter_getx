import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/menu_card_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/timer/controller/result_view_controller.dart';

class SavedResultListItem extends StatelessWidget {
  final ResultViewController _controller = Get.find();
  final TimeNoteItem _item;

  SavedResultListItem({required TimeNoteItem item, Key? key,}) : _item = item, super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(_item.dateTime);
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: slidableActions(),
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: slidableActions(),
      ),
      child: GestureDetector(
        child: MenuCardItem(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: UIHelper.SpaceMini),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$formattedDate", style: Get.textTheme.titleMedium,),
                      Text("${_item.solvingTime}", style: (Get.textTheme.titleMedium ?? const TextStyle()).copyWith(color: Get.theme.colorScheme.primary),),
                  ],),
                ),
                Visibility(
                  visible: _item.scramble != "",
                  child: Container(
                    padding: const EdgeInsets.only(bottom: UIHelper.SpaceMini),
                    child: Row(
                      children: [
                        Text(StrRes.timerResultItemScramble, style: Get.textTheme.titleSmall ?? const TextStyle()),
                        Expanded(
                          child: Text(
                            _item.scramble,
                            style: Get.textTheme.titleSmall ?? const TextStyle(),
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
                        Text(StrRes.timerResultItemComment, style: Get.textTheme.titleSmall ?? const TextStyle()),
                        Expanded(
                          child: Text(
                            _item.comment,
                            style: (Get.textTheme.titleSmall ?? const TextStyle()).copyWith(color: Get.theme.primaryColor),
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
          //logPrint("Нажали на элемент $_item");
          showEditCommentDialog();
        },
      ),
    );
  }

  Future<void> showEditCommentDialog() {
    var textController = TextEditingController();
    textController.text = _item.comment;
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
                controller: textController,
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
      confirmTextColor: Get.theme.colorScheme.primary,
      onConfirm: () => {
        _controller.updateComment(_item, textController.text),
        Get.back()
      }
    );
  }

  List<Widget> slidableActions() => [
    SlidableAction(
      onPressed: (_) {
        _controller.removeItem(_item);
      },
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: StrRes.deleteItem,
    ),
  ];

}
