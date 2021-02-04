

import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/moves.dart';

class Basic3x3 implements Moves {
  @override
  int count = basic_3x3_moves.length;

  @override
  String eType = "BASIC_3X3";

  @override
  List<String> moves() => basic_3x3_moves;

  @override
  List<String> icons() => basic_3x3_icons;

  @override
  List<String> toasts() => basic_3x3_toasts;

///==================================================

    static const basic_3x3_moves = [
        basic_3x3_st1_move,
        basic_3x3_st2_move,
        basic_3x3_st3_move,
        basic_3x3_st4_move,
        basic_3x3_st5_move,
        basic_3x3_st6_move,
        basic_3x3_st7_move,
        basic_3x3_st8_move,
        basic_3x3_st9_move,
        basic_3x3_st10_move,
        basic_3x3_st11_move,
        basic_3x3_st12_move,
        basic_3x3_st13_move,
        basic_3x3_st14_move,
        basic_3x3_st15_move,
        basic_3x3_st16_move,
        basic_3x3_st17_move,
        basic_3x3_st18_move,
        basic_3x3_st19_move,
        basic_3x3_st20_move,
        basic_3x3_st21_move,
        basic_3x3_st22_move,
        basic_3x3_st23_move,
        basic_3x3_st24_move,
        basic_3x3_st25_move,
        basic_3x3_st26_move,
        basic_3x3_st27_move,
        basic_3x3_st28_move,
        basic_3x3_st29_move,
        basic_3x3_st30_move,
        basic_3x3_st31_move,
        basic_3x3_st32_move,
        basic_3x3_st33_move,
        basic_3x3_st34_move,
        basic_3x3_st35_move,
        basic_3x3_st36_move,
    ];

    static const basic_3x3_icons = [
        "vbasic_1",
        "vbasic_2",
        "vbasic_3",
        "vbasic_4",
        "vbasic_5",
        "vbasic_6",
        "vbasic_7",
        "vbasic_8",
        "vbasic_9",
        "vbasic_10",
        "vbasic_11",
        "vbasic_12",
        "vbasic_13",
        "vbasic_14",
        "vbasic_15",
        "vbasic_16",
        "vbasic_17",
        "vbasic_18",
        "vbasic_19",
        "vbasic_20",
        "vbasic_21",
        "vbasic_22",
        "vbasic_23",
        "vbasic_24",
        "vbasic_25",
        "vbasic_26",
        "vbasic_27",
        "vbasic_28",
        "vbasic_29",
        "vbasic_30",
        "vbasic_31",
        "vbasic_32",
        "vbasic_33",
        "vbasic_34",
        "vbasic_35",
        "vbasic_36",
    ];

    static const basic_3x3_toasts = [
        basic_3x3_st1_toast,
        basic_3x3_st2_toast,
        basic_3x3_st3_toast,
        basic_3x3_st4_toast,
        basic_3x3_st5_toast,
        basic_3x3_st6_toast,
        basic_3x3_st7_toast,
        basic_3x3_st8_toast,
        basic_3x3_st9_toast,
        basic_3x3_st10_toast,
        basic_3x3_st11_toast,
        basic_3x3_st12_toast,
        basic_3x3_st13_toast,
        basic_3x3_st14_toast,
        basic_3x3_st15_toast,
        basic_3x3_st16_toast,
        basic_3x3_st17_toast,
        basic_3x3_st18_toast,
        basic_3x3_st19_toast,
        basic_3x3_st20_toast,
        basic_3x3_st21_toast,
        basic_3x3_st22_toast,
        basic_3x3_st23_toast,
        basic_3x3_st24_toast,
        basic_3x3_st25_toast,
        basic_3x3_st26_toast,
        basic_3x3_st27_toast,
        basic_3x3_st28_toast,
        basic_3x3_st29_toast,
        basic_3x3_st30_toast,
        basic_3x3_st31_toast,
        basic_3x3_st32_toast,
        basic_3x3_st33_toast,
        basic_3x3_st34_toast,
        basic_3x3_st35_toast,
        basic_3x3_st36_toast,
    ];

    static const basic_3x3_st1_move = "R";
    static const basic_3x3_st1_toast = "Включение света";
    static const basic_3x3_st2_move = "R\'";
    static const basic_3x3_st2_toast = "Выключение света";
    static const basic_3x3_st3_move = "F";
    static const basic_3x3_st3_toast = "В Лондон";
    static const basic_3x3_st4_move = "F\'";
    static const basic_3x3_st4_toast = "Из Лондона";
    static const basic_3x3_st5_move = "U";
    static const basic_3x3_st5_toast = "Крыша по";
    static const basic_3x3_st6_move = "U\'";
    static const basic_3x3_st6_toast = "Крыша против";
    static const basic_3x3_st7_move = "D";
    static const basic_3x3_st7_toast = "Земля по";
    static const basic_3x3_st8_move = "D\'";
    static const basic_3x3_st8_toast = "Земля против";
    static const basic_3x3_st9_move = "L";
    static const basic_3x3_st9_toast = "Лево по";
    static const basic_3x3_st10_move = "L\'";
    static const basic_3x3_st10_toast = "Лево против";
    static const basic_3x3_st11_move = "B";
    static const basic_3x3_st11_toast = "Зад по";
    static const basic_3x3_st12_move = "B\'";
    static const basic_3x3_st12_toast = "Зад против";
    static const basic_3x3_st13_move = "Rw";
    static const basic_3x3_st13_toast = "Жирно вкл.свет";
    static const basic_3x3_st14_move = "Rw\'";
    static const basic_3x3_st14_toast = "Жирно выкл.свет";
    static const basic_3x3_st15_move = "Fw";
    static const basic_3x3_st15_toast = "Жирно в Лондон";
    static const basic_3x3_st16_move = "Fw\'";
    static const basic_3x3_st16_toast = "Жирно из Лондона";
    static const basic_3x3_st17_move = "Uw";
    static const basic_3x3_st17_toast = "Крыша жирно по";
    static const basic_3x3_st18_move = "Uw\'";
    static const basic_3x3_st18_toast = "Крыша жирно против";
    static const basic_3x3_st19_move = "Dw";
    static const basic_3x3_st19_toast = "Земля жирно по";
    static const basic_3x3_st20_move = "Dw\'";
    static const basic_3x3_st20_toast = "Земля жирно против";
    static const basic_3x3_st21_move = "Lw";
    static const basic_3x3_st21_toast = "Лево жирно по";
    static const basic_3x3_st22_move = "Lw\'";
    static const basic_3x3_st22_toast = "Лево жирно против";
    static const basic_3x3_st23_move = "Bw";
    static const basic_3x3_st23_toast = "Зад жирно по";
    static const basic_3x3_st24_move = "Bw\'";
    static const basic_3x3_st24_toast = "Зад жирно против";
    static const basic_3x3_st25_move = "M";
    static const basic_3x3_st25_toast = "Центр неудобно";
    static const basic_3x3_st26_move = "M\'";
    static const basic_3x3_st26_toast = "Центр удобно";
    static const basic_3x3_st27_move = "E";
    static const basic_3x3_st27_toast = "Центр по горизонтали";
    static const basic_3x3_st28_move = "E\'";
    static const basic_3x3_st28_toast = "Горизотальный центр против";
    static const basic_3x3_st29_move = "S";
    static const basic_3x3_st29_toast = "Середина по";
    static const basic_3x3_st30_move = "S\'";
    static const basic_3x3_st30_toast = "Середина против";
    static const basic_3x3_st31_move = "x";
    static const basic_3x3_st31_toast = "По оси X";
    static const basic_3x3_st32_move = "x\'";
    static const basic_3x3_st32_toast = "Против оси X";
    static const basic_3x3_st33_move = "y";
    static const basic_3x3_st33_toast = "По оси Y";
    static const basic_3x3_st34_move = "y\'";
    static const basic_3x3_st34_toast = "Против оси Y";
    static const basic_3x3_st35_move = "z";
    static const basic_3x3_st35_toast = "По оси Z";
    static const basic_3x3_st36_move = "z\'";
    static const basic_3x3_st36_toast = "Против оси Z";
}