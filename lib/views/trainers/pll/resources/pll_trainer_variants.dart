import 'package:rg2/database/daos/pll_trainer_dao.dart';
import 'package:rg2/database/entitys/pll_trainer_item.dart';

class PllTrainerVariants {

  static Future initDb(PllTrainerDao dao) async {
    print("Заполняем таблицу PLL_Trainers данными");
    dao.clearTable();
    var items = <PllTrainerItem>[];
    _internationalNames.asMap().forEach((index, intName) {
      var maximName = _maximNames[index];
      var imagePath = _images[index];
      var customName = "$maximName ($intName)";
      items.add(PllTrainerItem(intName, maximName, customName, customName, imagePath, true, id: index));
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

}

