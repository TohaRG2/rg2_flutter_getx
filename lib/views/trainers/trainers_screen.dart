import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_controller.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/scramble_gen_view.dart';
import 'package:rg2_flutter_getx/views/trainers/trainer_view_menu_item.dart';

import 'help/help_view.dart';

class TrainersScreen extends StatelessWidget {
  final TrainersController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(R.trainersTitle,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline5.color)),
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
      case R.trainers_scramble_gen:
        print("Start Scramble Generator");
        Get.to(ScrambleGenView(title: item.title), transition: Transition.fadeIn);
        break;
      case R.trainers_timer:
        print("Start Timer");
        break;
      case R.trainers_pll:
        print("Start PLL trainer");
        break;
      case R.trainers_azbuka:
        print("Start AZBUKA trainer");
        break;
      default:
        print("Warning!!! Pressed on ${item.title}");
    }
  }

  _onHelpSelected (TrainerMenuItem item) {
    print("Pressed on ${item.title} - help");
    Get.to(HelpView(item: item), transition: Transition.fadeIn);
  }

  _onSettingsSelected (TrainerMenuItem item) {
    switch(item.id) {
      case R.trainers_scramble_gen:
        print("Settings Scramble Generator");
        break;
      case R.trainers_timer:
        print("Settings Timer");
        break;
      case R.trainers_pll:
        print("Settings PLL trainer");
        break;
      case R.trainers_azbuka:
        print("Settings AZBUKA trainer");
        break;
      default:
        print("Warning!!! Pressed on settings on ${item.title}");
    }
  }

}
