import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static String get interstitialAdUnitId {
    if (kReleaseMode) { // is Release Mode ??
      if (Platform.isAndroid) {
        return "ca-app-pub-2544863615395812/9657376245";
      } else if (Platform.isIOS) {
        return "ca-app-pub-2544863615395812~8589010617";
      } else {
        throw UnsupportedError("Unsupported platform for interstitial Ads");
      }
    } else {
      // Если debug режим, то выводим тестовые рекламки https://developers.google.com/admob/android/test-ads#sample%5C_ad%5C_units
      if (Platform.isAndroid) {
        //return "ca-app-pub-2544863615395812/9657376245";
        return "ca-app-pub-3940256099942544/8691691433";
      } else if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/5135589807";
      } else {
        throw UnsupportedError("Unsupported platform for interstitial Ads");
      }
    }
  }

  static String get rewardedAdUnitId {
    if (kReleaseMode) { // is Release Mode ??
      if (Platform.isAndroid) {
        return "ca-app-pub-2544863615395812/5074422963";
      } else if (Platform.isIOS) {
        return "ca-app-pub-2544863615395812/4771154723";
      } else {
        throw UnsupportedError("Unsupported platform ${Platform.localeName} for interstitial Ads");
      }
    } else {
      // Если debug режим, то выводим тестовые рекламки https://developers.google.com/admob/android/test-ads#sample%5C_ad%5C_units
      if (Platform.isAndroid) {
        //return "ca-app-pub-2544863615395812/5074422963";
        return "ca-app-pub-3940256099942544/5224354917";
      } else if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/1712485313";
      } else {
        throw UnsupportedError("Unsupported platform ${Platform.localeName} for interstitial Ads");
      }
    }
  }
}