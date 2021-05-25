import 'dart:io';
import 'package:rg2/controllers/iap/iap_const.dart';

class IAPHelper {

  static String get adsRemoveId {
    if (Platform.isAndroid) {
      return G_AD_OFF;
    } else if (Platform.isIOS) {
      return IOS_AD_OFF;
    } else {
      throw UnsupportedError("Unsupported platform for adsRemove");
    }
  }

  static String get openAllPuzzlesId {
    if (Platform.isAndroid) {
      return G_OPEN_ALL;
    } else if (Platform.isIOS) {
      return IOS_OPEN_ALL;
    } else {
      throw UnsupportedError("Unsupported platform for openAllPuzzles");
    }
  }


}