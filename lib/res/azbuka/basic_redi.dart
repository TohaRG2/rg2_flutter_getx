import 'package:rg2_flutter_getx/models/moves.dart';

class BasicRedi implements Moves {
  @override
  int count = basic_redi_moves.length;

  @override
  String eType = "BASIC_REDI";

  @override
  List<String> moves() => basic_redi_moves;

  @override
  List<String> icons() => basic_redi_icons;

  @override
  List<String> toasts() => basic_redi_toasts;

///==================================================

    static const basic_redi_moves = [
        basic_redi_st1_move,
        basic_redi_st2_move,
        basic_redi_st3_move,
        basic_redi_st4_move,
    ];

    static const basic_redi_icons = [
        "basic_redi_1",
        "basic_redi_2",
        "basic_redi_3",
        "basic_redi_4",
    ];

    static const basic_redi_toasts = [
        basic_redi_st1_toast,
        basic_redi_st2_toast,
        basic_redi_st3_toast,
        basic_redi_st4_toast,
    ];

    static const basic_redi_st1_move = "R";
    static const basic_redi_st1_toast = "Право по часовой (от себя)";
    static const basic_redi_st2_move = "R\'";
    static const basic_redi_st2_toast = "Право против часовой (на себя)";
    static const basic_redi_st3_move = "L";
    static const basic_redi_st3_toast = "Лево по часовой (на себя)";
    static const basic_redi_st4_move = "L\'";
    static const basic_redi_st4_toast = "Лево против часовой (от себя)";

}