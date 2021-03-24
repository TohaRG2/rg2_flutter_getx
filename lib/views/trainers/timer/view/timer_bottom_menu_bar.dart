import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/trainers/timer/view/settings_timer_view.dart';
import 'package:rg2/views/trainers/timer/view/result_view/results_view.dart';

class TimerBottomMenuBar extends StatelessWidget {
  TimerBottomMenuBar({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedColor = Get.theme.scaffoldBackgroundColor;
    return BottomNavigationBar(
      items: _bottomNavBarItems,
      backgroundColor: Get.theme.primaryColor,
      unselectedItemColor: selectedColor,
      selectedItemColor: selectedColor,
      type: BottomNavigationBarType.fixed,
      onTap: (tappedItemIndex) {
        switch (tappedItemIndex) {
        // Нажата кнопка "Назад"
          case 0:
            Get.back();
            break;
        // Нажата кнопка "Результаты"
          case 1:
            //_controller.generateNewScramble();
            Get.to(() => TimerResultsView(), transition: Transition.rightToLeft);
            print("Нажали результаты");
            break;
        // Нажата кнопка "Настройки"
          case 2:
            Get.to(() => SettingsTimerView(), transition: Transition.rightToLeft);
            print("Нажали настройки");
            break;
          default:
            print("WARNING!!! selected bottom item - $tappedItemIndex");
            Get.back();
        }
      },
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back),
      label: StrRes.timerBottomBack,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.restore_rounded),
      label: StrRes.timerBottomResults,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: StrRes.timerBottomSettings,
    )
  ];


}