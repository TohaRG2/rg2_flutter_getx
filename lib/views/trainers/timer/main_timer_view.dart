import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/bottom_menu_bar.dart';

class TimerView extends StatelessWidget {
  final TimerController _controller = Get.find();
  final GlobalKey _keyBottomNavBar = GlobalKey();
  final Color _borderColor = Colors.blue;
  final double _borderThin = 10.0;
  final Color _primaryColor = Get.theme.primaryColor;
  final Color _accentColor = Get.theme.accentColor;
  final Color _backgroundColor = Color.fromARGB(255, 50, 50, 50);
  final Color _timeWindowsColor = Colors.white;
  final _duration = Duration(milliseconds: 300);
  final _defBottomBarHeight = 55.0;
  /// Цвета для кружков
  final Map<int, Color> _circleColors = {
    0 : Colors.red,
    1 : Colors.yellow,
    2 : Colors.green
  };

  // возвращаем размер нижнего NavBar, пока он не проинициализирован считаем, что defBottomBarHeight(55)
  double _getBottomBarHeight() {
    if (_keyBottomNavBar.currentContext != null) {
      final RenderBox renderBoxRed = _keyBottomNavBar.currentContext
          .findRenderObject();
      final sizeRed = renderBoxRed.size;
      return sizeRed.height;
    } else {
      return _defBottomBarHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = Get.width;
    _controller.trySetBottomBarHeight(Get.mediaQuery.padding.bottom + _defBottomBarHeight);
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
                      // Выводим две основные плашки для правой и левой руки
                      twoMainPad(),
                      // Перекрываем однорукой плашкой, если выбран такой режим
                      Visibility(
                        visible: _controller.isOneHanded,
                        child: Container(
                          color: _borderColor,
                          padding: EdgeInsets.all(_borderThin),
                          child: Container(
                            color: _backgroundColor,
                          ),
                        ),
                      ),
                      // Выводим время с лампочками и иконки с руками (в них реагируем на нажатия)
                      Column(
                        children: [
                          Container(
                            width: 300,
                            height: 120,
                            color: _borderColor,
                            child: Container(
                              color: _backgroundColor,
                              margin: EdgeInsets.all(_borderThin),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.circle, color: _circleColors[_controller.leftIndicatorState],),
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
                                    Icon(Icons.circle, color: _circleColors[_controller.rightIndicatorState],),
                                  ]
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Container(
                                // Делим экран на две части для срабатывания нажатий
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTapDown: (_) {
                                          _controller.onLeftPanelTouch();
                                        },
                                        onTapUp: (_) {
                                          _controller.onLeftPanelTouchCancel();
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          color: Colors.transparent,
                                          child: Center(child: Image.asset("assets/images/trainers/timer/left_hand.png", width: 80,))),
                                      )),
                                    Expanded(
                                      child: GestureDetector(
                                        onTapDown: (_) {
                                          _controller.onRightPanelTouch();
                                        },
                                        onTapUp: (_) {
                                          _controller.onRightPanelTouchCancel();
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          color: Colors.transparent,
                                          child: Center(child: Image.asset("assets/images/trainers/timer/right_hand.png", width: 80,))),
                                      ))
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
            onTapDown: (_) {
              _controller.onLeftPanelTouch();
            },
            onTapUp: (_) {
              _controller.onLeftPanelTouchCancel();
            },
            child: Container(
              color: _borderColor,
              padding: EdgeInsets.only(left: _borderThin, top: _borderThin, bottom: _borderThin, right: _borderThin / 2),
              height: double.infinity,
              child: Container(color: _backgroundColor),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (_) {
              _controller.onRightPanelTouch();
            },
            onTapUp: (_) {
              _controller.onRightPanelTouchCancel();
            },
            child: Container(
              color: _borderColor,
              padding: EdgeInsets.only(left: _borderThin / 2, top: _borderThin, bottom: _borderThin, right: _borderThin),
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
