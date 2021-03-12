import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2/res/constants.dart';

class SettingsController extends GetxController {
  var isDarkThemeSelect = true.obs;
  var accentThemeColor = Colors.green.shade500.obs;
  var textScaleFactor = 1.0.obs;
  var isStartHelpEnabled = true.obs;
  var isSwipeEnabled = true.obs;
  var internetUsage = 0.obs;
  var currentPageNumber = 1.obs;

  var _bottomItem = 1.obs;
  int get bottomItem => _bottomItem.value;
  set bottomItem(value) {
    _bottomItem.value = value;
    GetStorage().write(Const.BOTTOM_ITEM, value);
  }

  var _primaryThemeColor = Colors.amber.shade700.obs;
  Color get primaryThemeColor => _primaryThemeColor.value;
  set primaryThemeColor (color) {
    _primaryThemeColor.value = color;
    int v = color.value;
    GetStorage().write(Const.PRIMARY_COLOR, v);
    changeCurrentTheme();
  }

  var _currentInfoPageNumber = 0.obs;
  int get currentInfoPageNumber => _currentInfoPageNumber.value;
  set currentInfoPageNumber (value) {
    _currentInfoPageNumber.value = value;
    GetStorage().write(Const.CURRENT_INFO_PAGE_NUMBER, value);
  }

  var _isPurchaseEnabled = false.obs;
  bool get isPurchaseEnabled => _isPurchaseEnabled.value;
  set isPurchaseEnabled(value) {
    _isPurchaseEnabled.value = value;
    GetStorage().write(Const.IS_PURCHASE_ENABLED, value);
  }

  var _godMode = false.obs;
  bool get godMode => _godMode.value;       // геттер public
  set __godMode(value) {                    // сеттер private
    _godMode.value = value;
    GetStorage().write(Const.GOD_MODE, value);
  }
  var _godCount = 0;

  @override
  void onInit() {
    print("onInit Start");
    _godMode.value = GetStorage().read(Const.GOD_MODE) ?? false;
    
    int _primaryColor = GetStorage().read(Const.PRIMARY_COLOR) ?? Colors.orange[600].value;
    _primaryThemeColor.value = Color(_primaryColor);

    int _accentColor = GetStorage().read(Const.ACCENT_COLOR) ?? Colors.green[600].value;
    accentThemeColor.value = Color(_accentColor);

    bool _isDark = GetStorage().read(Const.IS_THEME_DARK) ?? true;
    isDarkThemeSelect.value = _isDark;

    double _scaleFactor = GetStorage().read(Const.SCALE_FACTOR) ?? 1.0;
    textScaleFactor.value = _scaleFactor;

    bool _isStartHelpEnabled = GetStorage().read(Const.IS_START_HELP_ENABLED) ?? true;
    isSwipeEnabled.value = _isStartHelpEnabled;

    bool _isSwipeEnabled = GetStorage().read(Const.IS_SWIPE_ENABLED) ?? true;
    isSwipeEnabled.value = _isSwipeEnabled;

    _isPurchaseEnabled.value = GetStorage().read(Const.IS_PURCHASE_ENABLED) ?? false;

    int _internetUsage = GetStorage().read(Const.INTERNET_USING) ?? 0;
    internetUsage.value = _internetUsage;

    bottomItem = GetStorage().read(Const.BOTTOM_ITEM) ?? 0;

    int _currentPageNumber = GetStorage().read(Const.CURRENT_PAGE_NUMBER) ?? 1;
    currentPageNumber = _currentPageNumber.obs;

    _currentInfoPageNumber.value = GetStorage().read(Const.CURRENT_INFO_PAGE_NUMBER) ?? 0;

    ever(isDarkThemeSelect, (v) {
      GetStorage().write(Const.IS_THEME_DARK, v);
      changeCurrentTheme();
    });

    ever(accentThemeColor, (_) {
      int v = accentThemeColor.value.value;
      GetStorage().write(Const.ACCENT_COLOR, v);
      changeCurrentTheme();
    });

    ever(textScaleFactor, (v) {
      GetStorage().write(Const.SCALE_FACTOR, v);
    });

    ever(isStartHelpEnabled, (v) {
      GetStorage().write(Const.IS_START_HELP_ENABLED, v);
    });

    ever(isSwipeEnabled, (v) {
      GetStorage().write(Const.IS_SWIPE_ENABLED, v);
    });

    ever(internetUsage, (v) {
      GetStorage().write(Const.INTERNET_USING, v);
    });

    ever(currentPageNumber, (v) {
      GetStorage().write(Const.CURRENT_PAGE_NUMBER, v);
    });

    super.onInit();
    print("onInitSettings Complete");
  }

  changeCurrentTheme() {
    ThemeData theme = ThemeData(
      brightness: isDarkThemeSelect.value ? Brightness.dark : Brightness.light,
      primaryColor: primaryThemeColor,
      accentColor: accentThemeColor.value,
      toggleableActiveColor: accentThemeColor.value,
      textTheme: TextTheme().copyWith(
        headline4: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), //DefaultText для Text("")
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryThemeColor,
        textTheme: ButtonTextTheme.primary
      )
    );
    Get.changeTheme(theme);
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
