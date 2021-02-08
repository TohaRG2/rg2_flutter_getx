import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/controllers/learn_detail_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';

class EditButton extends StatelessWidget {
  final LearnDetailController _controller = Get.find();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).scaffoldBackgroundColor;
    return IconButton(
        icon: Icon(
          Icons.edit_rounded,
          color: iconColor,
        ),
        onPressed: () {
          _textController.text = _controller.getCurrentComment();
          Get.defaultDialog(
              title: R.learnEditComment,
              buttonColor: Get.theme.secondaryHeaderColor,
              content: Container(
                child: Padding(
                  padding: const EdgeInsets.all(UIHelper.SpaceMedium),
                  child: Column(
                    children: [
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: R.learnHintComment,
                        ),
                        maxLines: 3,
                        controller: _textController,
                      ),
                    ],
                  ),
                ),
              ),
              textCancel: R.buttonCancelText,
              cancelTextColor: Get.theme.primaryColor,
              textConfirm: R.buttonOkText,
              confirmTextColor: Get.theme.accentColor,
              onConfirm: () => {
                _controller.setCurrentCommentTo(_textController.text),
                Get.back()
              });
        });
  }
}
