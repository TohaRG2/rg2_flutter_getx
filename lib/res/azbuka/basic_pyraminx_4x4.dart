import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/moves.dart';

class BasicPyraminx4x4 implements Moves {
  @override
  int count = basic_pyraminx_4x4_moves.length;

  @override
  String eType = "BASIC_PYRAMINX_4X4";

  @override
  List<String> moves() => basic_pyraminx_4x4_moves;

  @override
  List<String> icons() => basic_pyraminx_4x4_icons;

  @override
  List<String> toasts() => basic_pyraminx_4x4_toasts;

///==================================================

  static const basic_pyraminx_4x4_moves = [
      basic_pyraminx_4x4_st1_move,
      basic_pyraminx_4x4_st2_move,
      basic_pyraminx_4x4_st3_move,
      basic_pyraminx_4x4_st4_move,
      basic_pyraminx_4x4_st5_move,
      basic_pyraminx_4x4_st6_move,
      basic_pyraminx_4x4_st7_move,
      basic_pyraminx_4x4_st8_move,
      basic_pyraminx_4x4_st9_move,
      basic_pyraminx_4x4_st10_move,
      basic_pyraminx_4x4_st11_move,
      basic_pyraminx_4x4_st12_move,
      basic_pyraminx_4x4_st13_move,
      basic_pyraminx_4x4_st14_move,
      basic_pyraminx_4x4_st15_move,
      basic_pyraminx_4x4_st16_move,
      basic_pyraminx_4x4_st17_move,
      basic_pyraminx_4x4_st18_move,
      basic_pyraminx_4x4_st19_move,
      basic_pyraminx_4x4_st20_move,
      basic_pyraminx_4x4_st21_move,
      basic_pyraminx_4x4_st22_move,
  ];

  static const basic_pyraminx_4x4_icons = [
      "basic_pyraminx_4x4_1",
      "basic_pyraminx_4x4_2",
      "basic_pyraminx_4x4_3",
      "basic_pyraminx_4x4_4",
      "basic_pyraminx_4x4_5",
      "basic_pyraminx_4x4_6",
      "basic_pyraminx_4x4_7",
      "basic_pyraminx_4x4_8",
      "basic_pyraminx_4x4_9",
      "basic_pyraminx_4x4_10",
      "basic_pyraminx_4x4_11",
      "basic_pyraminx_4x4_12",
      "basic_pyraminx_4x4_13",
      "basic_pyraminx_4x4_14",
      "basic_pyraminx_4x4_15",
      "basic_pyraminx_4x4_16",
      "basic_pyraminx_4x4_17",
      "basic_pyraminx_4x4_18",
      "basic_pyraminx_4x4_19",
      "basic_pyraminx_4x4_20",
      "basic_pyraminx_4x4_21",
      "basic_pyraminx_4x4_22",
  ];

  static const basic_pyraminx_4x4_toasts = [
      basic_pyraminx_4x4_st1_toast,
      basic_pyraminx_4x4_st2_toast,
      basic_pyraminx_4x4_st3_toast,
      basic_pyraminx_4x4_st4_toast,
      basic_pyraminx_4x4_st5_toast,
      basic_pyraminx_4x4_st6_toast,
      basic_pyraminx_4x4_st7_toast,
      basic_pyraminx_4x4_st8_toast,
      basic_pyraminx_4x4_st9_toast,
      basic_pyraminx_4x4_st10_toast,
      basic_pyraminx_4x4_st11_toast,
      basic_pyraminx_4x4_st12_toast,
      basic_pyraminx_4x4_st13_toast,
      basic_pyraminx_4x4_st14_toast,
      basic_pyraminx_4x4_st15_toast,
      basic_pyraminx_4x4_st16_toast,
      basic_pyraminx_4x4_st17_toast,
      basic_pyraminx_4x4_st18_toast,
      basic_pyraminx_4x4_st19_toast,
      basic_pyraminx_4x4_st20_toast,
      basic_pyraminx_4x4_st21_toast,
      basic_pyraminx_4x4_st22_toast,
  ];

  static const basic_pyraminx_4x4_st1_move = "R";
  static const basic_pyraminx_4x4_st1_toast = "Правая по часовой";
  static const basic_pyraminx_4x4_st2_move = "R\'";
  static const basic_pyraminx_4x4_st2_toast = "Правая против часовой";
  static const basic_pyraminx_4x4_st3_move = "Rw";
  static const basic_pyraminx_4x4_st3_toast = "Правая по часовой жирно";
  static const basic_pyraminx_4x4_st4_move = "Rw\'";
  static const basic_pyraminx_4x4_st4_toast = "Правая против часовой жирно";
  static const basic_pyraminx_4x4_st5_move = "L";
  static const basic_pyraminx_4x4_st5_toast = "Левая по часовой";
  static const basic_pyraminx_4x4_st6_move = "L\'";
  static const basic_pyraminx_4x4_st6_toast = "Левая против часовой";
  static const basic_pyraminx_4x4_st7_move = "Lw";
  static const basic_pyraminx_4x4_st7_toast = "Левая по часовой жирно";
  static const basic_pyraminx_4x4_st8_move = "Lw\'";
  static const basic_pyraminx_4x4_st8_toast = "Левая против часовой жирно";
  static const basic_pyraminx_4x4_st9_move = "U";
  static const basic_pyraminx_4x4_st9_toast = "Крыша по часовой";
  static const basic_pyraminx_4x4_st10_move = "U\'";
  static const basic_pyraminx_4x4_st10_toast = "Крыша против часовой";
  static const basic_pyraminx_4x4_st11_move = "Uw";
  static const basic_pyraminx_4x4_st11_toast = "Крыша по часовой жирно";
  static const basic_pyraminx_4x4_st12_move = "Uw\'";
  static const basic_pyraminx_4x4_st12_toast = "Крыша против часовой жирно";
  static const basic_pyraminx_4x4_st13_move = "r";
  static const basic_pyraminx_4x4_st13_toast = "Правый угол по часовой";
  static const basic_pyraminx_4x4_st14_move = "r\'";
  static const basic_pyraminx_4x4_st14_toast = "Правый угол против часовой";
  static const basic_pyraminx_4x4_st15_move = "l";
  static const basic_pyraminx_4x4_st15_toast = "Левый угол по часовой";
  static const basic_pyraminx_4x4_st16_move = "l\'";
  static const basic_pyraminx_4x4_st16_toast = "Левый угол против часовой";
  static const basic_pyraminx_4x4_st17_move = "u";
  static const basic_pyraminx_4x4_st17_toast = "Верхний угол по часовой";
  static const basic_pyraminx_4x4_st18_move = "u\'";
  static const basic_pyraminx_4x4_st18_toast = "Верхний угол против часовой";
  static const basic_pyraminx_4x4_st19_move = "z";
  static const basic_pyraminx_4x4_st19_toast = "Задний угол по часовой";
  static const basic_pyraminx_4x4_st20_move = "z\'";
  static const basic_pyraminx_4x4_st20_toast = "Задний угол против часовой";
  static const basic_pyraminx_4x4_st21_move = "y";
  static const basic_pyraminx_4x4_st21_toast = "Задний угол по часовой";
  static const basic_pyraminx_4x4_st22_move = "y\'";
  static const basic_pyraminx_4x4_st22_toast = "Задний угол против часовой";

}