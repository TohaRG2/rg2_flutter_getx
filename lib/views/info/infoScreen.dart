import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

import 'about/about_programm_view.dart';
import 'advice/advice_view.dart';
import 'thanks/thanks_view.dart';

class InfoScreen extends StatelessWidget {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    var _isSwipeEnabled = _settings.isSwipeEnabled.value;
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (BuildContext context) {
        final TabController _tabController = DefaultTabController.of(context);
        _tabController.addListener(() {
          if (!_tabController.indexIsChanging) {
            _settings.currentInfoPageNumber = _tabController.index;
          }
        });
        _tabController.index = _settings.currentInfoPageNumber;
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(StrRes.infoTitle,
                    style: TextStyle(
                        color: Get.textTheme.headline5.color)),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              bottom: TabBar(
                indicatorWeight: 3.0,
                labelColor: Get.textTheme.headline5.color,
                unselectedLabelColor:
                    Get.textTheme.headline5.color.withAlpha(130),
                tabs: [
                  Tab(text: StrRes.infoAboutTitle),
                  Tab(text: StrRes.infoThanksTitle),
                  Tab(text: StrRes.infoAdviceTitle),
                ],
              ),
            ),
            body: TabBarView(
              physics: _isSwipeEnabled ? null : NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                AboutProgramView(),
                ThanksView(),
                AdviceView(),
              ],
            ));
      }),
    );
  }
}
