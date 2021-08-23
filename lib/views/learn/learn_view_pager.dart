import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/advices/advices_dialog.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';
import 'package:rg2/views/learn/main_menu/main_menu_item.dart';
import 'package:rg2/views/learn/main_menu/search_menu_item.dart';
import 'package:rg2/views/purchase/purchase_view.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/learn/controller/learn_view_controller.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';

import 'main_menu/main_menu_list_view.dart';

class LearnViewPager extends GetView<LearnController> {
  final SettingsController _settings = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.create(() => LearnViewController());
    return GetBuilder<LearnController>(
      builder: (_lc) {
        return DefaultTabController(
          length: _lc.pages.length,
          child: Builder(builder: (BuildContext context) {
            final TabController _tabController = DefaultTabController.of(context);
            var pageNum = _lc.curPageNumber;

            //регистрируем листенер, в котором фиксируем переходы по страницам, только если его нет
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // строка поиска
                    _buildSearchTextField(),
                    // Три точки добавляют список в другой список
                    ...(controller.showSearchResult)
                      ? _searchResultList()
                      : _fullTabBar(_tabController),
                ],
                ),
              ),
            );
          }),
          //initialIndex: _settings.currentPageNumber.value,
        );
      }
    );
  }

  Padding _buildSearchTextField() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: controller.searchEditingController,
              focusNode: controller.searchFocusNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Get.textTheme.bodyText2.color,
                  size: 24,
                ),
                prefixIconConstraints: BoxConstraints(
                    maxWidth: 48, maxHeight: 30, minWidth: 48, minHeight: 30),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 16, right: 16, top: 4),
                hintText: StrRes.searchHint,
                isCollapsed: true,
                // isDense: true,
              ),
            ),
          ),
          IconButton(
            color: Get.textTheme.bodyText2.color,
            icon: Icon(Icons.clear),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
                maxWidth: 30, maxHeight: 30, minWidth: 30, minHeight: 30),
            onPressed: _onClearSearchPressed,
          ),
        ],
      ),
    );
  }

  _onClearSearchPressed() {
    logPrint("clear TextField");
    controller.onSearchClearButtonPressed();
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
    );
  }

  Widget _showAdvicesButton() {
    return IconButton(
      onPressed: () {
        if (controller.searchFocusNode.hasPrimaryFocus) {
          controller.searchFocusNode.unfocus();
        }
        Get.dialog(AdvicesDialog());
      },
      icon: const Icon(Icons.help_outline),
      color: Get.textTheme.headline5.color,
      tooltip: StrRes.advicesButtonTooltip,
    );
  }

  Widget _settingsButton() {
    return IconButton(
        onPressed: () {
          logPrint("settingsButton pressed");
          Get.to(() => SettingsScreenWithBottomBar(), transition: Transition.cupertino);
        },
        icon: const Icon(Icons.settings_rounded),
        color: Get.textTheme.headline5.color,
        tooltip: StrRes.settingsButtonTooltip,
      );
  }

  Widget _purchaseButton() {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.monetization_on_outlined),
        color: Get.textTheme.headline5.color,
        tooltip: StrRes.purchaseButtonTooltip,
        onPressed: () {
          if (controller.searchFocusNode.hasPrimaryFocus) {
            controller.searchFocusNode.unfocus();
          }
          Get.to(() => PurchaseView());
        },
      ),
    );
  }

  ///Возвращаем true, если надо дальше продолжать обрабатывать нажатие, т.е. выход из программы
  Future<bool> _onWillPop() async {
    logPrint("Back pressed");
    return controller.canReturnToOnePhaseBack();
  }

  List<Widget> _fullTabBar(TabController tabController) {
    return [
      TabBar(
        indicatorWeight: 3.0,
        //По умолчанию берется из ThemeData.primaryTextTheme.bodyText1.textColor
        labelColor: Get.textTheme.headline5.color,
        unselectedLabelColor: Get.textTheme.headline5.color.withAlpha(130),
        isScrollable: true,
        tabs: _tabsList(),
      ),
      Expanded(
        child: TabBarView(
          controller: tabController,
          //Прокрутка свайпами в зависимости от настроек программы
          physics: _settings.isSwipeEnabled ? null : NeverScrollableScrollPhysics(),
          children: _tabBarView(),
        ),
      ),
    ];
  }

  List<Widget> _tabsList() {
    return controller.pages
        .map((item) => Tab(
              text: item.title,
            ))
        .toList();
  }

  List<Widget> _tabBarView() {
    var result = <Widget>[];
    Map<int, PageProperties> map = controller.pages.asMap();
    map.forEach((key, value) {
      result.add(MenuList(key));
    });
    return result;
  }

  List<Widget> _searchResultList() {
     return [
       Expanded(
         child: ListView(
           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
           children: controller.searchList.map((e) =>
             SearchMenuItem(item: e, onTapCallback: _onSearchTapCallback,)
           ).toList(),
         )
       )
     ];
  }

  _onSearchTapCallback(MainDBItem item){
    logPrint("_onSearchTapCallback pressed ${item.title}");
    final isItemEnabled = item.subId == 1;
    if (isItemEnabled) {
      if (item.url == "submenu") {
        controller.changePageAndPhaseTo(item.phase);
        controller.changeCurrentPhaseWith(item);
        _onClearSearchPressed();
      } else {
        controller.saveListPositionForPhase(item.phase);
        Get.to(() => LearnDetailScreen(item.phase, item.id), transition: Transition.cupertino);
      }
    }
    // id isItemDisabled
    else {
      if (Get.isSnackbarOpen) { Get.back(); }
      Get.snackbar(StrRes.snackTextWarning, "",
        icon: Icon(Icons.warning_amber_outlined),
        messageText: Center(child: Text(StrRes.snackTextItemDisabled)),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        colorText: Colors.white,
        duration: Duration(seconds: 6),
        mainButton: TextButton(
            onPressed: (){
              // закрываем снэкбар
              Get.back();
              Get.to(() => PurchaseView());
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Перейти"))
        ),
      );
    }
  }
}
