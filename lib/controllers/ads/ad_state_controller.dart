import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_state.dart';
import 'package:rg2/controllers/ads/ad_helper.dart';
import 'package:rg2/controllers/isolate/ads_isolate.dart';
import 'package:rg2/utils/my_logger.dart';

class AdStateController extends GetxController {
  // Храним ссылку на AdState
  AdState adState;
  // Ссылка на изолят
  Isolate _adsIsolate;
  // создаем порт, на котором будем принимать сообщения от изолята
  ReceivePort _receivePort = ReceivePort();
  // порт для отправки сообщений изоляту
  SendPort _isolateSendPort;

  @override
  void onInit() {
    super.onInit();
    // final initStatusFuture = MobileAds.instance.initialize();
    // adState = AdState(initStatusFuture);
    startAdsIsolate();
  }

  void startAdsIsolate() async {
    logPrint("startAdsIsolate -");
    // создаем сам изолят, передаем в него статическую функцию (выполняемую в изоляте) и ее единственный параметр
    // - порт на который изолят будет отправлять сообщения в основной поток
    _adsIsolate = await Isolate.spawn(adsIsolateRun, _receivePort.sendPort);
    // Создаем слушатель в котором получаем тики от изолята
    _receivePort.listen((message) {
      logPrint("startAdsIsolate Основной поток получил $message");
      // если получили SendPort, то сохраняем его, чтобы потом через него слать сообщения в изолят
      if (message is SendPort) {
        _isolateSendPort = message;
        _isolateSendPort.send("getAdState");
      }
      if (message is AdState) {

        adState = message;
      }
    });
    logPrint("startAdsIsolate - end");
  }

  @override
  void onClose(){
    _adsIsolate?.kill(priority: Isolate.immediate);
    _adsIsolate = null;
  }

  Future<List<BannerAd>> getBanners() async {
    return <BannerAd>[];
  }

// final AdStateController controller = Get.find();
// final adState = controller.adState;
// adState.initialization.then((status) {
//   logPrint("AdShowController onReady - start banners init");
//   bannersList.forEach((banner) {
//     banner.value = BannerAd(
//         adUnitId: adState.bannerAdUnitId,
//         size: AdSize.banner,
//         request: AdRequest(),
//         // колбэки в ответ на события с баннером
//         listener: adState.adListener)
//     // оператор ..load() вызывает метод, как и .load(), но возвращает не результат load(), а сам объект BannerAd
//       ..load();
//   });
//   logPrint("AdShowController onReady - complete. ${bannersList.map((b) => b.value?.adUnitId)}");
// });

//
// Джененрик метод, который отправляет сообщение изоляту и получает ответ
//
  Future<T> sendReceive<T>(T messageToBeSent) async {
    // Временный порт для получения ответа
    ReceivePort port = ReceivePort();

    // Отправляем сообщение изоляту, а также
    // говорим изоляту, какой порт использовать
    // для отправки ответа
    _isolateSendPort.send(
        CrossIsolatesMessage<T>(
          sender: port.sendPort,
          message: messageToBeSent,
        )
    );
    // Ждём ответ и возвращаем его
    return port.first;
  }


}

//
// Вспомогательный класс для отправки/получения сообщений в изолят
//
class CrossIsolatesMessage<T> {
  final SendPort sender;
  final T message;

  CrossIsolatesMessage({
    @required this.sender,
    this.message,
  });
}