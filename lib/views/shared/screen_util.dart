import 'package:flutter/material.dart';
import 'package:rg2/utils/my_logger.dart';

/// https://stackoverflow.com/questions/57337154/how-to-set-mediaquery-textscalefactor-of-fontsize-in-materialapp-theme

class ScreenUtil {
  static ScreenUtil instance = ScreenUtil();

  double width;
  double height;
  bool allowFontScaling;

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;

  static late double _bottomBarHeight;

  static late double _textScaleFactor;

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
    _textScaleFactor = mediaQuery.textScaler.scale(1.0);
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;
  static double get textScaleFactory => _textScaleFactor;
  static double get pixelRatio => _pixelRatio;
  static double get screenWidthDp => _screenWidth;
  static double get screenHeightDp => _screenHeight;
  static double get screenWidth => screenWidthDp * pixelRatio;
  static double get screenHeight => screenHeightDp * pixelRatio;
  static double get statusBarHeight => _statusBarHeight;
  static double get bottomBarHeight => _bottomBarHeight;
  double get scaleWidth => _screenWidth / instance.width;
  double get scaleHeight => _screenHeight / instance.height;
  double setWidth(double width) => width * scaleWidth;
  double setHeight(double height) => height * scaleHeight;
  double setSp(double fontSize) {
    logPrint("Scale 10 ${setWidth(fontSize)}");
    logPrint("Scale 12 $_textScaleFactor");
    logPrint("Scale 11 ${setWidth(fontSize) / _textScaleFactor}");
    return allowFontScaling
        ? setWidth(fontSize)
        : setWidth(fontSize) / _textScaleFactor;
  }
}
