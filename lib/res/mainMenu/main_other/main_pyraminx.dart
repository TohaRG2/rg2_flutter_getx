
import 'package:rg2/models/phases.dart';

class MainPyraminx implements Phase {
  @override
  int count = main_pyraminx_title.length;

  @override
  String phase = "MAIN_PYRAMINX";

  @override
  List<String> titles() => main_pyraminx_title;

  @override
  List<String> icons() => main_pyraminx_icon;

  @override
  List<String> descriptions() => main_pyraminx_descr;

  @override
  List<String> urls() => main_pyraminx_url;

  @override
  List<String> comments() => List.filled(count, "");

///==================================================

    static const main_pyraminx_title = [
        "Послойный метод от Максима (LBL)",
        "Быстрый метод Кейхол (Keyhole)",
        "Пирамидка 4х4",
    ];

    static const main_pyraminx_icon = [
        "pyraminx",
        "keyhole",
        "pyraminx_4x4",
    ];

    static const main_pyraminx_descr = [
        main_pyraminx_st1_descr,
        main_pyraminx_st2_descr,
        main_pyraminx_st3_descr,
    ];

    static const main_pyraminx_url = [
        "submenu",
        "submenu",
        "submenu",
    ];

    static const main_pyraminx_st1_descr = "PYRAMINX";
    static const main_pyraminx_st2_descr = "KEYHOLE";
    static const main_pyraminx_st3_descr = "PYRAMINX_4X4";

}