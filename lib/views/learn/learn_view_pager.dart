import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/in_app_purchase_controller.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/get_money_dialog.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';

import 'main_menu/main_menu_list_view.dart';

class LearnViewPager extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final SettingsController _settings = Get.find();
  final InAppPurchaseController _purchaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    var _isSwipeEnabled = _settings.isSwipeEnabled;
    return GetBuilder<LearnController>(
      builder: (_lc) {
        return DefaultTabController(
          length: _lc.pages.length,
          child: Builder(builder: (BuildContext context) {
            final TabController _tabController = DefaultTabController.of(context);
            var pageNum = _lc.curPageNumber;

            //регистрируем листенер, только если его нет, и переходим на страницу
            //logPrint("tabController has listeners? - ${_tabController.hasListeners}, curPage - $pageNum");
            if (!_tabController.hasListeners) {
              _tabController.addListener(() {
                if (!_tabController.indexIsChanging) {
                  //logPrint("$_tabController - $pageNum ");
                  //Обновляем номер текущей страницы в контроллере
                  _lc.curPageNumber = _tabController.index;
                }
              });
            }
            _tabController.index = pageNum;
          return Scaffold(
              appBar: AppBar(
              title: Center(
                child: Text(
                  "${StrRes.learnTitle}",
                  style: TextStyle(color: Get.textTheme.headline5.color),
              )),
              //backgroundColor: Theme.of(context).primaryColor,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                actions: [
                  Stack(children: [
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.monetization_on_outlined),
                        color: Get.textTheme.headline5.color,
                        tooltip: 'Монетки',
                        onPressed: () {
                          Get.dialog(GetMoneyDialog());
                        },
                      ),
                    ),
                    Obx(() =>
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Text("100",// _purchaseController.getCoins(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0, color: Get.textTheme.headline5.color),
                        ),
                      ),
                    )
                  ]),
                  IconButton(
                    onPressed: () {
                      Get.to(() => SettingsScreenWithBottomBar());
                    },
                    icon: const Icon(Icons.settings_rounded),
                    color: Get.textTheme.headline5.color,
                    tooltip: 'Настройки',
                  ),
                ],
                bottom: TabBar(
                  indicatorWeight: 3.0,
                  //По умолчанию берется из ThemeData.primaryTextTheme.bodyText1.textColor
                  labelColor: Get.textTheme.headline5.color,
                  unselectedLabelColor: Get.textTheme.headline5.color.withAlpha(130),
                  isScrollable: true,
                  tabs: _tabsList(),
                ),
              ),
              body: WillPopScope(
                // Обработчик нажатия на Back в андродид
                onWillPop: _onWillPop,
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
  Future<bool> _onWillPop() async {
    //logPrint("Back pressed");
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
