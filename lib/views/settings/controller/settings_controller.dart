import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/settings/global_storage_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';

class SettingsController extends GetxController {
  final GlobalStorageController _settingsController = Get.find();

  @override
  void onInit() {
    super.onInit();
    logPrint("SettingsController onInit");
    _initializeRxVariables();
    _settingsController.callbacks.add(_initializeRxVariables);
  }

  final _primaryThemeColor = Rx<Color>(Colors.orange);
    Color get primaryThemeColor => _primaryThemeColor.value;
    set primaryThemeColor (color) {
      _primaryThemeColor.value = color;
      int value = color.value;
      _settingsController.setPropertyByKey(Property(key: Const.PRIMARY_COLOR, value: value));
      _changeCurrentTheme();
    }

  final _accentThemeColor = Rx<Color>(Colors.green);
    Color get accentThemeColor => _accentThemeColor.value;
    set accentThemeColor (color) {
      _accentThemeColor.value = color;
      int value = color.value;
      _settingsController.setPropertyByKey(Property(key: Const.ACCENT_COLOR, value: value));
      _changeCurrentTheme();
    }

  final _isDarkThemeSelect = RxBool(true);
    bool get isDarkThemeSelect => _isDarkThemeSelect.value;
    set isDarkThemeSelect(value) {
      _isDarkThemeSelect.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_THEME_DARK, value: value));
      _changeCurrentTheme();
    }

  final _textScaleFactor = RxDouble(1.0);
    double get textScaleFactor => _textScaleFactor.value;
    set textScaleFactor(value) {
      _textScaleFactor.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.SCALE_FACTOR, value: value));
    }

  final _isStartHelpEnabled = RxBool(false);
    bool get isStartHelpEnabled => _isStartHelpEnabled.value;
    set isStartHelpEnabled(value) {
      _isStartHelpEnabled.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_START_HELP_ENABLED, value: value));
    }

  final _isSwipeEnabled = RxBool(false);
    bool get isSwipeEnabled => _isSwipeEnabled.value;
    set isSwipeEnabled(value) {
      _isSwipeEnabled.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_SWIPE_ENABLED, value: value));
    }

  final _isPurchaseEnabled = RxBool(false);
    bool get isPurchaseEnabled => _isPurchaseEnabled.value;
    set isPurchaseEnabled(value) {
      _isPurchaseEnabled.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.IS_PURCHASE_ENABLED, value: value));
    }

  final _internetUsage = RxInt(0);
    int get internetUsage => _internetUsage.value;
    set internetUsage(value) {
      _internetUsage.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.INTERNET_USAGE, value: value));
    }

  final _bottomItem = RxInt(0);
    int get bottomItem => _bottomItem.value;
    set bottomItem(value) {
      _bottomItem.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.BOTTOM_ITEM, value: value));
    }

  final _currentPageNumber = RxInt(0);
    int get currentPageNumber => _currentPageNumber.value;
    set currentPageNumber(value) {
      _currentPageNumber.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.CURRENT_PAGE_NUMBER, value: value));
    }

  /// номер текущей страницы на закладке info
  final _currentInfoPageNumber = RxInt(0);
    int get currentInfoPageNumber => _currentInfoPageNumber.value;
    set currentInfoPageNumber (value) {
      _currentInfoPageNumber.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.CURRENT_INFO_PAGE_NUMBER, value: value));
    }

  /// режим разработчика
  final _godMode = RxBool(false);
    bool get godMode => _godMode.value;       // геттер public
    set __godMode(value) {                    // сеттер private
      _godMode.value = value;
      _settingsController.setPropertyByKey(Property(key: Const.GOD_MODE, value: value));
    }

  /// Счетчик нажатий на плашку
  var _godCount = 0;

  /// Инициализируем observable переменные
  _initializeRxVariables() {
    logPrint("_initializeRxVariables Start");

    _textScaleFactor.value = _settingsController.getPropertyByKey(Const.SCALE_FACTOR);
    _isStartHelpEnabled.value = _settingsController.getPropertyByKey(Const.IS_START_HELP_ENABLED);
    _isSwipeEnabled.value = _settingsController.getPropertyByKey(Const.IS_SWIPE_ENABLED);
    _isPurchaseEnabled.value = _settingsController.getPropertyByKey(Const.IS_PURCHASE_ENABLED);
    _internetUsage.value = _settingsController.getPropertyByKey(Const.INTERNET_USAGE);
    _bottomItem.value = _settingsController.getPropertyByKey(Const.BOTTOM_ITEM);
    _currentPageNumber.value = _settingsController.getPropertyByKey(Const.CURRENT_PAGE_NUMBER);
    _currentInfoPageNumber.value = _settingsController.getPropertyByKey(Const.CURRENT_INFO_PAGE_NUMBER);
    _godMode.value = _settingsController.getPropertyByKey(Const.GOD_MODE);

    logPrint("_initializeRxVariables - подгружаем тему");
    int _primaryColor = _settingsController.getPropertyByKey(Const.PRIMARY_COLOR);
    int _accentColor = _settingsController.getPropertyByKey(Const.ACCENT_COLOR);
    bool isDarkThemeNewValue = _settingsController.getPropertyByKey(Const.IS_THEME_DARK);

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
    ThemeData theme = getCurrentTheme();
    Get.changeTheme(theme);
  }

  /// получаем данные темы в соответствии с настройками программы
  ThemeData getCurrentTheme() {
    logPrint("Настройки темы: $primaryThemeColor, $accentThemeColor, $isDarkThemeSelect");
    return ThemeData(
        brightness: isDarkThemeSelect ? Brightness.dark : Brightness.light,
        primaryColor: primaryThemeColor,
        accentColor: accentThemeColor,
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
        toggleableActiveColor: accentThemeColor,
        textTheme: TextTheme().copyWith(
          headline4: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), //DefaultText для Text("")
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
  
}
