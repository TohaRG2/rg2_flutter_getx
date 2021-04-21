import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/helpers/ad_helper.dart';
import 'package:rg2/utils/my_logger.dart';

class AdController extends GetxController {

  RewardedAd  _rewardedAd;

  @override
  void onInit() {
    super.onInit();

  }

  _loadInterstitial() async {
    logPrint("AD _loadInterstitial - ${AdHelper.rewardedAdUnitId}");
    _rewardedAd = RewardedAd(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (ad) {
          _rewardedAd.show();
        },
        onAdClosed: (ad) {
          logPrint("AD - Closed Ad");
          _rewardedAd.dispose();
        },
        onAdOpened: (ad) {
          logPrint("AD - Opened Ad");
        },
        onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
          logPrint("AD - Reward ${reward.type}, ${reward.amount}");
        },
      ),
    );
    _rewardedAd.load();
  }

  showInterstitialAd() {
    _loadInterstitial();
  }

  // чтобы показать рекламу, используем вот такой вызов в view
  // var button = TextButton(
  //   child: Text("Показать рекламу"),
  //   onPressed: () {
  //     adController.showInterstitialAd();
  //   },
  // );
}
