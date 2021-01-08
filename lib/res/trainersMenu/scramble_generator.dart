import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';

final scrambleGen = TrainerMenuItem(
    title: scramble_gen_title,
    icon: scramble_gen_icon,
    helpItem: scramble_gen_help
);

const scramble_gen_title = "Генератор скрамблов";
const scramble_gen_icon = "scramble_gen";
const scramble_gen_help = """
  <p><b>Генератор скрамблов</b> поможет вам придумать скрамбл для разборки кубика. В основном
  окне генератора вы можете задать некоторые параметры:</p>

  <p><b>Длина скрамбла</b> - это основной параметр скрамбла. Теоретически, чтобы кубик был как следует запутан, она
  должна быть больше 20 ходов, но на мой взгляд для практики сборки кубика методом для начинающих, CFOP или ROUX,
  вполне достаточно всего лишь 12-15 ходов.</p>

  <p>Также есть еще несколько параметров, которые пригодятся вам, если вы тренируете сборку кубика вслепую (блайнды).</p>

  <p><b>Без переплавки буфера ребер</b> и <b>Без переплавки буфера углов</b> - как уже было сказано
   в видео Максима, многие из тех, кто начинает изучать сборку кубика вслепую, бросают
   блайнды из-за \"переплавки\" буфера. Ведь когда начинаете их учить, вы еще и азбуку
   только учите, и слова под комбинации букв не наработаны, из-за чего каждая пара букв вызывает
   затруднения, да тут еще и эта переплавка с поиском пустой корзины. Тяжело.</p>

   <p>Поэтому вы можете просто создать скрамблы, для решения которых не нужна переплавка буфера (наподобие
   скрамбла из 14 части блайндов), а соответственно на которых проще тренировать азбуку и слепую сборку в целом.</p>

  <p>Ну и последний параметр который можно задать прямо в генераторе - <b>Решение</b>. Если
  данная галочка установлена, то программа покажет решение в виде сочетаний букв из Азбуки,
  которую также можно задать через настройки генератора, но об этом чуть ниже. А если же галочка
  не установлена, то покажет длину (количество букв) в решении. Тем самым вы сможете подобрать
  соответствующий по сложности скрамбл не видя его решения.
  </p>

  <p>Теперь несколько слов об Азбуке блайндов. У азбуки используемой Максимом, на мой взгляд, есть один недостаток, -
  в ней используются некоторые буквы, с которыми трудно придумывать слова. Например, могут быть такие сочетания как ЖЯ или ЮХ.
  Поэтому я использую для блайндов свою азбуку с более \"популярными буквами\", к тому же в ней
  букву \"Э\" можно использовать для запоминания экватора.</p>

  <p>Зайдя в настройки через \"Стороны/Азбука\" или нажав на шестеренку в меню выбора тренажера,
  вы можете выбрать начальное положение кубика, т.е. то, как изначально располагаются его стороны,
  а нажав на любую букву поменять ее. Также можете выбрать одну из двух предустановленных азбук
  (мою или Максима) или придумать/сохранить/настроить свою.</p>

  <p>Например, если вы запоминаете кубик для положения желтый цвет сверху, то сдвиньте при
  помощи стрелочек цвета так, чтобы буквы АБВГ у вас оказались на желтой стороне. Надеюсь, что интерфейс
  настройки азбуки у вас не вызовет затруднений. Заметьте, что заданная тут азбука будет использована
  не только в генераторе скрамблов, но и в игре \"Тренировка азбуки\" и ее настройках.</p>
""";