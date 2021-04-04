import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2/views/trainers/scramble_gen/view/settings_scramble_gen_view.dart';

class BottomMenuBar extends StatelessWidget {
  BottomMenuBar({Key key,})  :  super(key: key);

  final ScrambleGenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var selectedColor = Theme.of(context).scaffoldBackgroundColor;
    return BottomNavigationBar(
      items: _bottomNavBarItems,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: selectedColor,
      selectedItemColor: selectedColor,
      type: BottomNavigationBarType.fixed,
      onTap: (tappedItemIndex) {
        switch (tappedItemIndex) {
        // Нажата кнопка "Назад"
          case 0:
            logPrint("back pressed");
            Get.back();
            break;
        // Нажата кнопка "Генерировать"
          case 1:
            _controller.generateNewScramble();
            break;
        // Нажата кнопка "Настройки"
          case 2:
            Get.to(() => ScrambleGenSettingsView(), transition: Transition.rightToLeft);
            break;
          default:
            logPrint("WARNING!!! selected bottom item - $tappedItemIndex");
            Get.back();
        }
      },
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back),
      label: StrRes.scrambleGenBottomBack,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.autorenew_rounded),
      label: StrRes.scrambleGenBottomGenerate,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: StrRes.scrambleGenBottomSettings,
    )
  ];
}