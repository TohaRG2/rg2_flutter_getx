import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_state.dart';
import 'package:rg2/utils/my_logger.dart';

final initStatusFuture = MobileAds.instance.initialize();
AdState adState = AdState(initStatusFuture);

/// Статическая фукция
adsIsolateRun(SendPort sendPort){
  logPrint("startAdsIsolate adsIsolateRun - 1");
  // Создаем AdState для использования в изоляте
  logPrint("startAdsIsolate adsIsolateRun - 2");

  logPrint("startAdsIsolate adsIsolateRun - 3");

  // Создаем порт слушатель уже внутри изолята
  ReceivePort receivePort = ReceivePort();
  // Отправляем данные в основной изолят, о том, куда присылать данные в этот изолят
  logPrint("startAdsIsolate - изолят отправил в $sendPort свой $receivePort");
  sendPort.send(receivePort.sendPort);

  // И создаем слушатель тут, в который будут приходить данные из основного изолята
  receivePort.listen((message) {
    logPrint("startAdsIsolate изолят получил сообщение $message");
    if (message is String) {
      if (message == "getAdState") {
        sendPort.send('1');
      }
    }
  });
}