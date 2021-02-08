import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/view/input_scramble_dialog.dart';

class ShowScrambleText extends StatelessWidget {
  final String scramble;
  final ScrambleGenController _controller = Get.find();

  ShowScrambleText({Key key, @required this.scramble}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(StrRes.scrambleGenShowScramble)),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Text( scramble,
              style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      onTap: () {
        _controller.updateInputScrambleText();
        Get.defaultDialog(
            title: StrRes.scrambleGenInputScramble,
            barrierDismissible: false,
            content: InputScrambleDialog(),
            buttonColor: Theme.of(context).secondaryHeaderColor,
            textCancel: StrRes.buttonCancelText,
            cancelTextColor: Theme.of(context).primaryColor,
            textConfirm: StrRes.buttonOkText,
            confirmTextColor: Theme.of(context).accentColor,
            onConfirm: () => {
              _controller.updateCurrentScrambleFromInput(),
              Get.back()
            }
        );
      },
    );
  }
}