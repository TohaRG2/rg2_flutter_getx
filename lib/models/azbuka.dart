import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/azbuka_simple_item.dart';
import '../res/constants.dart';

class Azbuka {
  var sp = GetStorage();
  List<String> _currentAzbuka = List();
  List<String> _customAzbuka = List();
  List<int> _colorsSide = [0,1,2,3,4,5];

  /// Делаем класс синглетным, чтобы из любого места шло обращение к одному экземпляру

  // публичный Коснтруктор
  factory Azbuka() {
    return _instance;
  }

  static final Azbuka _instance = Azbuka._privateConstructor();

  Azbuka._privateConstructor() {
    _loadCurrentAzbuka();
    _loadCurrentColors();
  }

  List<AzbukaSimpleItem> get currentColoredAzbuka {
    List<AzbukaSimpleItem> coloredAzbuka = List();
    currentAzbuka.asMap().forEach((index, value) {
      coloredAzbuka.add(AzbukaSimpleItem(colorNumber: _colorsSide[index ~/ 9], letter: value));
    });
    return coloredAzbuka;
  }

  get colorsSide => _colorsSide;
  set colorsSide(List<int> value) {
    if (value.length == 6) {
      _colorsSide = value;
      _saveCurrentColors();
    }
  }

  get currentAzbuka => (_currentAzbuka.isNotEmpty) ? _currentAzbuka : myAzbuka;
  set currentAzbuka(List<String> list) {
    if (list.isNotEmpty) {
      _currentAzbuka = list.toList();   //копируем по значению, а не по ссылке
    }
    _saveCurrentAzbuka();
  }

  get customAzbuka => (_customAzbuka.isNotEmpty) ? _customAzbuka : myAzbuka;
  set customAzbuka(List<String> list) {
    if (list.isNotEmpty) {
      _customAzbuka = list.toList();   //копируем по значению, а не по ссылке
    }
    _saveCustomAzbuka();
  }

  _saveCustomAzbuka() {
    var savedString = customAzbuka.join(",");
    print("сохраняем custom в файл $savedString");
    sp.write(Const.CUSTOM_AZBUKA, savedString);
  }


  _saveCurrentAzbuka() {
    var savedString = currentAzbuka.join(",");
    print("сохраняем current в файл $savedString");
    sp.write(Const.CURRENT_AZBUKA, savedString);
  }

  List<String> _loadCurrentAzbuka() {
    String loadedString = sp.read(Const.CURRENT_AZBUKA) ?? "";
    List<String> result = loadedString.split(",");
    if (loadedString.isEmpty) { result = myAzbuka; }
    _currentAzbuka = result;
    return result;
  }

  _saveCurrentColors() {
    var savedString = colorsSide.join(",");
    print("сохраняем current_colors в файл $savedString");
    sp.write(Const.CURRENT_AZBUKA_COLORS, savedString);
  }

  _loadCurrentColors() {
    String loadedString = sp.read(Const.CURRENT_AZBUKA_COLORS) ?? "";
    List<int> result;
    if (loadedString.isEmpty) {
      result = defaultAzbukaColors;
    } else {
      var stList = loadedString.split(",");
      result = stList.map((st) => int.tryParse(st) ?? 8).toList();
      if (result.contains(8)) {
        result = defaultAzbukaColors;
      }
    }
    _colorsSide = result;
  }

  List<int> get defaultAzbukaColors => [0,1,2,3,4,5];

  List<String> get maximAzbuka =>
      [
        "М", "Л", "Л",
        "М", "-", "К",
        "И", "И", "К",

        "С", "С", "О",
        "Р", "-", "О",
        "Р", "П", "П",

        "А", "А", "Б",
        "Г", "-", "Б",
        "Г", "В", "В",

        "У", "Ц", "Ц",
        "У", "-", "Х",
        "Ф", "Ф", "Х",

        "Э", "Ш", "Ш",
        "Э", "-", "Я",
        "Ю", "Ю", "Я",

        "Е", "Е", "Ё",
        "З", "-", "Ё",
        "З", "Ж", "Ж"
      ];

  List<String> get myAzbuka =>
      [
        "М", "Л", "Л",
        "М", "-", "К",
        "И", "И", "К",

        "Р", "Р", "Н",
        "П", "-", "Н",
        "П", "О", "О",

        "А", "А", "Б",
        "Г", "-", "Б",
        "Г", "В", "В",

        "С", "Ф", "Ф",
        "С", "-", "У",
        "Т", "Т", "У",

        "Ц", "Х", "Х",
        "Ц", "-", "Ш",
        "Ч", "Ч", "Ш",

        "Д", "Д", "Е",
        "З", "-", "Е",
        "З", "Ж", "Ж"
      ];

}