import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';

class InputLetterDialog extends StatelessWidget {
  final ScrambleGenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<bool> _selections = List.generate(3, (index) => false);
    return Obx(
      () {
        return Container(
          child: ToggleButtons(
            children: [
              Icon(Icons.chevron_left_rounded),
              Text(_controller.selectedLetter),
              Icon(Icons.chevron_right_rounded)
            ],
            isSelected: _selections,
            onPressed: (index) {
              if (index == 0) {
                _controller.selectLetterMinus();
              } else if (index == 1) {
                _controller.selectLetterReset();
              } else if (index == 2) {
                _controller.selectLetterPlus();
              }
            },
          ),
        );
      },
    );
  }
}
