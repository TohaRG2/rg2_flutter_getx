import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_detail_controller.dart';
import 'package:rg2_flutter_getx/views/learn/detail/drawer_menu_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'bottom_nav_bar/bottom_nav_bar.dart';
import 'bottom_nav_bar/bottom_nav_bar_painter.dart';
import 'view_pager/learn_detail_view_pager.dart';

class LearnDetailView extends StatelessWidget {
  final LearnDetailController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var _scrollPositionListener = ItemPositionsListener.create();
    return SafeArea(
        child: Scaffold(
            drawer: Drawer(
              child: Obx(
                () => ScrollablePositionedList.builder(
                  itemCount: _controller.currentItems.length,
                  initialScrollIndex: (_controller.curPageNumber > 2) ? _controller.curPageNumber - 2 : 0,
                  itemPositionsListener: _scrollPositionListener,
                  //itemScrollController: _itemScrollController,
                  itemBuilder: (_, index) {
                    //print("Создаем элемент сиска $pageNumber - $index");
                    return DrawerMenuItem(
                        item: _controller.currentItems[index],
                        onItemSelected: (selectedItem) {
                          print("DrawerPressed on ${selectedItem.title}");
                          _controller.changeCurrentPageByItem(selectedItem);
                          Get.back();
                        },
                    );
                  },
                ),
              ),
            ),
            drawerEnableOpenDragGesture: false,
            body: Stack(
              alignment: Alignment.topLeft,
              fit: StackFit.expand,
              children: [
                LearnDetailViewPager(),
                BottomNavBar(),
              ],
            )
        )
    );
  }
}
