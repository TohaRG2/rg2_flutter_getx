import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/res/constants.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/azbuka_simple_item.dart';

class Azbuka {
  var sp = GetStorage();
  List<String> _currentAzbuka = List();
  List<int> _currentColorsSide = [0,1,2,3,4,5];

  /// Делаем класс синглетным, чтобы из любого места шло обращение к одному экземпляру

  // публичный Коснтруктор
  factory Azbuka() {
    return _instance;
  }

  static final Azbuka _instance = Azbuka._privateConstructor();

  Azbuka._privateConstructor() {
    _currentAzbuka = _loadAzbuka(Const.CURRENT_AZBUKA);
    _currentColorsSide = _loadColors(Const.CURRENT_AZBUKA_COLORS);
  }

  /// Возвращаем список из 54 элементов (номер, цвет, буква)
  List<ColoredAzbukaItem> get currentColoredAzbuka {
    List<ColoredAzbukaItem> coloredAzbuka = List();
    currentAzbuka.asMap().forEach((index, value) {
      coloredAzbuka.add(ColoredAzbukaItem(index: index, colorNumber: _currentColorsSide[index ~/ 9], letter: value));
    });
    return coloredAzbuka;
  }

  get currentColorsSide => _currentColorsSide;
  set currentColorsSide(List<int> value) {
    if (value.length == 6) {
      _currentColorsSide = value;
      _saveCurrentColors();
    }
  }


  /// Возвращаем список из 54 (6*9) букв
  List<String> get currentAzbuka => (_currentAzbuka.isNotEmpty) ? _currentAzbuka : myAzbuka;
  set currentAzbuka(List<String> list) {
    if (list.isNotEmpty) {
      _currentAzbuka = list.toList();   //копируем по значению, а не по ссылке
    }
    _saveCurrentAzbuka();
  }

  /// Задаем параметры для моей азбуки, на выходе список из 54 элементов
  List<ColoredAzbukaItem> getMyColoredAzbuka() {
    _currentAzbuka = myAzbuka;
    _currentColorsSide = defaultAzbukaColors;
    return currentColoredAzbuka;
  }


  /// Задаем параметры для азбуки Максима, на выходе список из 54 элементов
  List<ColoredAzbukaItem> getMaximColoredAzbuka() {
    _currentAzbuka = maximAzbuka;
    _currentColorsSide = defaultAzbukaColors;
    return currentColoredAzbuka;
  }


  /// Загружаем азбуку из сохраненной, на выходе список из 54 элементов
  List<ColoredAzbukaItem> loadCustomColoredAzbuka() {
    _currentAzbuka = _loadAzbuka(Const.CUSTOM_AZBUKA);
    _currentColorsSide = _loadColors(Const.CUSTOM_AZBUKA_COLORS);
    return currentColoredAzbuka;
  }

  /// На вход подаем список из 54 элементов кубика (цвет+буква)
  /// сохраняем буквы в азбуку и цвета центров, как начальные цвета кубика
  setCurrentColoredAzbuka(List<ColoredAzbukaItem> coloredAzbuka) {
    // номера центральных элементов кубика
    const List<int> centersPositions = [4, 13, 22, 31, 40, 49];

    currentColorsSide = centersPositions.map((pos) => coloredAzbuka[pos].colorNumber).toList();
    currentAzbuka = coloredAzbuka.map((v) => v.letter).toList();
  }
  
  
  /// Сохраняем текущую азбуку и цвета как кастомные
  saveCustomColoredAzbuka() {
    _saveCustomAzbuka();
    _saveAsCustomColors();
  }

  _saveCustomAzbuka() {
    var savedString = currentAzbuka.join(",");
    print("сохраняем custom в файл $savedString");
    sp.write(Const.CUSTOM_AZBUKA, savedString);
  }


  _saveCurrentAzbuka() {
    var savedString = currentAzbuka.join(",");
    print("сохраняем current в файл $savedString");
    sp.write(Const.CURRENT_AZBUKA, savedString);
  }

  List<String> _loadAzbuka(String key) {
    String loadedString = sp.read(key) ?? "";
    List<String> result = loadedString.split(",");
    if (loadedString.isEmpty) { result = myAzbuka; }
    return result;
  }  
  
  _saveCurrentColors() {
    var savedString = currentColorsSide.join(",");
    sp.write(Const.CURRENT_AZBUKA_COLORS, savedString);
    print("сохраняем current_colors в файл $savedString");
  }

  List<int> _loadColors(String key) {
    String loadedString = sp.read(key) ?? "";
    return _convertStringToListOfColors(loadedString);
  }

  List<int> _convertStringToListOfColors(String loadedString) {
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
    return result;
  }

  _saveAsCustomColors() {
    var savedString = currentColorsSide.join(",");
    sp.write(Const.CUSTOM_AZBUKA_COLORS, savedString);
    print("сохраняем custom colors в файл $savedString");
  }
 
  static List<int> get defaultAzbukaColors => [0,1,2,3,4,5];

  static List<String> get maximAzbuka =>
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

  static List<String> get myAzbuka =>
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