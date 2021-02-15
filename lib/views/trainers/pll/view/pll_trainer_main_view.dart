import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_trainer_controller.dart';

class PllTrainerMainView extends StatelessWidget {
  final PllTrainerController _controller = Get.put(PllTrainerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("PLL Trainer"),
    );
  }
}
