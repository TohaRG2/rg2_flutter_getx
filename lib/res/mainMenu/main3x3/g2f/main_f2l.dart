
import 'package:rg2/models/phases.dart';

class MainF2l implements Phase {
  @override
  int count = main_f2l_title.length;

  @override
  String phase = "MAIN_F2L";

  @override
  List<String> titles() => main_f2l_title;

  @override
  List<String> icons() => main_f2l_icon;

  @override
  List<String> descriptions() => main_f2l_descr;

  @override
  List<String> urls() => main_f2l_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const main_f2l_title = [
        "Интуитивный F2l (без формул)",
        "Жизненный F2L от Максима",
        "Advanced F2L",
    ];

    static const main_f2l_icon = [
        "f2l",
        "f2l",
        "f2l",
    ];

    static const main_f2l_descr = [
        main_f2l_st1_descr,
        main_f2l_st2_descr,
        main_f2l_st4_descr,
    ];

    static const main_f2l_url = [
        "submenu",
        "submenu",
        "submenu",
    ];

    static const main_f2l_st1_descr = "INT_F2L";
    static const main_f2l_st2_descr = "F2L";
    static const main_f2l_st4_descr = "ADV_F2L";

}