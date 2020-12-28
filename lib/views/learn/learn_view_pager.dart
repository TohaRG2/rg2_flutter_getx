import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/controllers/settingsController.dart';
import 'package:rg2_flutter_getx/database/entitys/page_properties.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

import 'main_menu/main_menu_list_view.dart';

class LearnViewPager extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    var _isSwipeEnabled = _settings.isSwipeEnabled.value;
    return GetBuilder<LearnController>(
      builder: (_lc) {
        return DefaultTabController(
          length: _lc.pages.length,
          child: Builder(builder: (BuildContext context) {
            final TabController _tabController = DefaultTabController.of(context);
            var pageNum = _lc.curPageNumber;
            print("pageNum = $pageNum");

            //регистрируем листенер, только если его нет и переходим на страницу
            //todo разобраться с hasListeners, почему подсвечивается
            if (!_tabController.hasListeners) {
              _tabController.addListener(() {
                if (!_tabController.indexIsChanging) {
                  print("$_tabController - $pageNum ");
                  _lc.changeCurrentPageNumberTo(_tabController
                      .index); //Обновляем номер текущей страницы в контроллере
                }
              });
              _tabController.index = _lc.curPageNumber;
            }
            return Scaffold(
              appBar: AppBar(
                title: Center(
                    child: Text(
                        "${R.learnTitle}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline5.color),
                    )),
                //backgroundColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                bottom: TabBar(
                  indicatorWeight: 3.0,
                  //По умолчанию берется из ThemeData.primaryTextTheme.bodyText1.textColor
                  labelColor: Theme.of(context).textTheme.headline5.color,
                  unselectedLabelColor: Theme.of(context).textTheme.headline5.color.withAlpha(130),
                  isScrollable: true,
                  tabs: _tabsList(),
                ),
              ),
              body: WillPopScope(
                // Обработчик нажатия на Back в андродид
                onWillPop: onWillPop,
                child: TabBarView(
                  controller: _tabController,
                  //Прокрутка свайпами в зависимости от настроек программы
                  physics: _isSwipeEnabled ? null : NeverScrollableScrollPhysics(),
                  children: _tabBarView(),
                ),
              ),
            );
          }),
          //initialIndex: _settings.currentPageNumber.value,
        );
      }
    );
  }

  //Возвращаем true, если надо дальше продолжать обрабатывать нажатие, т.е. выход из программы
  Future<bool> onWillPop() async {
    //print("Back pressed");
    return _learnController.canReturnToOnePhaseBack();
  }

  List<Tab> _tabsList() {
    var result = <Tab>[];
    var pageList = _learnController.pages;
    pageList.forEach((element) {
      result.add(Tab(text: element.title));
    });
    return result;
  }

  List<Widget> _tabBarView() {
    var result = <Widget>[];
    List<PageProperties> pageList = _learnController.pages;
    Map<int, PageProperties> map = pageList.asMap();
    map.forEach((key, value) {
      result.add(MenuList(key));
    });
    return result;
  }
}
