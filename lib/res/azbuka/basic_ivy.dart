import 'package:rg2_flutter_getx/models/moves.dart';

class BasicIvy implements Moves {
  @override
  int count = basic_ivy_moves.length;

  @override
  String eType = "BASIC_IVY";

  @override
  List<String> moves() => basic_ivy_moves;

  @override
  List<String> icons() => basic_ivy_icons;

  @override
  List<String> toasts() => basic_ivy_toasts;

///==================================================

    static const basic_ivy_moves = [
        basic_ivy_st1_move,
        basic_ivy_st2_move,
        basic_ivy_st3_move,
        basic_ivy_st4_move,
    ];

    static const basic_ivy_icons = [
        "basic_ivy_1",
        "basic_ivy_2",
        "basic_ivy_3",
        "basic_ivy_4",
    ];

    static const basic_ivy_toasts = [
        basic_ivy_st1_toast,
        basic_ivy_st2_toast,
        basic_ivy_st3_toast,
        basic_ivy_st4_toast,
    ];

    static const basic_ivy_st1_move = "R";
    static const basic_ivy_st1_toast = "Право по часовой (от себя)";
    static const basic_ivy_st2_move = "R\'";
    static const basic_ivy_st2_toast = "Право против часовой (на себя)";
    static const basic_ivy_st3_move = "L";
    static const basic_ivy_st3_toast = "Лево по часовой (на себя)";
    static const basic_ivy_st4_move = "L\'";
    static const basic_ivy_st4_toast = "Лево против часовой (от себя)";

}