import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

import 'learn_detail_page_item.dart';

class LearnDetailViewPager extends StatelessWidget {
  final LearnDetailController _controller = Get.find();
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    var _isSwipeEnabled = _settings.isSwipeEnabled;
    return DefaultTabController(
      length: _controller.currentItems.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            _controller.changeCurrentPageNumberTo(tabController.index); //Обновляем номер текущей страницы в контроллере
          }
        });
        return Obx(() {
          tabController.index = _controller.curPageNumber;
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              //Убираем автогенерируемую кнопку "Назад" из AppBar
              leading: ElevatedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(
                  Icons.menu_rounded,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Get.theme.primaryColor, // background
                ),
              ),
              flexibleSpace: Center(
                child: TabBar(
                  isScrollable: true,
                  tabs: _tabsList(),
                ),
              ),
            ),
            body: TabBarView(
              physics: _isSwipeEnabled ? null : NeverScrollableScrollPhysics(),
              children: _tabBarView(),
            ),
          );
        });
      }),
      initialIndex: _controller.curPageNumber,
    );
  }

  List<Tab> _tabsList() {
    var result = <Tab>[];
    var pageList = _controller.currentItems;
    pageList.forEach((element) {
      result.add(Tab(text: element.title));
    });
    return result;
  }

  List<Widget> _tabBarView() {
    var result = <Widget>[];
    List<MainDBItem> pageList = _controller.currentItems;
    Map<int, MainDBItem> map = pageList.asMap();
    map.forEach((pageNum, value) {
      result.add(LearnDetailPage(pageNum));
    });
    return result;
  }
}
