import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/timer_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/bottom_menu_bar.dart';

class TimerView extends StatelessWidget {
  final TimerController _controller = Get.find();
  final GlobalKey _keyBottomNavBar = GlobalKey();

  double _getHeight() {
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
    final Color _backgroundColor = Get.theme.scaffoldBackgroundColor;
    final Color _primaryColor = Get.theme.primaryColor;
    final Color _timeWindowsColor = Get.textTheme.headline5.color;
    final Color _borderColor = Colors.blue;
    final _width = Get.width;
    final _duration = Duration(milliseconds: 400);
    _controller.trySetBottomBarHeight(Get.mediaQuery.padding.bottom + 55);
    _controller.updateScrambleFromGenerator();
    return Obx(() {
      print("bottomHeight - ${_controller.bottomBarHeight}");
      return Stack(
        children: [
          //Фон для верхней части экрана, для телефонов с загнутыми краями (
          Positioned(top: 0, child: Container(height: 150, width: _width, color: _backgroundColor,)),
          SafeArea(
            bottom: false,
            child: Stack(fit: StackFit.expand, children: [
              scrambleTextWidget(_width),
              AnimatedPositioned(
                duration: _duration,
                top: _controller.showTopBar ? 50 : 0,
                bottom: _controller.showBottomBar ? _controller.bottomBarHeight : 0,
                child: Stack(
                  children: [
                    Container(
                      color: _borderColor,
                      width: _width,
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          _controller.showBottomBar = !_controller.showBottomBar;
                          _controller.showTopBar = !_controller.showTopBar;
                        },
                        child: Container(
                          color: _backgroundColor,
                        ),
                      ),
                  ),
                ]),
              ),
              bottomNavBar(_duration, _width, _primaryColor),
            ])
          )
        ],
      );
    });
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
                      child: Text(_controller.scramble, style: Get.textTheme.headline6, maxLines: 2,)
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
                _controller.bottomBarHeight = _getHeight();
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
