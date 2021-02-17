import 'package:rg2_flutter_getx/database/daos/pll_trainer_dao.dart';
import 'package:rg2_flutter_getx/database/entitys/pll_trainer_item.dart';

class PllTrainerVariants {

  static Future initDb(PllTrainerDao dao) async {
    print("Заполняем таблицу PLL_Trainers данными");
    dao.clearTable();
    var items = List<PllTrainerItem>();
    _internationalNames.asMap().forEach((index, intName) {
      var maximName = _maximNames[index];
      var imagePath = _images[index];
      var scramble = _scrambles[index];
      var customName = "$maximName ($intName)";
      items.add(PllTrainerItem(intName, maximName, customName, customName, scramble, imagePath, true));
    });
    dao.insertItems(items);
  }

  /// Названия PLL алгоритмов по методике Максима Чечнева
  static const _maximNames = [
    "Смежные окошки",
    "Противоположные окошки",
    "Рельсы",
    "Шахматы",
    "Запад",
    "Юг",
    "Светофор",
    "Австралия",
    "Смежный треугольник",
    "Противоположный треугольник",
    "Черепаха",
    "Угол",
    "Правые кирпичи",
    "Левые кирпичи",
    "Убийца",
    "Экватор",
    "Встречная машинка",
    "Попутная машинка",
    "Ближняя улитка",
    "Дальняя улитка",
    "Север",
  ];

  static const _internationalNames = [
    "Ua",
    "Ub",
    "Z",
    "H",
    "T",
    "Jb",
    "F",
    "Y",
    "Aa",
    "Ab",
    "E",
    "V",
    "Na",
    "Nb",
    "Rb",
    "Ra",
    "Ga",
    "Gc",
    "Gd",
    "Gb",
    "Ja",
  ];

  static const _images = [
    "assets/images/trainers/pll_trainer/pll_test_1.svg",
    "assets/images/trainers/pll_trainer/pll_test_2.svg",
    "assets/images/trainers/pll_trainer/pll_test_3.svg",
    "assets/images/trainers/pll_trainer/pll_test_4.svg",
    "assets/images/trainers/pll_trainer/pll_test_5.svg",
    "assets/images/trainers/pll_trainer/pll_test_6.svg",
    "assets/images/trainers/pll_trainer/pll_test_7.svg",
    "assets/images/trainers/pll_trainer/pll_test_8.svg",
    "assets/images/trainers/pll_trainer/pll_test_9.svg",
    "assets/images/trainers/pll_trainer/pll_test_10.svg",
    "assets/images/trainers/pll_trainer/pll_test_11.svg",
    "assets/images/trainers/pll_trainer/pll_test_12.svg",
    "assets/images/trainers/pll_trainer/pll_test_13.svg",
    "assets/images/trainers/pll_trainer/pll_test_14.svg",
    "assets/images/trainers/pll_trainer/pll_test_15.svg",
    "assets/images/trainers/pll_trainer/pll_test_16.svg",
    "assets/images/trainers/pll_trainer/pll_test_17.svg",
    "assets/images/trainers/pll_trainer/pll_test_18.svg",
    "assets/images/trainers/pll_trainer/pll_test_19.svg",
    "assets/images/trainers/pll_trainer/pll_test_20.svg",
    "assets/images/trainers/pll_trainer/pll_test_21.svg",
  ];

  static const _scrambles = [
    "R\' U R\' U\' R\' U\' R\' U R U R2",                                   // Ua
    "R2 U\' R\' U\' R U R U R U\' R",                                       // Ub
    "M2 U M2 U M\' U2 M2 U2 M\' U2",                                        // Z
    "M2\' U\' M2\' U2 M2\' U\' M2\'",                                       // H
    "U R U R\' U\' R\' F R2 U\' R\' U\' R U R\' F\' U\'",                   // T
    "U R U2 R\' U\' R U2 L\' U R\' U\' L U\'",                              // Jb
    "U (R\' U\' F\') (R U R\' U\') R\' F R2 U\' R\' U\' (R U R\' U R) U\'", // F
    "F R U\' R\' U\' R U R\' F\' R U R\' U\' R\' F R F\'",                  // Y
    "Rw U\' Rw F2 Rw\' U Rw F2 Rw2",                                        // Aa
    "(R U R\' F\') (Rw U R\' U\' Rw\' F R2 U\' R\')",                       // Ab
    "F\' (Rw U R\' U\') (Rw\' F R U2) (Rw U R\' U\') (Rw\' F R F\') U2",    // E
    "U R U2 R\' D R U\' R U\' R U R2 D R\' U\' R D2 U\'",                   // V
    "(R U\' L U2 R\' U L\') (R U\' L U2  R\' U L\') U",                     // Na
    "(L\' U R\') U2 (L U\' R) (L\' U R\') U2 (L U\' R) U\'",                // Nb
    "U (R\' U2 R U2) R\' F (R U R\' U\') R\' F\' R2 U\' U\'",               // Rb
    "U (R U R\' F\') (R U2 R\' U2) R\' F (R U R) U2 R\' U2",                // Ra
    "U (R\' U\' R U D\') (R2 U R\' U) (R U\' R U\') R2\' U\' D",            // Ga
    "R2 F\' R (U R U\' R\') F\' (R U2 R\' U2) R\' F2 R2",                   // Gc
    "U R2\' F2 (R U2) (R U2) R\' F (R U R\' U\') R\' F R2 U\'",             // Gd
    "U R2 U R\' U R\' U\' R U\' R2 (D U\') R\' U R D\'",                    // Gb
    "U F2 (L\' U\' L) F2 (R\' D R\' D\') R2 U\'",                           // Ja
  ];

}

