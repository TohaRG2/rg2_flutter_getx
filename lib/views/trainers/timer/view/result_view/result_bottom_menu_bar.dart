import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/timer/controller/result_view_controller.dart';

class ResultBottomMenuBar extends StatelessWidget {
  ResultBottomMenuBar({Key key,})  :  super(key: key);

  final ResultViewController _controller = Get.find();

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
            _controller.sortTimeNoteItemsByDate();
            logPrint("Нажали сортировка по дате");
            break;
        // Нажата кнопка "Настройки"
          case 2:
            _controller.sortTimeNoteItemsBySolvingTime();
            logPrint("Нажали сортировка по результатам");
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
      label: StrRes.timerResultBottomBack,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.date_range_rounded),
      label: StrRes.timerResultBottomSortByDate,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.timer_rounded),
      label: StrRes.timerResultBottomSortBySolvingTime,
    )
  ];

}