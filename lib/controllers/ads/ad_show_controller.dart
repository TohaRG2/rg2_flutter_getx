import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_helper.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

/// Контроллер, который создается каждый раз при открытии окна с деталкой
/// и который генерирует список баннеров в зависимости от количества страниц с детальной информацией
class AdShowController extends GetxController {
  SettingsController _settingsController = Get.find();

  List<Rxn<BannerAd>> bannersList = <Rxn<BannerAd>>[];
  List<BannerAd> blist = <BannerAd>[];
  // Rxn<BannerAd> _bannerAd = Rxn();
  // BannerAd get bannerAd => _bannerAd.value;
  // set bannerAd(BannerAd value) => _bannerAd.value = value;

  int _count = 1;
  int get count => _count;
  set count(int value) {
    logPrint("AdShowController set count - $value");
    _count = value;
    // Заполняем список баннеров для отображения null
    bannersList  = List<Rxn<BannerAd>>.generate(_count, (_) => Rxn(null));
    // Если отображаем рекламу, то грузим баннеры
    if (_settingsController.isAdEnabled) {
      setBannersToBannersList();
      loadBanners();
    }
  }

  /// Действия при инициализации контроллера
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

  void setBannersToBannersList() {
    AdHelper.initialization();
    logPrint("AdShowController - start bannersList init");
    blist.clear();
    for (var i = 0; i < count; i++) {
      BannerAd banner = BannerAd(
          adUnitId: AdHelper.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          // колбэки в ответ на события с баннером
          listener: BannerAdListener(
            // Если баннер загружен
            onAdLoaded: (ad) {
              // banner.value = ad;
              logPrint('Ad loaded: $i ${ad.adUnitId}');
              bannersList[i].value = ad;
            },
            // Если ошибка
            onAdFailedToLoad: (ad, error) =>
                logPrint('Ad error: $i ${ad.adUnitId}, $error'),
            // Called when an impression occurs on the ad.
            onAdImpression: (Ad ad) =>
                logPrint('Ad impression. $i ${ad.adUnitId}'),
          ));
      blist.add(banner);
    }
    logPrint("AdShowController  - complete. ${bannersList.map((b) => b.value?.adUnitId)}");
  }

  loadBanners() {
    Future.forEach<BannerAd>(blist, (banner) => banner.load());
  }

}
