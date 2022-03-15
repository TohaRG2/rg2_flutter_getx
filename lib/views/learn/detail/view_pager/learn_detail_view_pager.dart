import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_show_controller.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

import 'learn_detail_page_item.dart';

class LearnDetailViewPager extends StatelessWidget {
  final LearnDetailController _detailController = Get.find();
  final SettingsController _settings = Get.find();
  final AdShowController _adShowController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _detailController.currentItems.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            _detailController.changeCurrentPageNumberTo(tabController.index); //Обновляем номер текущей страницы в контроллере
          }
        });
        return Obx(() {
          tabController.index = _detailController.curPageNumber;
          return Scaffold(
            appBar: AppBar(
              //Убираем автогенерируемую кнопку "Назад" из AppBar
              automaticallyImplyLeading: false,

              /// Кнопка открытия бокового меню
              leading: ElevatedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.menu_rounded,
                  color: Get.theme.scaffoldBackgroundColor,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Get.theme.primaryColor, // background
                ),
              ),
              title: TabBar(
                isScrollable: true,
                tabs: _tabsList(),
              ),
            ),
            body: _fullTabBar(tabController)
          );
        });
      }),
      initialIndex: _detailController.curPageNumber,
    );
  }

  Widget _fullTabBar(TabController tabController) {
    return Column(
      children: [
        /// Рекламный баннер
        // Obx(() => _adBanner(_adShowController.bannerAd)),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: _settings.isSwipeEnabled ? null : NeverScrollableScrollPhysics(),
            children: _tabBarView(),
          ),
        )
      ],
    );
  }


  List<Tab> _tabsList() {
    return _detailController.currentItems
        .map((mainDBItem) => Tab(text: mainDBItem.title,)).toList();
  }

  /// Создаем ViewPager (TabBarView) возвращаем спсиок сраничек для пэйджера
  List<Widget> _tabBarView() {
    var result = <Widget>[];
    List<MainDBItem> pageList = _detailController.currentItems;
    Map<int, MainDBItem> map = pageList.asMap();
    map.forEach((pageNum, value) {
      result.add(LearnDetailPage(pageNum));
    });
    return result;
  }

  Widget _adBanner(BannerAd bannerAd) {
    logPrint("adBanner - ${bannerAd?.adUnitId}");
    if (_settings.isAdDisabled)
      return SizedBox(height: 0);
    return (bannerAd == null)
        ? SizedBox(height: 60,)
        : Container(
            height: 60,
            child: AdWidget(ad: bannerAd),
          );
  }
}
