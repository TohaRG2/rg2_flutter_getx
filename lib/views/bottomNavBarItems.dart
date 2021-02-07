import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

const List<BottomNavigationBarItem> bottomNavBarItem = [
  BottomNavigationBarItem(
    icon: Icon(Icons.menu_book_rounded),
    label: R.learnTitle,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.timer),
    label: R.trainersTitle,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_outline_rounded),
    label: R.infoTitle,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    label: R.settingsTitle,
  ),
];