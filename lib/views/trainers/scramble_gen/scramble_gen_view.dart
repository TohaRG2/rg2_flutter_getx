import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_nav_bar.dart';

class ScrambleGenView extends StatelessWidget {
  final String title;
  final ScrambleGenController _controller = Get.find();

  ScrambleGenView({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style:
                TextStyle(color: Theme.of(context).textTheme.headline5.color),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                MeltingCheckBoxes(controller: _controller),
                ScrambleLengthSelection(controller: _controller),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Скрамбл:")),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_controller.currentScramble,
                      style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w600),
                  ),
                ),

                ShowBlindDecision(controller: _controller)
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BottomMenuBar(bottomNavBarItem: _bottomNavBarItems));
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back),
      label: "Назад",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.autorenew_rounded),
      label: "Генерировать",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Настройки",
    )
  ];
}

class ShowBlindDecision extends StatelessWidget {
  const ShowBlindDecision({
    Key key,
    @required ScrambleGenController controller,
  }) : _controller = controller, super(key: key);

  final ScrambleGenController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Решение:"),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(_controller.currentDecision),
          ),
        )
      ],
    );
  }
}

class ScrambleLengthSelection extends StatelessWidget {
  const ScrambleLengthSelection({
    Key key,
    @required ScrambleGenController controller,
  }) : _controller = controller, super(key: key);

  final ScrambleGenController _controller;

  @override
  Widget build(BuildContext context) {
    List<bool> _selections = List.generate(3, (index) => false);
    return Row(
      children: [
        Expanded(child: Center(child: Text("Длина скрамбла"))),
        ToggleButtons(children: [
            Icon(Icons.chevron_left_rounded),
            Text(_controller.scrambleLength.toString()),
            Icon(Icons.chevron_right_rounded)
          ],
          isSelected: _selections,
          onPressed: (index) {
            switch(index) {
              case 0:
                _controller.tryDecreaseScrambleLength();
                break;
              case 2:
                _controller.tryIncreaseScrambleLength();
                break;
              default:
                _controller.resetScrambleLength();
            }
          },
        ),
      ],
    );
  }
}

class MeltingCheckBoxes extends StatelessWidget {
  const MeltingCheckBoxes({
    Key key,
    @required ScrambleGenController controller,
  }) : _controller = controller, super(key: key);

  final ScrambleGenController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              title: Text("Без переплавки буфера ребер"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _controller.isEdgeEnabled,
              onChanged: (value) {
                _controller.isEdgeEnabled = value;
              }),
        ),
        Expanded(
          child: CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              title: Text("Без переплавки буфера углов"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _controller.isCornerEnabled,
              onChanged: (value) {
                _controller.isCornerEnabled = value;
              }),
        ),
      ],
    );
  }
}

class BottomMenuBar extends StatelessWidget {
  BottomMenuBar({
    Key key,
    @required List<BottomNavigationBarItem> bottomNavBarItem,
  })  : _bottomNavBarItem = bottomNavBarItem,
        super(key: key);

  final List<BottomNavigationBarItem> _bottomNavBarItem;
  final ScrambleGenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var selectedColor = Theme.of(context).scaffoldBackgroundColor;
    return BottomNavigationBar(
      items: _bottomNavBarItem,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: selectedColor,
      selectedItemColor: selectedColor,
      type: BottomNavigationBarType.fixed,
      onTap: (tappedItemIndex) {
        switch (tappedItemIndex) {
          // Нажата кнопка "Назад"
          case 0:
            Get.back();
            break;
          // Нажата кнопка "Генерировать"
          case 1:
            _controller.isEdgeEnabled = true;
            break;
          // Нажата кнопка "Настройки"
          case 2:
            _controller.isEdgeEnabled = false;
            break;
          default:
            print("WARNING!!! selected bottom item - $tappedItemIndex");
            Get.back();
        }
      },
    );
  }
}
