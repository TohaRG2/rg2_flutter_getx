import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/ads/ad_show_controller.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/res/string_values.dart';

import 'learn_detail_view.dart';

class LearnDetailScreen extends StatelessWidget {
  final AdShowController _adShowController = Get.put(AdShowController());
  final String _phase;
  final int _startId;

  LearnDetailScreen(this._phase, this._startId);

  @override
  Widget build(BuildContext context) {
    logPrint("LearnDetailScreen build - ");

    logPrint("LearnDetailScreen reLoadPages");
    var controller = Get.put(LearnDetailController());
    Future<void> pages = controller.reLoadPages(_phase, _startId);
    return FutureBuilder(
        future: pages,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:        // если pages = null;
              return Text(StrRes.somethingWrong);

            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator()
              );

            case ConnectionState.done:        // если все хорошо и данные загрузились, то выводим пэджер
              return LearnDetailView();

            default:
              return Text(StrRes.somethingWrong);
          }
        });
  }
}


