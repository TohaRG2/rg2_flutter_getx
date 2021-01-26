import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/bottom_menu_bar.dart';

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: backgroundColor,
            child: Center(child: Text("Таймер"))),
      ),
      bottomNavigationBar: BottomMenuBar(bottomNavBarItem: _bottomNavBarItems),
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back),
      label: R.timerBottomBack,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.restore_rounded),
      label: R.timerBottomResults,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: R.timerBottomSettings,
    )
  ];

}
