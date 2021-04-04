import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_controller.dart';
import 'package:rg2/views/favourites/view/main_favourite.dart';
import 'package:rg2/views/info/infoScreen.dart';
import 'package:rg2/views/learn/learn_menu_screen.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

import 'bottomNavBarItems.dart';
import 'trainers/trainers_view/trainers_screen.dart';

class MainView extends StatelessWidget {
  //TODO заменить на GS_Controller или перенести настройку в LearnController
  final SettingsController _settings = Get.find();
  final LearnController _learnController = Get.find();

  static List<Widget> _widgetOptions = <Widget>[
    LearnScreen(),
    TrainersScreen(),
    MainFavourite(),
    InfoScreen(),
    //SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var selectedColor = Get.theme.scaffoldBackgroundColor;
    var unSelectedColor = Get.theme.scaffoldBackgroundColor.withAlpha(130);
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
