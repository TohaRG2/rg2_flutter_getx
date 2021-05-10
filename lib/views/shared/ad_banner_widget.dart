import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_show_controller.dart';
import 'package:rg2/utils/my_logger.dart';

// GetView + Get.put = один и тот же контроллер
// GetView + Get.create = разные контроллеры
// GetWidget + Get.create = один и тот же контроллер

class AdBannerWidget extends GetView<AdShowController> {
  AdBannerWidget({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logPrint("adBanner - ${controller.bannerAd?.adUnitId}");
    return Obx( () =>
    (controller.bannerAd == null)
      ? SizedBox(height: 60,)
      : Container(height: 60,
          child: AdWidget(ad: controller.bannerAd),
      )
    );
  }
}