import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_state_controller.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class AdShowController extends GetxController {
  SettingsController _settingsController = Get.find();

  List<Rxn<BannerAd>> bannersList = <Rxn<BannerAd>>[];
  Rxn<BannerAd> _bannerAd = Rxn();
  BannerAd get bannerAd => _bannerAd.value;
  set bannerAd(BannerAd value) => _bannerAd.value = value;

  int _count = 1;
  int get count => _count;
  set count(int value) {
    logPrint("AdShowController set count - $value");
    _count = value;
    bannersList  = List<Rxn<BannerAd>>.generate(value, (_) => Rxn(null));
  }

  @override
  void onReady() {
    super.onReady();
    logPrint("AdShowController onReady - start create ");
    if (_settingsController.isAdEnabled) {
      final AdStateController controller = Get.find();
      final adState = controller.adState;
      adState.initialization.then((status) {
        bannersList.forEach((banner) {
          banner.value = BannerAd(
              adUnitId: adState.bannerAdUnitId,
              size: AdSize.banner,
              request: AdRequest(),
              // колбэки в ответ на события с баннером
              listener: adState.adListener)
          // оператор ..load() вызывает метод, как и .load(), но возвращает не результат load(), а сам объект BannerAd
            ..load();
        });
        logPrint("AdShowController onReady - complete. ${bannersList.map((b) => b.value?.adUnitId)}");
      });
    }
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
