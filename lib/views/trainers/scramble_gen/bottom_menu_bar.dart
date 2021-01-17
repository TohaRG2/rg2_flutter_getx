import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/settings_view.dart';

class BottomMenuBar extends StatelessWidget {
  BottomMenuBar({
    Key key,
    @required List<BottomNavigationBarItem> bottomNavBarItem,
  })  : _bottomNavBarItem = bottomNavBarItem,
        super(key: key);

  final List<BottomNavigationBarItem> _bottomNavBarItem;
  final ScrambleGenController _controller = Get.find();

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
            print("back pressed");
            Get.back();
            break;
        // Нажата кнопка "Генерировать"
          case 1:
            _controller.generateNewScramble();
            break;
        // Нажата кнопка "Настройки"
          case 2:
            Get.to(ScrambleGenSettingsView(), transition: Transition.rightToLeft);
            break;
          default:
            print("WARNING!!! selected bottom item - $tappedItemIndex");
            Get.back();
        }
      },
    );
  }
}