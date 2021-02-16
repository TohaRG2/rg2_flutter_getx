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
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("PLL Trainer",
            style: TextStyle(
            color: Get.textTheme.headline5.color)),
        )
      ),

      body: Obx(() {
        return _controller.showBottomBar ? buildStartScreen() : buildGameScreen();
      }),

      bottomNavigationBar: PllTrainerBottomMenuBar(),
    );
  }


  Widget buildStartScreen() {
    return Center(
      child: RaisedButton.icon(
        onPressed: () {

        },
        icon: null,
        label: Text("Начать")
      )
    );
  }

  Widget buildGameScreen() {
    return Container(color: Colors.red, width: 100, height: 100,);
  }
}
