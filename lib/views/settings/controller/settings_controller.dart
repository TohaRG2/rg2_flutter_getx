import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/storage/default_settings.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';

class SettingsController extends GetxController {
  final GlobalStorageController _storage = Get.find();

  @override
  void onInit() {
    super.onInit();
    logPrint("SettingsController onInit");
    _initializeRxVariables();
    _storage.callbacks.add(_initializeRxVariables);
  }

  /// Основной цвет
  final _primaryThemeColor = Rx<Color>(Colors.orange);
    Color get primaryThemeColor => _primaryThemeColor.value;
    set primaryThemeColor (color) {
      _primaryThemeColor.value = color;
      int value = color.value;
      _storage.setProperty(Property(key: Const.PRIMARY_COLOR, value: value));
      _changeCurrentTheme();
    }

  /// Цвет выделенных элементов (акцент)
  final _accentThemeColor = Rx<Color>(Colors.green);
    Color get accentThemeColor => _accentThemeColor.value;
    set accentThemeColor (color) {
      _accentThemeColor.value = color;
      int value = color.value;
      _storage.setProperty(Property(key: Const.ACCENT_COLOR, value: value));
      _changeCurrentTheme();
    }

  /// Включена ли темная тема
  final _isDarkThemeSelect = RxBool(true);
    bool get isDarkThemeSelect => _isDarkThemeSelect.value;
    set isDarkThemeSelect(value) {
      _isDarkThemeSelect.value = value;
      _storage.setProperty(Property(key: Const.IS_THEME_DARK, value: value));
      _changeCurrentTheme();
    }

  /// Коэффициент масштабирования текста
  final _textScaleFactor = RxDouble(1.0);
    double get textScaleFactor => _textScaleFactor.value;
    set textScaleFactor(value) {
      _textScaleFactor.value = value;
      _storage.setProperty(Property(key: Const.SCALE_FACTOR, value: value));
    }

  /// Открывать ли окно с подсказками при старте программы
  final _isStartHelpEnabled = RxBool(false);
    bool get isStartHelpEnabled => _isStartHelpEnabled.value;
    set isStartHelpEnabled(value) {
      _isStartHelpEnabled.value = value;
      _storage.setProperty(Property(key: Const.IS_START_HELP_ENABLED, value: value));
    }

  /// Возможно ли прокуртка свайпами во ViewPager, лучше отключать если используется жест смахивания для "назад"
  final _isSwipeEnabled = RxBool(false);
    bool get isSwipeEnabled => _isSwipeEnabled.value;
    set isSwipeEnabled(value) {
      _isSwipeEnabled.value = value;
      _storage.setProperty(Property(key: Const.IS_SWIPE_ENABLED, value: value));
    }

  /// Настройки доступа в интернет (0 - любой,  2 - только Wi-Fi, 3 - инетернет недоступен)
  final _internetUsage = RxInt(0);
    int get internetUsage => _internetUsage.value;
    set internetUsage(value) {
      _internetUsage.value = value;
      _storage.setProperty(Property(key: Const.INTERNET_USAGE, value: value));
    }

  /// Номер открытой закладки в bottomBar (Обучалки, тренажеры, избранное, инфо)
  final _bottomItem = RxInt(0);
    int get bottomItem => _bottomItem.value;
    set bottomItem(value) {
      _bottomItem.value = value;
      _storage.setProperty(Property(key: Const.BOTTOM_ITEM, value: value));
    }

  /// Номер текущей открытой страницы в обучалках
  final _currentPageNumber = RxInt(0);
    int get currentPageNumber => _currentPageNumber.value;
    set currentPageNumber(value) {
      _currentPageNumber.value = value;
      _storage.setProperty(Property(key: Const.CURRENT_PAGE_NUMBER, value: value));
    }

  /// Номер текущей страницы на закладке info
  final _currentInfoPageNumber = RxInt(0);
    int get currentInfoPageNumber => _currentInfoPageNumber.value;
    set currentInfoPageNumber (value) {
      _currentInfoPageNumber.value = value;
      _storage.setProperty(Property(key: Const.CURRENT_INFO_PAGE_NUMBER, value: value));
    }

  /// Режим разработчика
  final _godMode = RxBool(false);
    bool get godMode => _godMode.value;       // геттер public
    set __godMode(value) {                    // сеттер private
      _godMode.value = value;
      _storage.setProperty(Property(key: Const.GOD_MODE, value: value));
    }

  /// Куплен ли бесконечный просмотр обучалок
  final _isAdDisabled = RxBool(true);
    bool get isAdDisabled => _isAdDisabled.value;
    bool get isAdEnabled => !_isAdDisabled.value;
    set isAdDisabled(value) {
      _isAdDisabled.value = value;
      _storage.setProperty(Property(key: Const.IS_AD_DISABLED, value: value));
    }

  /// Все ли головоломки разблокированы
  final _isAllPuzzlesEnabled = RxBool(false);
    bool get isAllPuzzlesEnabled => _isAllPuzzlesEnabled.value;
    set isAllPuzzlesEnabled(value) {
      _isAllPuzzlesEnabled.value = value;
      _storage.setProperty(Property(key: Const.IS_ALL_PUZZLES_ENABLED, value: value));
    }

  /// Текущее количество монеток у пользователя (если меньше 0, значит неограниченно)
  final RxInt _coins = 0.obs;
    get coins => _coins.value;
    set coins(int value) {
      _coins.value = value;
      _storage.setProperty(Property(key: Const.CURRENT_COINS, value: value));
    }

  /// Тип пользователя, как покупателя inAppPurchase (0-ничего не покупал, 1 - купил чтобы не тратились монетки,
  /// 2 - купил все, 3 - купил все + кофе автору :)
  RxInt _purchaserState = RxInt(0);
    get purchaserState => _purchaserState.value;
    set purchaserState(int value) {
      _purchaserState.value = value;
      _storage.setProperty(Property(key: Const.PURCHASER_STATE, value: value));
    }

  // -------------------------  Глобальные настройки (доступны только на чтение из базы) ------------------------------
  /// Количество монеток, необходимых для открытия всех головоломок
  final _coinsToEnableAllPuzzle = RxInt(900);
    int get coinsToEnableAllPuzzle => _coinsToEnableAllPuzzle.value;

  /// Количество монеток доступных изначально. При чтении глобальных настроек, значение должно сохраниться в currentCoins
  final _initialCoins = RxInt(15);
    int get initialCoins => _initialCoins.value;
  //-------------------------------------------------------------------------------------------------------------------

  /// Счетчик нажатий на плашку
  var _godCount = 0;

  /// Инициализируем observable переменные
  _initializeRxVariables() {
    logPrint("_initializeRxVariables Start");

    _textScaleFactor.value = _storage.getPropertyByKey(Const.SCALE_FACTOR);
    _isStartHelpEnabled.value = _storage.getPropertyByKey(Const.IS_START_HELP_ENABLED);
    _isSwipeEnabled.value = _storage.getPropertyByKey(Const.IS_SWIPE_ENABLED);
    _internetUsage.value = _storage.getPropertyByKey(Const.INTERNET_USAGE);
    _bottomItem.value = _storage.getPropertyByKey(Const.BOTTOM_ITEM);
    _currentPageNumber.value = _storage.getPropertyByKey(Const.CURRENT_PAGE_NUMBER);
    _currentInfoPageNumber.value = _storage.getPropertyByKey(Const.CURRENT_INFO_PAGE_NUMBER);
    _godMode.value = _storage.getPropertyByKey(Const.GOD_MODE);
    _isAdDisabled.value = _storage.getPropertyByKey(Const.IS_AD_DISABLED);
    _isAllPuzzlesEnabled.value = _storage.getPropertyByKey(Const.IS_ALL_PUZZLES_ENABLED);
    _coins.value = _storage.getPropertyByKey(Const.CURRENT_COINS);
    _coinsToEnableAllPuzzle.value = _storage.getPropertyByKey(Const.COINS_TO_ENABLE_ALL_PUZZLE);

    logPrint("_initializeRxVariables - подгружаем тему");
    int _primaryColor = _storage.getPropertyByKey(Const.PRIMARY_COLOR);
    int _accentColor = _storage.getPropertyByKey(Const.ACCENT_COLOR);
    bool isDarkThemeNewValue = _storage.getPropertyByKey(Const.IS_THEME_DARK);

    var isPrimaryColorChange = _primaryThemeColor != null && primaryThemeColor != Color(_primaryColor);
    var isAccentColorChange = _accentThemeColor != null && accentThemeColor != Color(_accentColor);
    var isThemeChanged = isDarkThemeSelect != null && isDarkThemeSelect != isDarkThemeNewValue;

    _primaryThemeColor.value = Color(_primaryColor);
    _accentThemeColor.value = Color(_accentColor);
    _isDarkThemeSelect.value = isDarkThemeNewValue;

    // Если параметры темы поменялись, то запускаем процесс смены темы
    if (isPrimaryColorChange || isAccentColorChange || isThemeChanged) {
      _changeCurrentTheme();
    }
  }

  /// Меняем настройки текущей темы
  _changeCurrentTheme() {
    logPrint("_changeCurrentTheme - меняем тему");
    SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.dark;
    SystemChrome.setSystemUIOverlayStyle(_currentStyle);
    ThemeData theme = getCurrentTheme();
    if (theme.brightness == Brightness.dark) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    Get.changeTheme(theme);
  }

  /// Преобразуем простой Color в MaterialColor
  MaterialColor materialColorFrom(Color color) {
    var red = color.red;
    var green = color.green;
    var blue = color.blue;

    Map<int, Color> colorCodes = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };
    
    return MaterialColor(color.value, colorCodes);
  }


  /// получаем данные темы в соответствии с настройками программы
  ThemeData getCurrentTheme() {
    logPrint("Настройки темы: $primaryThemeColor, $accentThemeColor, $isDarkThemeSelect");
    return ThemeData(
        brightness: isDarkThemeSelect ? Brightness.dark : Brightness.light,
        primaryColor: primaryThemeColor,
        accentColor: accentThemeColor,
        primarySwatch: materialColorFrom(primaryThemeColor),
        toggleableActiveColor: accentThemeColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            // side: MaterialStateProperty.resolveWith<BorderSide>(
            //         (states) => BorderSide(color: Colors.blue ?? Colors.black)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => primaryThemeColor),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
            }),
          ),
        ),
        //primarySwatch: Colors.orange,
        textTheme: TextTheme().copyWith(
          headline4: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.normal), //DefaultText для Text("")
        ));
  }

  /// Пытаемся включить godMode (нужно 5 нажатий за 2.5 сек)
  tryChangeGodMode() {
    if (_godCount == 5) {
      _godCount++;
      __godMode = !godMode;
    } else {
      _godCount++;
      _delayedResetGodCount();
    }
  }

  /// Сбрасываем счетчик через 2.5 секунды
  _delayedResetGodCount() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    _godCount = 0;
  }


  /// Параметры для сброса настроек
  RxBool _resetMainSettings = true.obs;
  bool get resetMainSettings => _resetMainSettings.value;
  set resetMainSettings(value) => _resetMainSettings.value = value;

  RxBool _resetComments = false.obs;
  bool get resetComments => _resetComments.value;
  set resetComments(value) => _resetComments.value = value;

  RxBool _resetTimerTimes = false.obs;
  bool get resetTimerTimes => _resetTimerTimes.value;
  set resetTimerTimes(value) => _resetTimerTimes.value = value;

  /// Сбрасываем настройки программы в соответствии с выбранными параметрами в
  resetSettings() {
    if (resetMainSettings) {
      logPrint("resetSettings - сброс основных настроек");
      _textScaleFactor.value = resetPropertyByKey(Const.SCALE_FACTOR);
      _isStartHelpEnabled.value = resetPropertyByKey(Const.IS_START_HELP_ENABLED);
      _isSwipeEnabled.value = resetPropertyByKey(Const.IS_SWIPE_ENABLED);
      _internetUsage.value = resetPropertyByKey(Const.INTERNET_USAGE);
      _godMode.value = resetPropertyByKey(Const.GOD_MODE);

      _primaryThemeColor.value = Color(resetPropertyByKey(Const.PRIMARY_COLOR));
      _accentThemeColor.value = Color(resetPropertyByKey(Const.ACCENT_COLOR));
      _isDarkThemeSelect.value = resetPropertyByKey(Const.IS_THEME_DARK);
      _changeCurrentTheme();
    }
    if (resetComments) {
      logPrint("resetSettings - обнуляем комментарии к этапам");
    }
    if (resetTimerTimes) {
      logPrint("resetSettings - очищаем табличку времени сборок в таймере");
    }
    Get.back();
  }

  T resetPropertyByKey<T>(String key) {
    T value = defaultSettings[key];
    Property property = Property(key: key, value: value);
    _storage.setProperty(property);
    return value;
  }

}
