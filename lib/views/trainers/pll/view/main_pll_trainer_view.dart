import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/bottom_menu_bar_pll_trainer.dart';

class MainPllTrainerView extends StatelessWidget {
  final PllTrainerController _controller = Get.put(PllTrainerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text("PLL Trainer",
        style: TextStyle(
        color: Theme.of(context).textTheme.headline5.color)),
        )
      ),
      body: Center(child: Text("PLL Trainer")),
      bottomNavigationBar: PllTrainerBottomMenuBar(),
    );
  }
}
