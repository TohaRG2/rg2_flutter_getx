import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_helper.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

/// Контроллер, который создается каждый раз при открытии окна с деталкой
/// и который генерирует список баннеров в зависимости от количества страниц с детальной информацией
class AdShowController extends GetxController {
  SettingsController _settingsController = Get.find();

  Rxn<BannerAd> _bannerAd = Rxn();
    BannerAd get bannerAd => _bannerAd.value;
    set bannerAd(BannerAd value) => _bannerAd.value = value;

  /// Действия при инициализации контроллера
  @override
  void onInit() {
    logPrint("AdShowController onInit");
    super.onInit();
    setBanner();
  }

  @override
  void onClose() {
    logPrint("AdShowController onClose");
    super.onClose();
  }

  void setBanner() {
    AdHelper.initialization();
    logPrint("AdShowController - start bannersList init");
    BannerAd banner = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        // колбэки в ответ на события с баннером
        listener: BannerAdListener(
          // Если баннер загружен
          onAdLoaded: (ad) {
            // banner.value = ad;
            logPrint('Ad loaded: ${ad.adUnitId}');
            bannerAd = ad;
          },
          // Если ошибка
          onAdFailedToLoad: (ad, error) =>
              logPrint('Ad error: ${ad.adUnitId}, $error'),
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) =>
              logPrint('Ad impression. ${ad.adUnitId}'),
        ));
    banner.load();
    logPrint("AdShowController  - complete. ${_bannerAd.value?.adUnitId}");
  }

}
