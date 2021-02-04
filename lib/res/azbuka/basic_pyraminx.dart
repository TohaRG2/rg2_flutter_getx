import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/moves.dart';

class BasicPyraminx implements Moves {
  @override
  int count = basic_pyraminx_moves.length;

  @override
  String eType = "BASIC_PYRAMINX";

  @override
  List<String> moves() => basic_pyraminx_moves;

  @override
  List<String> icons() => basic_pyraminx_icons;

  @override
  List<String> toasts() => basic_pyraminx_toasts;

///==================================================

    static const basic_pyraminx_moves = [
        basic_pyraminx_st1_move,
        basic_pyraminx_st2_move,
        basic_pyraminx_st3_move,
        basic_pyraminx_st4_move,
        basic_pyraminx_st5_move,
        basic_pyraminx_st6_move,
        basic_pyraminx_st7_move,
        basic_pyraminx_st8_move,
        basic_pyraminx_st9_move,
        basic_pyraminx_st10_move,
        basic_pyraminx_st11_move,
        basic_pyraminx_st12_move,
        basic_pyraminx_st13_move,
        basic_pyraminx_st14_move,
        basic_pyraminx_st15_move,
        basic_pyraminx_st16_move,
    ];

    static const basic_pyraminx_icons = [
        "basic_pyraminx_1",
        "basic_pyraminx_2",
        "basic_pyraminx_3",
        "basic_pyraminx_4",
        "basic_pyraminx_5",
        "basic_pyraminx_6",
        "basic_pyraminx_7",
        "basic_pyraminx_8",
        "basic_pyraminx_9",
        "basic_pyraminx_10",
        "basic_pyraminx_11",
        "basic_pyraminx_12",
        "basic_pyraminx_13",
        "basic_pyraminx_14",
        "basic_pyraminx_15",
        "basic_pyraminx_16",
    ];

    static const basic_pyraminx_toasts = [
        basic_pyraminx_st1_toast,
        basic_pyraminx_st2_toast,
        basic_pyraminx_st3_toast,
        basic_pyraminx_st4_toast,
        basic_pyraminx_st5_toast,
        basic_pyraminx_st6_toast,
        basic_pyraminx_st7_toast,
        basic_pyraminx_st8_toast,
        basic_pyraminx_st9_toast,
        basic_pyraminx_st10_toast,
        basic_pyraminx_st11_toast,
        basic_pyraminx_st12_toast,
        basic_pyraminx_st13_toast,
        basic_pyraminx_st14_toast,
        basic_pyraminx_st15_toast,
        basic_pyraminx_st16_toast,
    ];

    static const basic_pyraminx_st1_move = "R";
    static const basic_pyraminx_st1_toast = "Правая по часовой";
    static const basic_pyraminx_st2_move = "R\'";
    static const basic_pyraminx_st2_toast = "Правая против часовой";
    static const basic_pyraminx_st3_move = "L";
    static const basic_pyraminx_st3_toast = "Левая по часовой";
    static const basic_pyraminx_st4_move = "L\'";
    static const basic_pyraminx_st4_toast = "Левая против часовой";
    static const basic_pyraminx_st5_move = "U";
    static const basic_pyraminx_st5_toast = "Крыша по часовой";
    static const basic_pyraminx_st6_move = "U\'";
    static const basic_pyraminx_st6_toast = "Крыша против часовой";
    static const basic_pyraminx_st7_move = "B";
    static const basic_pyraminx_st7_toast = "Задняя по часовой";
    static const basic_pyraminx_st8_move = "B\'";
    static const basic_pyraminx_st8_toast = "Задняя против часовой";
    static const basic_pyraminx_st9_move = "r";
    static const basic_pyraminx_st9_toast = "Правый угол по часовой";
    static const basic_pyraminx_st10_move = "r\'";
    static const basic_pyraminx_st10_toast = "Правый угол против часовой";
    static const basic_pyraminx_st11_move = "l";
    static const basic_pyraminx_st11_toast = "Левый угол по часовой";
    static const basic_pyraminx_st12_move = "l\'";
    static const basic_pyraminx_st12_toast = "Левый угол против часовой";
    static const basic_pyraminx_st13_move = "u";
    static const basic_pyraminx_st13_toast = "Верхний угол по часовой";
    static const basic_pyraminx_st14_move = "u\'";
    static const basic_pyraminx_st14_toast = "Верхний угол против часовой";
    static const basic_pyraminx_st15_move = "b";
    static const basic_pyraminx_st15_toast = "Задний угол по часовой";
    static const basic_pyraminx_st16_move = "b\'";
    static const basic_pyraminx_st16_toast = "Задний угол против часовой";

}