import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/res/string_values.dart';

import 'learn_detail_view.dart';

class LearnDetailScreen extends StatelessWidget {
  final String _phase;
  final int _startId;

  LearnDetailScreen(this._phase, this._startId);

  @override
  Widget build(BuildContext context) {
    Future<void> pages = Get.find<LearnDetailController>().reLoadPages(_phase, _startId);
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


