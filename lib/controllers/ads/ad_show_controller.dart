import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_state_controller.dart';
import 'package:rg2/utils/my_logger.dart';

class AdShowController extends GetxController {

  List<Rxn<BannerAd>> bannersList = <Rxn<BannerAd>>[];
  Rxn<BannerAd> _bannerAd = Rxn();
  BannerAd get bannerAd => _bannerAd.value;
  set bannerAd(BannerAd value) => _bannerAd.value = value;

  int _count = 1;
  int get count => _count;
  set count(int value) {
    logPrint("AdShowController set count - $value");
    _count = value;
    bannersList  = List<Rxn<BannerAd>>.generate(value, (_) => Rxn());
  }

  @override
  void onReady() {
    super.onReady();
    final AdStateController controller = Get.find();
    final adState = controller.adState;
    adState.initialization.then((status) {
      logPrint("AdShowController onReady - start create ");
      bannersList.forEach((banner) {
        banner.value = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            request: AdRequest(),
            // колбэки в ответ на события с баннером
            listener: adState.adListener)
            // оператор ..load() вызывает метод, как и .load(), но возвращает не результат load(), а сам объект BannerAd
          ..load();
      });

      //logPrint("AdShowController onReady - complete. ${bannersList.map((b) => b.value?.adUnitId)}");
    });
  }

  @override
  void onInit() {
    logPrint("AdShowController onInit");
    super.onInit();
  }

  @override
  void onClose() {
    logPrint("AdShowController onClose");
    super.onClose();
  }

}
