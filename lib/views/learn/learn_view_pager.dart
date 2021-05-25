import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/dialogs/advices/advices_dialog.dart';
import 'package:rg2/views/purchase/purchase_view.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/learn/controller/learn_view_controller.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';

import 'main_menu/main_menu_list_view.dart';

class LearnViewPager extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.create(() =>LearnViewController());
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
              appBar: _buildAppBar(),
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

  AppBar _buildAppBar() {
    return AppBar(
      title: Center(
          child: Text(
        "${StrRes.learnTitle}",
        style: TextStyle(color: Get.textTheme.headline5.color),
      )),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      actions: [
        _showAdvicesButton(),
        _purchaseButton(),
        _settingsButton(),
      ],
      bottom: TabBar(
        indicatorWeight: 3.0,
        //По умолчанию берется из ThemeData.primaryTextTheme.bodyText1.textColor
        labelColor: Get.textTheme.headline5.color,
        unselectedLabelColor: Get.textTheme.headline5.color.withAlpha(130),
        isScrollable: true,
        tabs: _tabsList(),
      ),
    );
  }

  Widget _showAdvicesButton() {
    return IconButton(
      onPressed: () {
        Get.dialog(AdvicesDialog());
      },
      icon: const Icon(Icons.help_outline),
      color: Get.textTheme.headline5.color,
      tooltip: 'Подсказки',
    );
  }

  Widget _settingsButton() {
    return IconButton(
        onPressed: () {
          Get.to(() => SettingsScreenWithBottomBar(), transition: Transition.cupertino);
        },
        icon: const Icon(Icons.settings_rounded),
        color: Get.textTheme.headline5.color,
        tooltip: 'Настройки',
      );
  }

  Widget _purchaseButton() {
    return Stack(children: [
        Center(
          child: IconButton(
            icon: const Icon(Icons.monetization_on_outlined),
            color: Get.textTheme.headline5.color,
            tooltip: 'Покупки',
            onPressed: () {
              Get.to(() => PurchaseView());
            },
          ),
        ),
        // Obx(() =>
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: Text(
        //     "15", //_purchaseController.getCoins(),
        //     textAlign: TextAlign.center,
        //     style: TextStyle(fontSize: 14.0, color: Get.textTheme.headline5.color),
        //   ),
        // ),
        // )
      ]);
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
    //TODO зарефакторить создание списка MenuList
    var result = <Widget>[];
    List<PageProperties> pageList = _learnController.pages;
    Map<int, PageProperties> map = pageList.asMap();
    map.forEach((key, value) {
      result.add(MenuList(key));
    });
    return result;
  }
}
