import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_controller.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/view/main_azbuka_trainer_view.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/view/settings_azbuka_trainer_view.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/main_pll_trainer_view.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/settings_pll_trainer_view.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/view/main_scramble_gen_view.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/main_timer_view.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/settings_timer_view.dart';
import 'package:rg2_flutter_getx/views/trainers/trainers_view/trainer_view_menu_item.dart';

import '../help/help_view.dart';
import '../scramble_gen/view/settings_scramble_gen_view.dart';

class TrainersScreen extends StatelessWidget {
  final TrainersController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(StrRes.trainersTitle,
                style: TextStyle(
                    color: Get.textTheme.headline5.color)),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Obx(() {
          List<TrainerMenuItem> items = _controller.trainerItems;
          return ListView(
            children: items
                .map((listItem) => TrainerViewMenuItem(
                      item: listItem,
                      onItemSelected: _onItemSelected,
                      onHelpSelected: _onHelpSelected,
                      onSettingsSelected: _onSettingsSelected,
                    ))
                .toList(),
          );
        }));
  }

  _onItemSelected (TrainerMenuItem item) {
    switch(item.id) {
      case StrRes.trainersScrambleGen:
        print("Start Scramble Generator");
        Get.to(() => ScrambleGenView(title: item.title), transition: Transition.fadeIn);
        break;
      case StrRes.trainersTimer:
        print("Start Timer");
        Get.to(() => TimerView(), transition: Transition.fadeIn);
        break;
      case StrRes.trainersPll:
        print("Start PLL trainer");
        Get.to(() => MainPllTrainerView(), transition: Transition.fadeIn);
        break;
      case StrRes.trainersAzbuka:
        print("Start AZBUKA trainer");
        Get.to(() => MainAzbukaTrainerView(), transition: Transition.fadeIn);
        break;
      default:
        print("Warning!!! Pressed on ${item.title}");
    }
  }

  _onHelpSelected (TrainerMenuItem item) {
    //print("Pressed on ${item.title} - help");
    Get.to(() => HelpView(item: item), transition: Transition.fadeIn);
  }

  _onSettingsSelected (TrainerMenuItem item) {
    switch(item.id) {
      case StrRes.trainersScrambleGen:
        Get.to(() => ScrambleGenSettingsView(), transition: Transition.rightToLeft);
        break;
      case StrRes.trainersTimer:
        Get.to(() => SettingsTimerView(), transition: Transition.rightToLeft);
        break;
      case StrRes.trainersPll:
        Get.to(() => SettingsPllTrainerView(), transition: Transition.rightToLeft);
        break;
      case StrRes.trainersAzbuka:
        Get.to(() => SettingsAzbukaTrainerView(), transition: Transition.rightToLeft);
        break;
      default:
        print("Warning!!! Pressed on settings on ${item.title}");
    }
  }

}
