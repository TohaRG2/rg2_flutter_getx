import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/moves.dart';

class Basic4x4 implements Moves {
  @override
  int count = basic_4x4_moves.length;

  @override
  String eType = "BASIC_4X4";

  @override
  List<String> moves() => basic_4x4_moves;

  @override
  List<String> icons() => basic_4x4_icons;

  @override
  List<String> toasts() => basic_4x4_toasts;

///==================================================

    static const basic_4x4_moves = [
        basic_4x4_st1_move,
        basic_4x4_st2_move,
        basic_4x4_st3_move,
        basic_4x4_st4_move,
        basic_4x4_st5_move,
        basic_4x4_st6_move,
        basic_4x4_st7_move,
        basic_4x4_st8_move,
        basic_4x4_st9_move,
        basic_4x4_st10_move,
        basic_4x4_st11_move,
        basic_4x4_st12_move,
        basic_4x4_st13_move,
        basic_4x4_st14_move,
        basic_4x4_st15_move,
        basic_4x4_st16_move,
        basic_4x4_st17_move,
        basic_4x4_st18_move,
        basic_4x4_st19_move,
        basic_4x4_st20_move,
        basic_4x4_st21_move,
        basic_4x4_st22_move,
        basic_4x4_st23_move,
        basic_4x4_st24_move,
        basic_4x4_st25_move,
        basic_4x4_st26_move,
        basic_4x4_st27_move,
        basic_4x4_st28_move,
        basic_4x4_st29_move,
        basic_4x4_st30_move,
        basic_4x4_st31_move,
        basic_4x4_st32_move,
        basic_4x4_st33_move,
        basic_4x4_st34_move,
        basic_4x4_st35_move,
        basic_4x4_st36_move,
        basic_4x4_st37_move,
        basic_4x4_st38_move,
        basic_4x4_st39_move,
        basic_4x4_st40_move,
        basic_4x4_st41_move,
        basic_4x4_st42_move,
        basic_4x4_st43_move,
        basic_4x4_st44_move,
        basic_4x4_st45_move,
    ];

    static const basic_4x4_icons = [
        "basic_4x4_1",
        "basic_4x4_2",
        "basic_4x4_3",
        "basic_4x4_4",
        "basic_4x4_5",
        "basic_4x4_6",
        "basic_4x4_7",
        "basic_4x4_8",
        "basic_4x4_9",
        "basic_4x4_10",
        "basic_4x4_11",
        "basic_4x4_12",
        "basic_4x4_13",
        "basic_4x4_14",
        "basic_4x4_15",
        "basic_4x4_16",
        "basic_4x4_17",
        "basic_4x4_18",
        "basic_4x4_19",
        "basic_4x4_20",
        "basic_4x4_21",
        "basic_4x4_22",
        "basic_4x4_23",
        "basic_4x4_24",
        "basic_4x4_25",
        "basic_4x4_26",
        "basic_4x4_27",
        "basic_4x4_28",
        "basic_4x4_29",
        "basic_4x4_30",
        "basic_4x4_31",
        "basic_4x4_32",
        "basic_4x4_33",
        "basic_4x4_34",
        "basic_4x4_35",
        "basic_4x4_36",
        "basic_4x4_37",
        "basic_4x4_38",
        "basic_4x4_39",
        "basic_4x4_40",
        "basic_4x4_41",
        "basic_4x4_42",
        "basic_4x4_43",
        "basic_4x4_44",
        "basic_4x4_45",
    ];

    static const basic_4x4_toasts = [
        basic_4x4_st1_toast,
        basic_4x4_st2_toast,
        basic_4x4_st3_toast,
        basic_4x4_st4_toast,
        basic_4x4_st5_toast,
        basic_4x4_st6_toast,
        basic_4x4_st7_toast,
        basic_4x4_st8_toast,
        basic_4x4_st9_toast,
        basic_4x4_st10_toast,
        basic_4x4_st11_toast,
        basic_4x4_st12_toast,
        basic_4x4_st13_toast,
        basic_4x4_st14_toast,
        basic_4x4_st15_toast,
        basic_4x4_st16_toast,
        basic_4x4_st17_toast,
        basic_4x4_st18_toast,
        basic_4x4_st19_toast,
        basic_4x4_st20_toast,
        basic_4x4_st21_toast,
        basic_4x4_st22_toast,
        basic_4x4_st23_toast,
        basic_4x4_st24_toast,
        basic_4x4_st25_toast,
        basic_4x4_st26_toast,
        basic_4x4_st27_toast,
        basic_4x4_st28_toast,
        basic_4x4_st29_toast,
        basic_4x4_st30_toast,
        basic_4x4_st31_toast,
        basic_4x4_st32_toast,
        basic_4x4_st33_toast,
        basic_4x4_st34_toast,
        basic_4x4_st35_toast,
        basic_4x4_st36_toast,
        basic_4x4_st37_toast,
        basic_4x4_st38_toast,
        basic_4x4_st39_toast,
        basic_4x4_st40_toast,
        basic_4x4_st41_toast,
        basic_4x4_st42_toast,
        basic_4x4_st43_toast,
        basic_4x4_st44_toast,
        basic_4x4_st45_toast,
    ];

     static const basic_4x4_st1_move = "R";
    static const basic_4x4_st1_toast = "Правая по часовой";
    static const basic_4x4_st2_move = "R\'";
    static const basic_4x4_st2_toast = "Правая против часовой";
    static const basic_4x4_st3_move = "2R (r)";
    static const basic_4x4_st3_toast = "Втророй правый слой по часовой";
    static const basic_4x4_st4_move = "2R\' (r\')";
    static const basic_4x4_st4_toast = "Втророй правый слой против часовой";
    static const basic_4x4_st5_move = "Rw";
    static const basic_4x4_st5_toast = "Два правых слоя по часовой";
    static const basic_4x4_st6_move = "Rw\'";
    static const basic_4x4_st6_toast = "Два правых слоя против часовой";
    static const basic_4x4_st7_move = "R2";
    static const basic_4x4_st7_toast = "Правая дважды";
    static const basic_4x4_st8_move = "2R2(r2)";
    static const basic_4x4_st8_toast = "Второй правый слой дважды";
    static const basic_4x4_st9_move = "Rw2";
    static const basic_4x4_st9_toast = "Два правых слоя дважды";
    static const basic_4x4_st10_move = "L";
    static const basic_4x4_st10_toast = "Левая по часовой";
    static const basic_4x4_st11_move = "L\'";
    static const basic_4x4_st11_toast = "Левая против часовой";
    static const basic_4x4_st12_move = "2L (l)";
    static const basic_4x4_st12_toast = "Второй левый слой по часовой";
    static const basic_4x4_st13_move = "2L\' (l\')";
    static const basic_4x4_st13_toast = "Второй левый слой против часовой";
    static const basic_4x4_st14_move = "Lw";
    static const basic_4x4_st14_toast = "Два левых слоя по часовой";
    static const basic_4x4_st15_move = "Lw\'";
    static const basic_4x4_st15_toast = "Два левых слоя против часовой";
    static const basic_4x4_st16_move = "L2";
    static const basic_4x4_st16_toast = "Левая грань дважды";
    static const basic_4x4_st17_move = "2L2(l2)";
    static const basic_4x4_st17_toast = "Второй левый слой дважды";
    static const basic_4x4_st18_move = "Lw2";
    static const basic_4x4_st18_toast = "Два левых слоя дважды";
    static const basic_4x4_st19_move = "U";
    static const basic_4x4_st19_toast = "Верхняя по часовой";
    static const basic_4x4_st20_move = "U\'";
    static const basic_4x4_st20_toast = "Верхняя против часовой";
    static const basic_4x4_st21_move = "2U (u)";
    static const basic_4x4_st21_toast = "Второй верхний слой по часовой";
    static const basic_4x4_st22_move = "2U\' (u\')";
    static const basic_4x4_st22_toast = "Второй верхний слой против часовой";
    static const basic_4x4_st23_move = "Uw";
    static const basic_4x4_st23_toast = "Два вехних слоя по часовой";
    static const basic_4x4_st24_move = "Uw\'";
    static const basic_4x4_st24_toast = "Два верхних слоя против часовой";
    static const basic_4x4_st25_move = "U2";
    static const basic_4x4_st25_toast = "Верхняя грань дважды";
    static const basic_4x4_st26_move = "2U2(u2)";
    static const basic_4x4_st26_toast = "Второй верхний слой дважды";
    static const basic_4x4_st27_move = "Uw2";
    static const basic_4x4_st27_toast = "Два вехних слоя дважды";
    static const basic_4x4_st28_move = "F";
    static const basic_4x4_st28_toast = "Передняя по часовой";
    static const basic_4x4_st29_move = "F\'";
    static const basic_4x4_st29_toast = "Передняя против часовой";
    static const basic_4x4_st30_move = "2F (f)";
    static const basic_4x4_st30_toast = "Второй передний слой по часовой";
    static const basic_4x4_st31_move = "2F\' (f\')";
    static const basic_4x4_st31_toast = "Второй передний слой против часовой";
    static const basic_4x4_st32_move = "Fw";
    static const basic_4x4_st32_toast = "Два передних слоя по часовой";
    static const basic_4x4_st33_move = "Fw\'";
    static const basic_4x4_st33_toast = "Два передних слоя против часовой";
    static const basic_4x4_st34_move = "B";
    static const basic_4x4_st34_toast = "Задняя по часовой";
    static const basic_4x4_st35_move = "B\'";
    static const basic_4x4_st35_toast = "Задняя против часовой";
    static const basic_4x4_st36_move = "2B (b)";
    static const basic_4x4_st36_toast = "Второй задний слой по часовой";
    static const basic_4x4_st37_move = "2B\' (b\')";
    static const basic_4x4_st37_toast = "Второй задний слой против часовой";
    static const basic_4x4_st38_move = "Bw";
    static const basic_4x4_st38_toast = "Два задних слоя по часовой";
    static const basic_4x4_st39_move = "Bw\'";
    static const basic_4x4_st39_toast = "Два задних слоя против часовой";
    static const basic_4x4_st40_move = "x";
    static const basic_4x4_st40_toast = "По оси Х";
    static const basic_4x4_st41_move = "x\'";
    static const basic_4x4_st41_toast = "Против оси Х";
    static const basic_4x4_st42_move = "y";
    static const basic_4x4_st42_toast = "По оси Y";
    static const basic_4x4_st43_move = "y\'";
    static const basic_4x4_st43_toast = "Против оси Y";
    static const basic_4x4_st44_move = "z";
    static const basic_4x4_st44_toast = "По оси Z";
    static const basic_4x4_st45_move = "z\'";
    static const basic_4x4_st45_toast = "Против оси Z";

}