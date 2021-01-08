import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_controller.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/trainer_view_menu_item.dart';

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
    print("Pressed on ${item.title}");

  }

  _onHelpSelected (TrainerMenuItem item) {
    print("Pressed on ${item.title} - help");
  }

  _onSettingsSelected (TrainerMenuItem item) {
    print("Pressed on ${item.title} - settings");
  }


}
