import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/ads/ad_show_controller.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/drawer_menu_item.dart';

import 'bottom_nav_bar/bottom_nav_bar.dart';
import 'view_pager/learn_detail_view_pager.dart';

class LearnDetailView extends StatelessWidget {
  final LearnDetailController _controller = Get.find();
  final _duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildDrawer(),
        drawerEnableOpenDragGesture: false,
        body: Stack(
          alignment: Alignment.topLeft,
          fit: StackFit.expand,
          children: [
            LearnDetailViewPager(),
            /// Закомментировать, чтобы сделать уезжающий при скролле bottomNavBar
            Positioned(
              bottom: 0,
                child: BottomNavBar()
            ),
            /// Раскомментировать, чтобы сделать уезжающий при скролле bottomNavBar
            // Obx(() =>
            //   AnimatedPositioned(
            //     duration: _duration,
            //     bottom: _controller.isBottomBarShowing ? 0 : -80,
            //     child: BottomNavBar(),
            //   ),
            // ),
          ],
        ));
  }

  Drawer _buildDrawer() {
    return Drawer(
        child: Obx(() {
          //TODO перенести ScrollController в _controller
          final items = _controller.currentItems;
          var intPosition = (_controller.curPageNumber > 2) ? _controller.curPageNumber - 2 : 0;
          // высчитаем смещение в пикселях для заданной позиции
          var offset = intPosition.toDouble() * 81;
          var _scrollController = ScrollController(initialScrollOffset: offset);
          logPrint("Offset $intPosition - $offset");
          // TODO попрбовать ListView.builder
          return ListView(
            controller: _scrollController,
            children: items.map((listItem) =>
              DrawerMenuItem(
                item: listItem,
                onItemSelected: (selectedItem) {
                  logPrint("DrawerPressed on ${selectedItem.title}");
                  _controller.changeCurrentPageByItem(selectedItem);
                  Get.back();
                },
              )
            ).toList(),
          );
        }),
      );
  }
}
