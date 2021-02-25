import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

final azbukaTrainer = TrainerMenuItem(
    id: StrRes.trainersAzbuka,
    title: azbukaTrainerTitle,
    icon: azbukaTrainerIcon,
    helpItem: azbukaTrainerHelp
);

const azbukaTrainerTitle = "Тренировка азбуки";
const azbukaTrainerIcon = "azbuka_trainer";
const azbukaTrainerHelp = """
  <p>Этот тренажер поможет вам научиться правильно определять буквы (алгоритмы), при осмотре кубика
  перед его сборкой с закрытыми глазами. В настройках можете выбрать какие элементы могут быть
  загаданы. Только ребра, только углы или и то, и другое.</p>

  <p>Так же вы можете ограничить время на ответ и выбрать период в секундах, за который
  необходимо дать ответ.</p>

  <p>Ну и конечно, можно выбрать азбуку, которая будет использована при загадывании алгоритма.
  Как и в настройках генератора скрамблов, вы можете выбрать одну из двух предустановленных азбук
  или задать свою.<p>
""";