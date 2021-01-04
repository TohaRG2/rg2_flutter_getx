import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/controllers/settingsController.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'main_menu_item.dart';

class MenuList extends StatelessWidget {
  final int pageNumber;
  final _learnController = Get.find<LearnController>();
  final _settingsController = Get.find<SettingsController>();

  /// Создаем ListView для указанного номера страницы
  MenuList(this.pageNumber);

  @override
  Widget build(BuildContext context) {
    var _isPurchaseEnabled = _settingsController.isPurchaseEnabled.value;
    var _itemScrollController = ItemScrollController();
    var _scrollPositionListener = ItemPositionsListener.create();
    _scrollPositionListener.itemPositions.addListener(() {
      var positions = _scrollPositionListener.itemPositions.value;
      var min = 0;
      if (positions.isNotEmpty) {
        // Determine the first visible item by finding the item with the
        // smallest trailing edge that is greater than 0.  i.e. the first
        // item whose trailing edge in visible in the viewport.
        min = positions
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .reduce((ItemPosition min, ItemPosition position) =>
                position.itemTrailingEdge < min.itemTrailingEdge
                    ? position
                    : min)
            .index;
      }
      _learnController.curPositionInList = min;
    });
    return Obx(() {
      var position = 0;
      var align = 0.0;

      var asd = ScrollablePositionedList.builder(
        itemCount: _learnController.pages[pageNumber].currentList.length,
        itemBuilder: (_, index) {
          return MainMenuItem(
              item: _learnController.pages[pageNumber].currentList[index],
              //если программа не куплена, то вкладки от 3 и дальше заблокированы
              isItemEnabled: (_isPurchaseEnabled || pageNumber < 3)
          );
          //print("Создаем элемент сиска $pageNumber - $index");
        },
        initialScrollIndex: position,
        itemPositionsListener: _scrollPositionListener,
        itemScrollController: _itemScrollController,
      );
      if (_itemScrollController.isAttached) {
        position = _learnController.getPositionForPage(pageNumber);
        align = (position == 0) ? 0.0 : -0.03;
        _itemScrollController.jumpTo(index: position, alignment: align);
        //TODO Подумать, как перейти к записи, которой еще нет, т.к. список не пересоздался
        print("try jumpTo $position");
      }
      return Center(
        child: asd
      );
    });
  }
}
