import 'file:///C:/Users/rozov/AndroidStudioProjects/rg2_flutter_getx/lib/views/trainers/scramble_gen/model/moves.dart';

class BasicSquare implements Moves {
  @override
  int count = basic_square_moves.length;

  @override
  String eType = "BASIC_SQUARE";

  @override
  List<String> moves() => basic_square_moves;

  @override
  List<String> icons() => basic_square_icons;

  @override
  List<String> toasts() => basic_square_toasts;

///==================================================

    static const basic_square_moves = [
        basic_square_st1_move,
        basic_square_st2_move,
        basic_square_st3_move,
        basic_square_st4_move,
        basic_square_st5_move,
        basic_square_st6_move,
    ];

    static const basic_square_icons = [
        "basic_square_1",
        "basic_square_2",
        "basic_square_3",
        "basic_square_4",
        "basic_square_5",
        "basic_square_6",
    ];

    static const basic_square_toasts = [
        basic_square_st1_toast,
        basic_square_st2_toast,
        basic_square_st3_toast,
        basic_square_st4_toast,
        basic_square_st5_toast,
        basic_square_st6_toast,
    ];

    static const basic_square_st1_move = "/";
    static const basic_square_st1_toast = "Слайс";
    static const basic_square_st2_move = "(1,0)";
    static const basic_square_st2_toast = "Верх на один по часовой";
    static const basic_square_st3_move = "(-2,0)";
    static const basic_square_st3_toast = "Верх на два против часовой";
    static const basic_square_st4_move = "(0,2)";
    static const basic_square_st4_toast = "Низ на два по часовой";
    static const basic_square_st5_move = "(0,-1)";
    static const basic_square_st5_toast = "Низ на один против часовой";
    static const basic_square_st6_move = "(3,3)";
    static const basic_square_st6_toast = "Верх и низ на 3 по часовой";

}