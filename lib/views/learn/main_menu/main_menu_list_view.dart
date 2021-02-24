import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
//import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'main_menu_item.dart';

class MenuList extends StatelessWidget {
  final int pageNumber;
  final _learnController = Get.find<LearnController>();
  final _settingsController = Get.find<SettingsController>();

  /// Создаем ListView для указанного номера страницы
  MenuList(this.pageNumber);

  @override
  Widget build(BuildContext context) {
    var position = _learnController.getPositionForPage(pageNumber);
    var _scrollController = ScrollController(initialScrollOffset: position);
    var _isPurchaseEnabled = _settingsController.isPurchaseEnabled;
    var _godMode = _settingsController.godMode;

    _scrollController.addListener(() {
      _learnController.curPositionInList = _scrollController.offset;
    });
    return Obx(() {
      //print("Update menu for page $pageNumber");
      var items = _learnController.pages[pageNumber].currentList;
      if (_scrollController.hasClients) {
        position = _learnController.getPositionForPage(pageNumber);
        _scrollController.jumpTo(position);
        print("jumpTo $position in ${_learnController.pages[pageNumber].currentPhase}");
      }
      return ListView(
        controller: _scrollController,
        children: items.map((listItem) =>
          MainMenuItem(
              item: listItem,
              isItemEnabled: (_isPurchaseEnabled || pageNumber < 3 || _godMode)
          )
        ).toList(),
      );
    });
  }
}
