import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

final azbukaTrainer = TrainerMenuItem(
    id: R.trainers_azbuka,
    title: azbuka_trainer_title,
    icon: azbuka_trainer_icon,
    helpItem: azbuka_trainer_help
);

const azbuka_trainer_title = "Тренировка азбуки";
const azbuka_trainer_icon = "azbuka_trainer";
const azbuka_trainer_help = """
  <p>Эта игра поможет вам научиться правильно определять буквы (алгоритмы), при осмотре кубика
  перед его сборкой с закрытыми глазами. В настройках можете выбрать какие элементы могут быть
  загаданы. Только ребра, только углы или и то, и другое.</p>

  <p>Так же вы можете ограничить время на ответ и выбрать период в секундах, за который
  необходимо ответить.</p>

  <p>Ну и конечно, можно выбрать азбуку, которая будет использована при загадывании алгоритма.
  Как и в настройках генератора скрамблов, вы можете выбрать одну из двух предустановленных азбук
  или задать свою.<p>
""";