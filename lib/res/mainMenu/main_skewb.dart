import 'package:rg2_flutter_getx/models/phases.dart';

class MainSkewb implements Phase {
  @override
  int count = main_skewb_title.length;

  @override
  String phase = "MAIN_SKEWB";

  @override
  List<String> titles() => main_skewb_title;

  @override
  List<String> icons() => main_skewb_icon;

  @override
  List<String> descriptions() => main_skewb_descr;

  @override
  List<String> urls() => main_skewb_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const main_skewb_title = [
        "Скьюб (Skewb)",
        "Закрученный Скьюб (Twisty skewb)",
        "Айви куб (Ivy cube)",
        "Реди куб (Redi cube)",
        "Клевер куб (Clover cube)",
        "Контейнер куб (Container cube)",
    ];

    static const main_skewb_icon = [
        "assets/images/main_skewb/skewb.png",
        "assets/images/main_skewb/tw_skewb.png",
        "assets/images/main_skewb/ivy.png",
        "assets/images/main_skewb/redi.png",
        "assets/images/main_skewb/clover.png",
        "assets/images/main_skewb/container.png",
    ];

    static const main_skewb_descr = [
        main_skewb_st1_descr,
        main_skewb_st2_descr,
        main_skewb_st3_descr,
        main_skewb_st4_descr,
        main_skewb_st5_descr,
        main_skewb_st6_descr,
    ];

    static const main_skewb_url = [
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
        "submenu",
    ];

    static const main_skewb_st1_descr = "SKEWB";
    static const main_skewb_st2_descr = "TW_SKEWB";
    static const main_skewb_st3_descr = "IVY";
    static const main_skewb_st4_descr = "REDI";
    static const main_skewb_st5_descr = "CLOVER";
    static const main_skewb_st6_descr = "CONTAINER";

}