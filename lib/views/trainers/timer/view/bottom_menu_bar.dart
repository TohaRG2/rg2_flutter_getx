import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_controller.dart';

class BottomMenuBar extends StatelessWidget {
  BottomMenuBar({
    Key key,
    @required List<BottomNavigationBarItem> bottomNavBarItem,
  })  : _bottomNavBarItem = bottomNavBarItem,
        super(key: key);

  final List<BottomNavigationBarItem> _bottomNavBarItem;
  final TimerController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var selectedColor = Theme.of(context).scaffoldBackgroundColor;
    return BottomNavigationBar(
      items: _bottomNavBarItem,
      backgroundColor: Theme.of(context).primaryColor,
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
            print("Нажали результаты");
            break;
        // Нажата кнопка "Настройки"
          case 2:
            //Get.to(ScrambleGenSettingsView(), transition: Transition.rightToLeft);
            print("Нажали настройки");
            break;
          default:
            print("WARNING!!! selected bottom item - $tappedItemIndex");
            Get.back();
        }
      },
    );
  }
}