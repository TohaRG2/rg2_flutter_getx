import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/input_scramble_dialog.dart';

class ShowScrambleText extends StatelessWidget {
  final String scramble;

  ShowScrambleText({Key key, @required this.scramble}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(R.scramble_gen_show_scramble)),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Text(
              scramble,
              style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Get.defaultDialog(
                  title: R.scramble_gen_input_scramble,
                  content: InputScrambleDialog()
                  //TODO Добавить кнопки Отмена/ОК
              );
            },
          ),
        ),
      ],
    );
  }
}