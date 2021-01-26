import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/bottom_menu_bar.dart';

import 'controller/timer_controller.dart';

class TimerView extends StatelessWidget {
  final TimerController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Color timeWindowsColor = Theme.of(context).textTheme.headline5.color;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Scramble"),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children:[
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              color: backgroundColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              color: backgroundColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: false,
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 120,
                        width: 300,
                        color: Colors.blue,
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.center,
                          color: backgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.circle, color: Colors.red,),
                              Container(
                                color: timeWindowsColor,
                                height: 50,
                                width: 120,
                                child: Center(
                                  child: Text("0:00.00",
                                    style: TextStyle(color: backgroundColor, fontSize: 22),
                                  ),
                                )
                              ),
                              Icon(Icons.circle),
                            ]
                          ),
                        ),
                      ),
                    Flexible(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/images/trainers/timer/left_hand.png", width: 80,),
                                Image.asset("assets/images/trainers/timer/right_hand.png", width: 80,)
                              ],
                            ),
                      ),
                    ))
                  ],
                ),
                ]
              ),
            ),
          ],
        ),
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
