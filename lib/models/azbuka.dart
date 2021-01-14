import 'package:get_storage/get_storage.dart';
import '../res/constants.dart';

class Azbuka {
  var sp = GetStorage();
  List<String> _currentAzbuka = List();
  List<String> _customAzbuka = List();

  /// Делаем класс синглетным, чтобы из любого места шло обращение к одному экземпляру

  // публичный Коснтруктор
  factory Azbuka() {
    return _instance;
  }

  static final Azbuka _instance = Azbuka._privateConstructor();

  Azbuka._privateConstructor() {
    _loadCurrentAzbuka();
    _loadCurrentAzbuka();
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
    currentAzbuka = result;
    return result;
  }

  List<String> get maximAzbuka => [
    "М","Л","Л",
    "М","-","К",
    "И","И","К",

    "С","С","О",
    "Р","-","О",
    "Р","П","П",

    "А","А","Б",
    "Г","-","Б",
    "Г","В","В",

    "У","Ц","Ц",
    "У","-","Х",
    "Ф","Ф","Х",

    "Э","Ш","Ш",
    "Э","-","Я",
    "Ю","Ю","Я",

    "Е","Е","Ё",
    "З","-","Ё",
    "З","Ж","Ж"
  ];

  List<String> get myAzbuka => [
  "М","Л","Л",
  "М","-","К",
  "И","И","К",

  "Р","Р","Н",
  "П","-","Н",
  "П","О","О",

  "А","А","Б",
  "Г","-","Б",
  "Г","В","В",

  "С","Ф","Ф",
  "С","-","У",
  "Т","Т","У",

  "Ц","Х","Х",
  "Ц","-","Ш",
  "Ч","Ч","Ш",

  "Д","Д","Е",
  "З","-","Е",
  "З","Ж","Ж"
  ];

}