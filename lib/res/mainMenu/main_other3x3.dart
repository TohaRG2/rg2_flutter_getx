import 'package:rg2/models/phases.dart';

class MainOther3x3 implements Phase {
  @override
  int count = other3x3_title.length;

  @override
  String phase = "MAIN_OTHER3X3";

  @override
  List<String> titles() => other3x3_title;

  @override
  List<String> icons() => other3x3_icon;

  @override
  List<String> descriptions() => other3x3_descr;

  @override
  List<String> urls() => other3x3_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const other3x3_title = [
        "Зеркальный куб (Mirror blocks)",
        "Ненормальный куб (Axis cube)",
        "Мастер пираморфикс (Master Pyramorphix)",
        "Судоку куб (Sudoku)",
        "Призрак куб (Ghost cube)",
        "Кубоид 3х3х2 (3x3x2)",
        "Пенроуз куб (Penrose)",
        "Закрученный куб (Twisty cube)",
        "Мельница (Windmill)",
        "Кирпич (Brick cube)",
        "Фишер куб (Fisher cube)",
        "Призма (Prism)",
        "Цилиндр Рубика (Cylinder)",
        "Шестеренчатый куб (Gear cube)",
    ];

    static const other3x3_icon = [
        "assets/images/main_other3x3/mirror.png",
        "assets/images/main_other3x3/axis.png",
        "assets/images/main_other3x3/pyramorphix.png",
        "assets/images/main_other3x3/sudoku.png",
        "assets/images/main_other3x3/ghost.png",
        "assets/images/main_other3x3/cub_3x3x2.png",
        "assets/images/main_other3x3/penrose.png",
        "assets/images/main_other3x3/tw_cube.png",
        "assets/images/main_other3x3/windmill.png",
        "assets/images/main_other3x3/brick_cube.png",
        "assets/images/main_other3x3/fisher.png",
        "assets/images/main_other3x3/prisma.png",
        "assets/images/main_other3x3/cylinder.png",
        "assets/images/main_other3x3/gear.png",
    ];

    static const other3x3_descr = [
        other3x3_st1_descr,
        other3x3_st2_descr,
        other3x3_st3_descr,
        other3x3_st4_descr,
        other3x3_st5_descr,
        other3x3_st6_descr,
        other3x3_st7_descr,
        other3x3_st8_descr,
        other3x3_st9_descr,
        other3x3_st10_descr,
        other3x3_st11_descr,
        other3x3_st12_descr,
        other3x3_st13_descr,
        other3x3_st14_descr,
    ];

    static const other3x3_url = [
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
    ];

    static const other3x3_st1_descr = "MIRROR";
    static const other3x3_st2_descr = "AXIS";
    static const other3x3_st3_descr = "PYRAMORPHIX";
    static const other3x3_st4_descr = "SUDOKU";
    static const other3x3_st5_descr = "GHOST";
    static const other3x3_st6_descr = "CUB_3X3X2";
    static const other3x3_st7_descr = "PENROSE";
    static const other3x3_st8_descr = "TW_CUBE";
    static const other3x3_st9_descr = "WINDMILL";
    static const other3x3_st10_descr = "BRICK";
    static const other3x3_st11_descr = "FISHER";
    static const other3x3_st12_descr = "PRISMA";
    static const other3x3_st13_descr = "CYLINDER";
    static const other3x3_st14_descr = "GEAR";

}

