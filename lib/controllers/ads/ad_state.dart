import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_helper.dart';
import 'package:rg2/utils/my_logger.dart';

/// Класс для
class AdState {
  /// Статус инициализации
  Future<InitializationStatus> initialization;

  /// Конструктор
  AdState(this.initialization);

  /// Возвращаем ссылку на ID баннера в зависимости от того IOS или Android, debug или release режим.
  String get bannerAdUnitId => AdHelper.bannerAdUnitId;

  /// A listener for receiving notifications for the lifecycle of a [BannerAd].
  BannerAdListener get adListener => _adListener;

  BannerAdListener _adListener = BannerAdListener(
      onAdLoaded: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      onAdFailedToLoad: (ad, error) =>
          logPrint('Ad loaded: ${ad.adUnitId}, $error'),
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => logPrint('Ad impression.'),
  );

}
