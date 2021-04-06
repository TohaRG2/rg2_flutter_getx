import 'package:get/get.dart';
import 'package:rg2/models/trainer_menu_item.dart';
import 'package:rg2/res/trainersMenu/azbuka_trainer.dart';
import 'package:rg2/res/trainersMenu/pll_trainer.dart';
import 'package:rg2/res/trainersMenu/scramble_generator.dart';
import 'package:rg2/res/trainersMenu/timer.dart';

class TrainersController extends GetxController {

  RxList<TrainerMenuItem> _trainerItems = [
    scrambleGen,
    timer,
    pllTrainer,
    azbukaTrainer,
  ].obs;

  get trainerItems => _trainerItems;

}