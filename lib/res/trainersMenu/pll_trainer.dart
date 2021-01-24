import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';

import '../string_values.dart';

final pllTrainer = TrainerMenuItem(
    id: R.trainersPll,
    title: pll_trainer_title,
    icon: pll_trainer_icon,
    helpItem: pll_trainer_help
);

const pll_trainer_title = "Тренировка PLL";
const pll_trainer_icon = "pll_trainer";
const pll_trainer_help = """
  <p>Эта игра поможет вам научиться быстрее распознавать PLL ситуации. Для начала надо научиться
  распознавать ситуации по явным признакам, т.е. <b>блокам</b> (нескольким элементам одного цвета стоящим
  рядом) и <b>глазкам</b> (двум уголкам одинакового цвета). Постепенно запоминая, как выглядят
  ситуации с других сторон и стараться определять любую из ситуаций по любым двум сторонам.</p>

  <p>Чтобы этому научиться в игре предусмотрены некоторые настройки:</p>

  <p><b>Случайная сторона</b> - если этот параметр отключен, то ситуации всегда будут показаны
  с тех сторон, с которых их легко определить (есть блоки и/или глазки). А вот если параметр включен,
  то ситуация может быть показана с любой стороны, как в реальной сборке кубика.</p>

  <p><b>Определение ситуации по двум или по трем сторонам</b> - В реальной сборке, вы практически
  всегда видите две стороны и довольно быстро можете посмотреть еще и на третью. Поэтому в игре
  есть режим, когда кубик виден как бы сразу с трех сторон, хотя он при этом выглядит очень странно.
  Более продвинутый вариант по графике вы можете найти в другом моем приложении RG3D PLL.
  Режим определения по 3 сторонам я рекомендую использовать на этапе, когда вы начинаете переходить
  от определения по явным признакам к определению по любым сторонам. А потом уже переходить
  к определению по любым двум сторонам.</p>

  <p>Так же вы можете играть на время или выбрать вариант без ограничения времени на ответ.
  Если выбран вариант игры на время, то можно задать количество секунд, за которое необходимо
  дать ответ.</p>

  <p><b>Варианты ответов</b> - есть два основных режима:</p>

  <p>1. Когда вы видите <b>все 21 вариант</b> ответа, которые находятся всегда в одном и том же месте,
  а значит вы тратите гораздо меньше времени на поиск кнопки с верным вариантом. Но в этом
  случае невозможно написать на кнопках длинные названия алгоритмов, и поэтому возможен
  только вариант с использованием международных названий.</b>

  <p>2. Вариант с <b>ограниченным количеством</b> вариантов (вы можете выбрать количество от 2 до 8).
  В этом случае выводится заданное количество кнопок со случайными названиями алгоритмов, среди
  которых обязательно есть один правильный. В этом случае, по-умолчанию, выводятся названия
  от Максима Чечнева и в скобках международные названия алгоритмов. Но вы также можете задать
  и свои собственные названия для любого алгоритма, нажав на кнопку ниже.</p>

  <p><b>Выбрать/Переименовать алгоритмы</b> - как следует из названия, нажав на эту кнопку,
  вы можете при помощи чекбоксов (галочек), выбрать те алгоритмы, которые могут быть загаданы.
  Но должно быть выбрано минимум три алгоритма, иначе игра просто теряет смысл. Также, щелкнув по названию
  алгоритма, вы можете изменить его на какое-то свое, и это название будет использовано при игре с ограниченным
  количеством вариантов.</p>
""";