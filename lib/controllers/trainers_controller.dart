import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/trainersMenu/azbuka_trainer.dart';
import 'package:rg2_flutter_getx/res/trainersMenu/pll_trainer.dart';
import 'package:rg2_flutter_getx/res/trainersMenu/scramble_generator.dart';
import 'package:rg2_flutter_getx/res/trainersMenu/timer.dart';

class TrainersController extends GetxController {

  RxList<TrainerMenuItem> _trainerItems = [
    scrambleGen,
    timer,
    pllTrainer,
    azbukaTrainer,
  ].obs;

  get trainerItems => _trainerItems;

}