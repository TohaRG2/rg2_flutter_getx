import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/controller/azbuka_trainer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/azbuka_trainer/view/settings_azbuka_trainer_view.dart';

class AzbukaTrainerBottomMenuBar extends StatelessWidget {
  final AzbukaTrainerController _controller = Get.find();
  AzbukaTrainerBottomMenuBar({Key key,}) : super(key: key);

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
            //if (_controller.exitTrainer()) Get.back();
            Get.back();
            break;
        // Нажата кнопка "Настройки"
          case 1:
            Get.to(() => SettingsAzbukaTrainerView(), transition: Transition.rightToLeft);
            //_controller.exitTrainer();
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
      icon: Icon(Icons.settings),
      label: StrRes.timerBottomSettings,
    )
  ];


}