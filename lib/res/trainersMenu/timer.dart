import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

final timer = TrainerMenuItem(
    id: StrRes.trainersTimer,
    title: timer_title,
    icon: timer_icon,
    helpItem: timer_help
);

const timer_title = "Таймер";
const timer_icon = "timer";
const timer_help = """
  <p>Довольно простой классический таймер с возможностью ведения статистики по сборкам. В
  настройках таймера вы можете задать несколько параметров:</p>

  <p><b>Удерживать 0.5 сек для старта</b> - этот параметр определяет нужно ли будет удерживать руки
  0.5 секунды на экране телефона перед тем как таймер сможет начать отсчет. В это время индикаторы
  загораются желтым. Если индикаторы стали зелеными, значит таймер готов, и как только
  вы уберете руки с экрана, начнется отсчет времени.</p>

  <p><b>Управление таймером одной рукой</b> - если этот параметр активен, то достаточно одного
  касания экрана, чтобы запустить или остановить таймер. В этом режиме отображается только
  одна панель для касаний. Если же параметр не активен, то для того, чтобы запустить или
  остановить таймер необходимо одновременное касание обеих панелей таймера.</p>

  <p><b>Цветные кнопки сохранения результатов</b> - параметр определяет то, будут ли кнопки сохранения 
  результатов сборки разноцветными или все будут одного цвета.</p>

  <p><b>Метроном</b> - тут можно задать количество сигналов в минуту для настройки звукового
  сопровождение отсчета таймера.
  Данная настройка может пригодиться как на начальных этапах тренировок, например, чтобы выбрать
  5 или 10 секундный интервал для понимания того, сколько времени вы тратите на каждый из
  этапов, так и на более продвинутом уровне, для тренировки равномерности вращений и развития своего
  LookAhead.
  </p>

  <p><b>Отображать скрамбл</b> - отображение в врхней части таймера случайного скрамбла.
  Скрамбл при этом соответствует параметрам, заданным в генераторе скрамблов и автоматически
  обновляется после каждой успешной сборки, т.е. если вы сохранили результат. Для обновления
  скрамбла вручную, просто нажмите на него.</p>

""";