import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/bottom_menu_bar.dart';

class TimerView extends StatelessWidget {
  final TimerController _controller = Get.find();
  final GlobalKey _keyBottomNavBar = GlobalKey();
  final Color _borderColor = Colors.blue;
  final Color _primaryColor = Get.theme.primaryColor;
  final Color _accentColor = Get.theme.accentColor;
  final Color _backgroundColor = Color.fromARGB(255, 50, 50, 50);
  final Color _timeWindowsColor = Colors.white;
  final _duration = Duration(milliseconds: 300);

  double _getBottomBarHeight() {
    if (_keyBottomNavBar.currentContext != null) {
      final RenderBox renderBoxRed = _keyBottomNavBar.currentContext
          .findRenderObject();
      final sizeRed = renderBoxRed.size;
      return sizeRed.height;
    } else {
      return 55.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = Get.width;
    _controller.trySetBottomBarHeight(Get.mediaQuery.padding.bottom + 55);
    _controller.updateScrambleFromGenerator();
    return Obx(() {
      //print("bottomHeight - ${_controller.bottomBarHeight}");
      return Stack(
        children: [
          //Фон для верхней части экрана, для телефонов с загнутыми краями (
          Positioned(top: 0, child: Container(height: 150, width: _width, color: _backgroundColor,)),
          SafeArea(
            bottom: false,
            child: Stack(fit: StackFit.expand, children: [
              scrambleTextWidget(_width),
              AnimatedPositioned(
                duration: _duration, left: 0, right: 0,
                top: _controller.showTopBar ? 50 : 0,
                bottom: _controller.showBottomBar ? _controller.bottomBarHeight : 0,
                child: Container(
                  width: _width,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      twoMainPad(),           // Выводим две основные плашки для правой и левой руки
                      Visibility(
                        visible: _controller.isOneHanded,
                        child: Container(
                          color: _borderColor,
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: _backgroundColor,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 300,
                            height: 120,
                            color: _borderColor,
                            child: Container(
                              color: _backgroundColor,
                              margin: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.circle, color: Colors.red,),
                                    Container(
                                        color: _timeWindowsColor,
                                        height: 50,
                                        width: 120,
                                        child: Center(
                                          child: Text(_controller.currentTime, 
                                            style: Get.textTheme.headline5.copyWith(color: _backgroundColor),
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
                            )
                          )
                        ],
                      )
                    ]
                  ),
                ),
              ),
              bottomNavBar(_duration, _width, _primaryColor),
            ])
          )
        ],
      );
    });
  }

  Row twoMainPad() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _controller.showBottomBar = false;
              _controller.showTopBar = false;
            },
            child: Container(
              color: _borderColor,
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5),
              height: double.infinity,
              child: Container(color: _backgroundColor),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _controller.showBottomBar = true;
              _controller.showTopBar = true;
            },
            child: Container(
              color: _borderColor,
              padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10, right: 10),
              height: double.infinity,
              child: Container(color: _backgroundColor),
            ),
          ),
        ),
      ],
    );
  }

  Positioned scrambleTextWidget(double _width) {
    return Positioned(
              width: _width,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  _controller.generateNewScrambleWithGeneratorParameters();
                },
                child: Container (
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: Text(_controller.scramble, style: Get.textTheme.headline6.copyWith(color: _accentColor), maxLines: 2,)
                  ),
                ),
              ),
            );
  }

  AnimatedPositioned bottomNavBar(Duration _duration, double _width, Color _primaryColor) {
    return AnimatedPositioned(
        duration: _duration,
        bottom: _controller.showBottomBar ? 0 : - _controller.bottomBarHeight,
        child: GetBuilder<TimerController>(
            initState: (_) {
              // Вот таким образом вызываем метод, который выполнится после отрисовки
              // виджета и обновит высоту нижней панели в контроллере, а заодно и перериует виджет
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _controller.bottomBarHeight = _getBottomBarHeight();
              });
            },
            builder: (_) {
              return Container(
                width: _width,
                color: _primaryColor,
                child: BottomMenuBar(key: _keyBottomNavBar, bottomNavBarItem: _bottomNavBarItems),
              );
            }
        )
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
