import 'package:rg2/views/trainers/scramble_gen/model/moves.dart';

class BasicClover implements Moves {
  @override
  int count = basic_clover_moves.length;

  @override
  String eType = "BASIC_CLOVER";

  @override
  List<String> moves() => basic_clover_moves;

  @override
  List<String> icons() => basic_clover_icons;

  @override
  List<String> toasts() => basic_clover_toasts;

///==================================================

    static const basic_clover_moves = [
        basic_clover_st1_move,
        basic_clover_st2_move,
    ];

    static const basic_clover_icons = [
        "basic_clover_1",
        "basic_clover_2",
    ];

    static const basic_clover_toasts = [
        basic_clover_st1_toast,
        basic_clover_st2_toast,
    ];

    static const basic_clover_st1_move = "R";
    static const basic_clover_st1_toast = "Правое ребро";
    static const basic_clover_st2_move = "L";
    static const basic_clover_st2_toast = "Левое ребро";

}