import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_controller.dart';
import 'package:rg2/res/string_values.dart';

import 'learn_view_pager.dart';

class LearnScreen extends StatelessWidget {
  // Проверяем загрузились ли из базы значения типов головоломок (CubeTypes)
  final Future<void> pages = Get.find<LearnController>().loadPages();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pages,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text(StrRes.somethingWrong);

            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator()
              );

            // https://api.flutter.dev/flutter/material/TabController-class.html
            case ConnectionState.done:
              return LearnViewPager();   //Если все ок, выводим ViewPager

            default:
              return Text(StrRes.somethingWrong);
          }
        });
  }
}


