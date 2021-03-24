
import 'package:rg2/database/entitys/page_properties.dart';

/// Список основых фаз (страниц) для viewPager обучалок
class CubeTypes {

  int count = ct_names.length;

  List<String> names = ct_names;

  List<String> initPhases = ct_init_phases;

  List<String> currentPhases = ct_current_phases;

  List<PageProperties> list() {
    List<PageProperties> result = [];
    Map<int, String> map = names.asMap();
    map.forEach((key, name) {
        result.add(PageProperties(key, name, ct_init_phases[key], ct_current_phases[key]));
    });
    return result;
  }

///==================================================

    static const ct_names = [
        "2X2",
        "3X3",
        "Модификации 3Х3",
        "Большие кубы",
        "Скьюбы",
        "Другие головоломки",
    ];

    static const ct_init_phases = [
        "MAIN_2X2",
        "MAIN3X3",
        "MAIN_OTHER3X3",
        "BIG_MAIN",
        "MAIN_SKEWB",
        "MAIN_OTHER",
    ];

    static const ct_current_phases = [
        "MAIN_2X2",
        "MAIN3X3",
        "MAIN_OTHER3X3",
        "BIG_MAIN",
        "MAIN_SKEWB",
        "MAIN_OTHER",
    ];
}