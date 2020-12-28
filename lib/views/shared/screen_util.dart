import 'package:flutter/material.dart';

/// https://stackoverflow.com/questions/57337154/how-to-set-mediaquery-textscalefactor-of-fontsize-in-materialapp-theme

class ScreenUtil {
  static ScreenUtil instance = ScreenUtil();

  double width;
  double height;
  bool allowFontScaling;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;

  static double _bottomBarHeight;

  static double _textScaleFactor;

  ScreenUtil({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  static ScreenUtil getInstance() {
    return instance;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;
  static double get textScaleFactory => _textScaleFactor;
  static double get pixelRatio => _pixelRatio;
  static double get screenWidthDp => _screenWidth;
  static double get screenHeightDp => _screenHeight;
  static double get screenWidth => screenWidth * pixelRatio;
  static double get screenHeight => screenHeight * pixelRatio;
  static double get statusBarHeight => _statusBarHeight;
  static double get bottomBarHeight => _bottomBarHeight;
  get scaleWidth => _screenWidth / instance.width;
  get scaleHeight => _screenHeight / instance.height;
  setWidth(double width) => width * scaleWidth;
  setHeight(double height) => height * scaleHeight;
  setSp(double fontSize) {
    print("Scale 10 ${setWidth(fontSize)}");
    print("Scale 12 $_textScaleFactor");
    print("Scale 11 ${setWidth(fontSize) / _textScaleFactor}");
    return allowFontScaling
        ? setWidth(fontSize)
        : setWidth(fontSize) / _textScaleFactor;
  }
}