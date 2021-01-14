import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';

class InputScrambleDialog extends StatelessWidget {
  final ScrambleGenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Text(_controller.currentScramble),
      ),
    );
  }
}
