import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/trainers/timer/controller/timer_controller.dart';
import 'package:rg2/views/trainers/timer/view/icon_with_text_widget.dart';
import 'package:rg2/views/trainers/timer/view/timer_bottom_menu_bar.dart';
import 'package:rg2/views/trainers/timer/view/scramble_text_widget.dart';
import 'package:rg2/views/trainers/timer/controller/timer_settings_controller.dart';

class TimerView extends StatelessWidget {
  final TimerController _controller = Get.find();
  // final ScrambleGenController _genController = Get.find();
  final TimerSettingsController _settingsController = Get.find();
  final _textController = TextEditingController();

  // переменная, позволяющая идентифицировать bottomNavBar
  final GlobalKey _keyBottomNavBar = GlobalKey();
  // цвет рамки
  final Color _borderColor = Colors.blue;
  // толщина рамки
  final double _borderThin = 10.0;
  // цвет кнопок нижней панели bottomNavBar
  final Color _primaryColor = Get.theme.primaryColor;
  // цвет подложки
  final Color _backgroundColor = Color.fromARGB(255, 50, 50, 50);
  // цвет окошка в котором выводится время
  final Color _timeWindowsColor = Colors.white;
  // время анимации скрытия/отображения нижней панели и скрамбла
  final _animationDuration = Duration(milliseconds: 300);
  // считаем, что такова высота нижней панели, пока ее не отобразили на реальном устройстве. Реальная будет +/- 3 пикс.
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
      final RenderBox renderBottomNavBar = _keyBottomNavBar.currentContext.findRenderObject();
      final navBarSize = renderBottomNavBar.size;
      return navBarSize.height;
    } else {
      return _defBottomBarHeight;
    }
  }

  _generateNewScrambleByTap() {
    _controller.generateNewScramble();
  }

  @override
  Widget build(BuildContext context) {
    final _width = Get.width;
    // изначально задаем размер нижней панели как Default + padding для SafeArea
    _controller.trySetBottomBarHeight(Get.mediaQuery.padding.bottom + _defBottomBarHeight);
    _controller.initialization();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Obx(() {
        //print("bottomHeight - ${_controller.bottomBarHeight}");
        return Stack(
          children: [
            //Фон для верхней части экрана, для телефонов с загнутыми краями (
            Positioned(top: 0, child: Container(height: 150, width: _width, color: _backgroundColor,)),
            SafeArea(
              bottom: false,
              child: Stack(fit: StackFit.expand, children: [
                /// Скрамбл в верхней части экрана
                Positioned(
                  width: Get.width,
                  height: _settingsController.scrambleBarHeight,
                  child: ScrambleTextWidget(
                    text: _controller.scramble,
                    textRatio: _settingsController.scrambleTextRatio,
                    onTapCallBack: _generateNewScrambleByTap,
                  ),
                ),

                AnimatedPositioned(
                  duration: _animationDuration, left: 0, right: 0,
                  top: (_controller.showTopBar && _settingsController.showScramble) ? _settingsController.scrambleBarHeight : 0,
                  bottom: _controller.showBottomBar ? _controller.bottomBarHeight : 0,
                  child: Container(
                    width: _width,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        /// Выводим две плашки для правой и левой руки, которые срабатывают только справа
                        /// и слева от счетчика времени, т.к. ниже перекрываются другими плашками
                        _twoMainPad(),

                        /// Перекрываем однорукой плашкой, если выбран такой режим
                        Visibility(
                          visible: _settingsController.isOneHanded,
                          child: Container(
                            color: _borderColor,
                            padding: EdgeInsets.all(_borderThin),
                            child: Container(
                              color: _backgroundColor,
                            ),
                          ),
                        ),

                        /// Выводим время с лампочками и иконки с руками (в них реагируем на нажатия)
                        Column(
                          children: [
                            /// Верхний контейнер в котором отображается время и индикаторы
                            GestureDetector(
                              onTap: () {
                                _controller.onTopPanelTap();
                              },
                              child: Container(
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
                            ),

                            /// Две основные плашки нажатия на которые обрабатываем (даже в одноруком режиме)
                            TwoMainPadsWidget(controller: _controller)
                          ],
                        ),
                        /// Нижняя панель с вариантами действий после остановки таймера
                        Visibility(
                          visible: _controller.showSaveResultBar,
                          child: Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Material(
                              child: Container(
                                width: double.infinity,
                                color: _backgroundColor,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(bottom: UIHelper.SpaceSmall),
                                      child: Text(StrRes.timerSaveResultText,
                                          style: Get.textTheme.headline6.copyWith(
                                            fontSize: 18,
                                            color: Colors.white,)
                                      ),
                                    ),
                                    ToggleButtons(
                                      isSelected: [false, false, false],
                                      children: [
                                        IconWithTextWidget(
                                           icon: Icons.delete_forever_rounded,
                                           text: StrRes.timerSaveResultDontSave,
                                           color: _settingsController.isIconsColored ? Colors.red : Colors.white,),
                                        IconWithTextWidget(
                                           icon: Icons.assignment_turned_in_rounded,
                                           text: StrRes.timerSaveResultWithoutComment,
                                           color: _settingsController.isIconsColored ? Colors.yellow : Colors.white,),
                                        IconWithTextWidget(
                                           icon: Icons.textsms_rounded,
                                           text: StrRes.timerSaveResultWithComment,
                                           color: _settingsController.isIconsColored ? Colors.green : Colors.white,),
                                      ],
                                      onPressed: (index) {
                                        if (index == 0) {
                                          _controller.cancelSavingResult();
                                        } else if (index == 1) {
                                          _controller.saveCurrentResult();
                                        } else if (index == 2) {
                                          _tryToSaveCurrentResultWithComment();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                ),
                              ),
                            ),
                        ),
                      ]
                    ),
                  ),
                ),

                /// Нижний навбар с кнопками (назад, результаты, настройки)
                _bottomNavBar(_animationDuration, _primaryColor),
              ])
            )
          ],
        );
      }),
    );
  }

  //Возвращаем true, если надо дальше продолжать обрабатывать нажатие, т.е. выход из таймера
  Future<bool> _onWillPop() async {
    //print("Back pressed");
    return _controller.onBackButtonPressed();
  }

  _tryToSaveCurrentResultWithComment() {
    Get.defaultDialog(
      title: StrRes.timerEditResultComment,
      content: Container(
        child: Padding(
          padding: const EdgeInsets.all(UIHelper.SpaceMedium),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: StrRes.timerEditResultHint,
                ),
                maxLines: 3,
                controller: _textController,
              ),
            ],
          ),
        ),
      ),
      /// Кнопки
      buttonColor: Get.theme.secondaryHeaderColor,
      textCancel: StrRes.buttonCancelText,
      cancelTextColor: Get.theme.primaryColor,
      textConfirm: StrRes.buttonOkText,
      confirmTextColor: Get.theme.accentColor,
      onConfirm: () => {
        _controller.saveCurrentResultWithComment(_textController.text),
        _textController.text = "",
        Get.back()
      }
    );

  }

  Row _twoMainPad() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTapDown: (_) {
              _controller.onLeftPanelTouch();
            },
            onTapCancel: () {
              _controller.onLeftPanelTouchCancel();
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
            onTapCancel: () {
              _controller.onRightPanelTouchCancel();
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

  AnimatedPositioned _bottomNavBar(Duration _duration, Color _primaryColor) {
    return AnimatedPositioned(
      duration: _duration,
      bottom: _controller.showBottomBar ? 0 : -_controller.bottomBarHeight,
      child: GetBuilder<TimerController>(initState: (_) {
        // Вот таким образом вызываем метод, который выполнится после отрисовки
        // виджета и обновит высоту нижней панели в контроллере, а заодно и перериует виджет
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _controller.bottomBarHeight = _getBottomBarHeight();
        });
      }, builder: (_) {
        return Container(
          width: Get.width,
          color: _primaryColor,
          child: TimerBottomMenuBar(
            key: _keyBottomNavBar,
          ),
        );
      }));
  }

}

class TwoMainPadsWidget extends StatelessWidget {
  const TwoMainPadsWidget({
    Key key,
    @required TimerController controller,
  }) : _controller = controller, super(key: key);

  final TimerController _controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                  onTapCancel: () {
                    _controller.onLeftPanelTouchCancel();
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
                  onTapCancel: () {
                    _controller.onRightPanelTouchCancel();
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
    );
  }
}



