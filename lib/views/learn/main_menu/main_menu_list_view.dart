import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';

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
    var _isGodModeEnabled = _settingsController.godMode;

    _scrollController.addListener(() {
      _learnController.curPositionInList = _scrollController.offset;
    });
    return Obx(() {
      //logPrint("Update menu for page $pageNumber");
      var items = _learnController.pages[pageNumber].currentList;
      if (_scrollController.hasClients) {
        position = _learnController.getPositionForPage(pageNumber);
        _scrollController.jumpTo(position);
        logPrint("jumpTo $position in ${_learnController.pages[pageNumber].currentPhase}");
      }
      var isItemEnabled = (_isPurchaseEnabled || pageNumber < 2 || (pageNumber < 4 && Platform.isAndroid) || _isGodModeEnabled);
      return ListView(
        controller: _scrollController,
        children: items.map((listItem) =>
          MainMenuItem(
              item: listItem,
              isItemEnabled: isItemEnabled,
              onTapCallback: _onTapCallBack,
          )
        ).toList(),
      );
    });
  }

  _onTapCallBack(MainDBItem item, bool isItemEnabled) {
    logPrint("Tap on mainMenu $item");
    if (isItemEnabled) {
      if (item.url == "submenu") {
        _learnController.changeCurrentPhaseWith(item);
      } else {
        _learnController.saveListPositionForPhase(item.phase);
        Get.to(() => LearnDetailScreen(item.phase, item.id),
            transition: Transition.fadeIn);
      }
    } else {
      if (Get.isSnackbarOpen) { Get.back(); }
      Get.snackbar(StrRes.snackTextWarning, "",
        icon: Icon(Icons.warning_amber_outlined),
        messageText: Center(child: Text(StrRes.snackTextItemDisabled)),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        duration: Duration(seconds: 6),
        mainButton: TextButton(
            onPressed: (){
              // закрываем снэкбар
              Get.back();
              //TODO сделать переход с прокруткой к определенному пункту в настройках
              Get.to(() => SettingsScreen(), transition: Transition.downToUp);
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Перейти"))
        ),
      );
    }
  }

}
