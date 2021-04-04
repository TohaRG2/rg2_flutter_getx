import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/pll/controller/pll_trainer_controller.dart';
import 'package:rg2/views/trainers/pll/view/settings_pll_trainer_view.dart';

class PllTrainerBottomMenuBar extends StatelessWidget {
  final PllTrainerController _controller = Get.find();
  PllTrainerBottomMenuBar({Key key,}) : super(key: key);

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
            if (_controller.exitTrainer()) Get.back();
            break;
        // Нажата кнопка "Настройки"
          case 1:
            Get.to(() => SettingsPllTrainerView(), transition: Transition.rightToLeft);
            _controller.exitTrainer();
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
      label: StrRes.timerBottomBack,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: StrRes.timerBottomSettings,
    )
  ];


}