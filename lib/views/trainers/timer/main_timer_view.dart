import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/bottom_menu_bar.dart';

import 'controller/timer_controller.dart';

class TimerView2 extends StatelessWidget {
  final TimerController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Color timeWindowsColor = Theme.of(context).textTheme.headline5.color;
    return Obx(
      () => Scaffold(
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
                          child: GestureDetector(
                            child: Container(
                              color: Colors.blue,
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  color: backgroundColor,
                              ),
                            ),
                            onTapDown: (_){
                              _controller.onLeftPanelTouch();
                            },
                            onTapUp: (_) {
                              _controller.onLeftPanelTouchCancel();
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              color: Colors.blue,
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  color: backgroundColor,
                              ),
                            ),
                            onTap: () {
                              _controller.onRightPanelTouch();
                            },
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      visible: _controller.isOneHanded,
                      child: Container(
                        color: Colors.green,
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
                                    child: Text("0:00.00", style: TextStyle(color: backgroundColor, fontSize: 22),
                                    ),
                                  )
                                ),
                                Icon(Icons.circle, color: Colors.red,),
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
        bottomNavigationBar: AnimatedContainer(
            //height:  _controller.showBottomBar ? 90 : 0,
            transform: Matrix4Transform()
                .translateOffset(_controller.showBottomBar ? Offset(0, 0) : Offset(0, 100))
                .matrix4,
            duration: Duration(milliseconds: 1000),
            child: BottomMenuBar(bottomNavBarItem: _bottomNavBarItems)
        )
      ),
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
