import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2/res/constants.dart';

class SettingsController extends GetxController {
  var _sp = GetStorage();
  
  var accentThemeColor = Colors.green.shade500.obs;
  var textScaleFactor = 1.0.obs;
  var isStartHelpEnabled = true.obs;
  var isSwipeEnabled = true.obs;
  var internetUsage = 0.obs;
  var currentPageNumber = 1.obs;

  var _isDarkThemeSelect = true.obs;
  bool get isDarkThemeSelect => _isDarkThemeSelect.value;
  set isDarkThemeSelect(value) {
    _isDarkThemeSelect.value = value;
    _sp.write(Const.IS_THEME_DARK, value);
    _changeCurrentTheme();
  }

  var _bottomItem = 1.obs;
  int get bottomItem => _bottomItem.value;
  set bottomItem(value) {
    _bottomItem.value = value;
    _sp.write(Const.BOTTOM_ITEM, value);
  }

  var _primaryThemeColor = Colors.amber.shade700.obs;
  Color get primaryThemeColor => _primaryThemeColor.value;
  set primaryThemeColor (color) {
    _primaryThemeColor.value = color;
    int v = color.value;
    _sp.write(Const.PRIMARY_COLOR, v);
    _changeCurrentTheme();
  }

  var _currentInfoPageNumber = 0.obs;
  int get currentInfoPageNumber => _currentInfoPageNumber.value;
  set currentInfoPageNumber (value) {
    _currentInfoPageNumber.value = value;
    _sp.write(Const.CURRENT_INFO_PAGE_NUMBER, value);
  }

  var _isPurchaseEnabled = false.obs;
  bool get isPurchaseEnabled => _isPurchaseEnabled.value;
  set isPurchaseEnabled(value) {
    _isPurchaseEnabled.value = value;
    _sp.write(Const.IS_PURCHASE_ENABLED, value);
  }

  var _godMode = false.obs;
  bool get godMode => _godMode.value;       // геттер public
  set __godMode(value) {                    // сеттер private
    _godMode.value = value;
    _sp.write(Const.GOD_MODE, value);
  }
  var _godCount = 0;

  @override
  void onInit() {
    super.onInit();
    print("onInit Start");
    _godMode.value = _sp.read(Const.GOD_MODE) ?? false;

    int _primaryColor = _sp.read(Const.PRIMARY_COLOR) ?? Colors.orange[600].value;
    _primaryThemeColor.value = Color(_primaryColor);

    int _accentColor = _sp.read(Const.ACCENT_COLOR) ?? Colors.green[600].value;
    accentThemeColor.value = Color(_accentColor);

    _isDarkThemeSelect.value = _sp.read(Const.IS_THEME_DARK) ?? true;

    double _scaleFactor = _sp.read(Const.SCALE_FACTOR) ?? 1.0;
    textScaleFactor.value = _scaleFactor;

    bool _isStartHelpEnabled = _sp.read(Const.IS_START_HELP_ENABLED) ?? true;
    isSwipeEnabled.value = _isStartHelpEnabled;

    bool _isSwipeEnabled = _sp.read(Const.IS_SWIPE_ENABLED) ?? true;
    isSwipeEnabled.value = _isSwipeEnabled;

    _isPurchaseEnabled.value = _sp.read(Const.IS_PURCHASE_ENABLED) ?? false;

    int _internetUsage = _sp.read(Const.INTERNET_USING) ?? 0;
    internetUsage.value = _internetUsage;

    bottomItem = _sp.read(Const.BOTTOM_ITEM) ?? 0;

    int _currentPageNumber = _sp.read(Const.CURRENT_PAGE_NUMBER) ?? 1;
    currentPageNumber = _currentPageNumber.obs;

    _currentInfoPageNumber.value = _sp.read(Const.CURRENT_INFO_PAGE_NUMBER) ?? 0;

    ever(accentThemeColor, (_) {
      int v = accentThemeColor.value.value;
      _sp.write(Const.ACCENT_COLOR, v);
      _changeCurrentTheme();
    });

    ever(textScaleFactor, (v) {
      _sp.write(Const.SCALE_FACTOR, v);
    });

    ever(isStartHelpEnabled, (v) {
      _sp.write(Const.IS_START_HELP_ENABLED, v);
    });

    ever(isSwipeEnabled, (v) {
      _sp.write(Const.IS_SWIPE_ENABLED, v);
    });

    ever(internetUsage, (v) {
      _sp.write(Const.INTERNET_USING, v);
    });

    ever(currentPageNumber, (v) {
      _sp.write(Const.CURRENT_PAGE_NUMBER, v);
    });

    print("onInitSettings Complete");
  }

  _changeCurrentTheme() {
    ThemeData theme = getCurrentTheme();
    Get.changeTheme(theme);
  }

  ThemeData getCurrentTheme() {
    return ThemeData(
        brightness: isDarkThemeSelect ? Brightness.dark : Brightness.light,
        primaryColor: primaryThemeColor,
        accentColor: accentThemeColor.value,
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
        primarySwatch: Colors.orange,
        toggleableActiveColor: accentThemeColor.value,
        textTheme: TextTheme().copyWith(
          headline4: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), //DefaultText для Text("")
        ));
  }

  tryChangeGodMode() {
    if (_godCount == 5) {
      _godCount++;
      __godMode = !godMode;
    } else {
      _godCount++;
      _delayedResetGodCount();
    }
  }
  
  _delayedResetGodCount() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    _godCount = 0;
  }
  
}
