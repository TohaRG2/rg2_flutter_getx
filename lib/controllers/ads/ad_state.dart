import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_helper.dart';
import 'package:rg2/utils/my_logger.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitId => AdHelper.bannerAdUnitId;
  
  AdListener _adListener = AdListener(
      onAdLoaded: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      onAdClosed: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      onAdFailedToLoad: (ad, error) =>
          logPrint('Ad loaded: ${ad.adUnitId}, $error'),
      onAdOpened: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      onAppEvent: (ad, name, data) =>
          logPrint('Ad loaded: ${ad.adUnitId}, $name, $data'),
      onApplicationExit: (ad) => logPrint('Ad loaded: ${ad.adUnitId}'),
      onNativeAdClicked: (nativeAd) => logPrint('Ad loaded: ${nativeAd.adUnitId}'),
      onNativeAdImpression: (nativeAd) =>
          logPrint('Ad loaded: ${nativeAd.adUnitId}'),
      onRewardedAdUserEarnedReward: (ad, reward) =>
          logPrint('Ad loaded: ${ad.adUnitId}, ${reward.amount}, ${reward.type}')
  );
  AdListener get adListener => _adListener;

}
