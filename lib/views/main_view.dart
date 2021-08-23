import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/views/favourites/view/main_favourite.dart';
import 'package:rg2/views/info/infoScreen.dart';
import 'package:rg2/views/learn/learn_waiting_screen.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

import 'bottomNavBarItems.dart';
import 'trainers/trainers_view/trainers_screen.dart';

class MainView extends StatelessWidget {
  final SettingsController _settings = Get.find();
  final LearnController _learnController = Get.find();

  static List<Widget> _widgetOptions = <Widget>[
    LearnWaitingScreen(),
    TrainersScreen(),
    MainFavourite(),
    InfoScreen(),
    //SettingsScreen()
  ];

  onPageBuilt() {
    logPrint("onPageBuilt - ");
  }

  @override
  Widget build(BuildContext context) {
    var selectedColor = Get.theme.scaffoldBackgroundColor;
    var unSelectedColor = Get.theme.scaffoldBackgroundColor.withAlpha(130);
    // Get.dialog(AdvicesDialog())
    logPrint("onPageStartBuild ");
    _settings.checkAlwaysOnGlobal();
    return Obx(() {
      //logPrint("BottomItem = ${_settings.bottomItem}");
      return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_settings.bottomItem),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavBarItem,
            currentIndex: _settings.bottomItem,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: unSelectedColor,
            selectedItemColor: selectedColor,
            type: BottomNavigationBarType.fixed,
            onTap: (tappedItemIndex) {
              if (_settings.bottomItem == tappedItemIndex &&
                  tappedItemIndex == 0) {
                _learnController.canReturnToOnePhaseBack();
              } else {
                _settings.bottomItem = tappedItemIndex;
              }
            },
          ));
      },
    );
  }
}
