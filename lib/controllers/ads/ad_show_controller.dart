import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_state_controller.dart';
import 'package:rg2/utils/my_logger.dart';

class AdShowController extends GetxController {

  Rxn<BannerAd> _bannerAd = Rxn();
  BannerAd get bannerAd => _bannerAd.value;
  set bannerAd(BannerAd value) => _bannerAd.value = value;

  @override
  void onReady() {
    super.onReady();
    final AdStateController controller = Get.find();
    final adState = controller.adState;
    adState.initialization.then((status) {
      logPrint("AdShowController onReady - start");
      bannerAd = BannerAd(
          size: AdSize.banner,
          adUnitId: adState.bannerAdUnitId,
          request: AdRequest(),
          // колбэки в ответ на события с баннером
          listener: adState.adListener)
        // оператор ..load() вызывает метод, как и .load(), но возвращает не результат load(), а сам объект BannerAd
        ..load();
      logPrint("AdShowController onReady - complete. ${bannerAd?.adUnitId}");
    });
//    update();
  }

}
