
import 'package:rg2_flutter_getx/models/phases.dart';

class MainOther implements Phase {
  @override
  int count = other_title.length;

  @override
  String phase = "MAIN_OTHER";

  @override
  List<String> titles() => other_title;

  @override
  List<String> icons() => other_icon;

  @override
  List<String> descriptions() => other_descr;

  @override
  List<String> urls() => other_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const other_title = [
        "Пирамидка Мефферта (Pyraminx)",
        "Мегаминкс (Megaminx)",
        "Скваер (Square-1)",
        "Звезда скваер (Super Square Star)",
        "Кубоид 2х2х3",
        "Пентакль куб",
    ];

    static const other_icon = [
        "assets/images/main_other/pyraminx.png",
        "assets/images/main_other/megaminx.png",
        "assets/images/main_other/square.png",
        "assets/images/main_other/sq_star.png",
        "assets/images/main_other/cub_2x2x3.png",
        "assets/images/main_other/pentacle.png",
    ];

    static const other_descr = [
        other_st1_descr,
        other_st2_descr,
        other_st3_descr,
        other_st4_descr,
        other_st5_descr,
        other_st6_descr,
    ];

    static const other_url = [
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
    ];

    static const other_st1_descr = "MAIN_PYRAMINX";
    static const other_st2_descr = "MEGAMINX";
    static const other_st3_descr = "SQUARE";
    static const other_st4_descr = "SQ_STAR";
    static const other_st5_descr = "CUBOID_2X2X3";
    static const other_st6_descr = "PENTACLE";

}

