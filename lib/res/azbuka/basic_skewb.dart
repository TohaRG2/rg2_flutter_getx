import 'package:rg2/views/trainers/scramble_gen/model/moves.dart';

class BasicSkewb implements Moves {
  @override
  int count = basic_skewb_moves.length;

  @override
  String eType = "BASIC_SKEWB";

  @override
  List<String> moves() => basic_skewb_moves;

  @override
  List<String> icons() => basic_skewb_icons;

  @override
  List<String> toasts() => basic_skewb_toasts;

///==================================================

    static const basic_skewb_moves = [
        basic_skewb_st1_move,
        basic_skewb_st2_move,
        basic_skewb_st3_move,
        basic_skewb_st4_move,
        basic_skewb_st5_move,
        basic_skewb_st6_move,
        basic_skewb_st7_move,
        basic_skewb_st8_move,
        basic_skewb_st9_move,
        basic_skewb_st10_move,
        basic_skewb_st11_move,
        basic_skewb_st12_move,
    ];

    static const basic_skewb_icons = [
        "basic_skewb_1",
        "basic_skewb_2",
        "basic_skewb_3",
        "basic_skewb_4",
        "basic_skewb_5",
        "basic_skewb_6",
        "basic_skewb_7",
        "basic_skewb_8",
        "basic_skewb_9",
        "basic_skewb_10",
        "basic_skewb_11",
        "basic_skewb_12",
    ];

    static const basic_skewb_toasts = [
        basic_skewb_st1_toast,
        basic_skewb_st2_toast,
        basic_skewb_st3_toast,
        basic_skewb_st4_toast,
        basic_skewb_st5_toast,
        basic_skewb_st6_toast,
        basic_skewb_st7_toast,
        basic_skewb_st8_toast,
        basic_skewb_st9_toast,
        basic_skewb_st10_toast,
        basic_skewb_st11_toast,
        basic_skewb_st12_toast,
    ];

    static const basic_skewb_st1_move = "R";
    static const basic_skewb_st1_toast = "Правая по часовой";
    static const basic_skewb_st2_move = "R\'";
    static const basic_skewb_st2_toast = "Правая против часовой";
    static const basic_skewb_st3_move = "L";
    static const basic_skewb_st3_toast = "Левая по часовой";
    static const basic_skewb_st4_move = "L\'";
    static const basic_skewb_st4_toast = "Левая против часовой";
    static const basic_skewb_st5_move = "U";
    static const basic_skewb_st5_toast = "Верх по часовой";
    static const basic_skewb_st6_move = "U\'";
    static const basic_skewb_st6_toast = "Верх против часовой";
    static const basic_skewb_st7_move = "B";
    static const basic_skewb_st7_toast = "Задняя по часовой";
    static const basic_skewb_st8_move = "B\'";
    static const basic_skewb_st8_toast = "Задняя против часовой";
    static const basic_skewb_st9_move = "F";
    static const basic_skewb_st9_toast = "Передняя по часовой";
    static const basic_skewb_st10_move = "F\'";
    static const basic_skewb_st10_toast = "Передняя против часовой";
    static const basic_skewb_st11_move = "D";
    static const basic_skewb_st11_toast = "Нижняя по часовой";
    static const basic_skewb_st12_move = "D\'";
    static const basic_skewb_st12_toast = "Нижняя против часовой";

}