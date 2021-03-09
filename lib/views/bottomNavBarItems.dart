import 'package:flutter/material.dart';
import 'package:rg2/res/string_values.dart';

const List<BottomNavigationBarItem> bottomNavBarItem = [
  BottomNavigationBarItem(
    icon: Icon(Icons.menu_book_rounded),
    label: StrRes.learnTitle,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.timer),
    label: StrRes.trainersTitle,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.info_outline_rounded),
    label: StrRes.infoTitle,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    label: StrRes.settingsTitle,
  ),
];