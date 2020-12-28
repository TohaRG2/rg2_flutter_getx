import 'package:rg2_flutter_getx/models/moves.dart';

class BasicContainer implements Moves {
  @override
  int count = basic_container_moves.length;

  @override
  String eType = "BASIC_CONTAINER";

  @override
  List<String> moves() => basic_container_moves;

  @override
  List<String> icons() => basic_container_icons;

  @override
  List<String> toasts() => basic_container_toasts;

///==================================================

    static const basic_container_moves = [
        basic_container_st1_move,
        basic_container_st2_move,
        basic_container_st3_move,
        basic_container_st4_move,
        basic_container_st5_move,
        basic_container_st6_move,
        basic_container_st7_move,
        basic_container_st8_move,
    ];

    static const basic_container_icons = [
        "container_1_3",
        "container_1_4",
        "container_1_5",
        "container_1_6",
        "container_1_7",
        "container_1_8",
        "container_1_9",
        "container_1_10",
    ];

    static const basic_container_toasts = [
        basic_container_st1_toast,
        basic_container_st2_toast,
        basic_container_st3_toast,
        basic_container_st4_toast,
        basic_container_st5_toast,
        basic_container_st6_toast,
        basic_container_st7_toast,
        basic_container_st8_toast,
    ];

    static const basic_container_st1_move = "RU";
    static const basic_container_st1_toast = "Правое верхнее по";
    static const basic_container_st2_move = "RU\'";
    static const basic_container_st2_toast = "Правое верхнее против";
    static const basic_container_st3_move = "LU\'";
    static const basic_container_st3_toast = "Левое верхнее против";
    static const basic_container_st4_move = "LU";
    static const basic_container_st4_toast = "Левое верхнее по";
    static const basic_container_st5_move = "RD";
    static const basic_container_st5_toast = "Правое нижнее по";
    static const basic_container_st6_move = "RD\'";
    static const basic_container_st6_toast = "Правое нижнее против";
    static const basic_container_st7_move = "LD\'";
    static const basic_container_st7_toast = "Левое нижнее против";
    static const basic_container_st8_move = "LD";
    static const basic_container_st8_toast = "Левое нижнее по";

}