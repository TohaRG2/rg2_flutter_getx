import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/blind_cube_support_arrays.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/input_scramble_dialog.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/show_scramble_text.dart';


class ScrambleGenView extends StatelessWidget {
  final String title;
  final ScrambleGenController _controller = Get.find();

  ScrambleGenView({this.title});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Size size = context.mediaQuery.size;
    const padding = 8.0;
    var cellHeight = (size.width - padding * 2) / 12;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style:
            TextStyle(color: Theme.of(context).textTheme.headline5.color),
          ),
          backgroundColor: backgroundColor,
        ),
        body: Obx( () {
          var tableRows = _controller.cube.asTableRows();
          var scrambleLength = _controller.scrambleLength.toString();
          var scramble = _controller.currentScramble;
          var blindDecision = _controller.currentDecision;
          var isEdgeEnabled = _controller.isEdgeEnabled;
          var isCornerEnabled = _controller.isCornerEnabled;
          var showDecision = _controller.showDecision;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              children: [
                MeltingCheckBoxes(isEdgeEnabled: isEdgeEnabled, isCornerEnabled: isCornerEnabled, controller: _controller),
                ScrambleLengthSelection(scrambleLength: scrambleLength, controller: _controller),
                ShowScrambleText(scramble: scramble),
                Table(
                  border: TableBorder.all(width: 3.0, color: backgroundColor),
                  children: tableRows.map((row) =>
                      TableRow(
                        children: row.map((tableItem) =>
                            Container(
                              height: cellHeight,
                              color: cubeColor[tableItem.color],
                            )).toList(),
                      )).toList(),
                ),
                ShowBlindDecision(blindDecision: blindDecision, controller: _controller, showDecision: showDecision,),
              ],
            ),
          );
        }),
        bottomNavigationBar:
        BottomMenuBar(bottomNavBarItem: _bottomNavBarItems));
  }


  //TODO Вынести текстовки в отдельный файл
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

class MeltingCheckBoxes extends StatelessWidget {
  const MeltingCheckBoxes({
    Key key,
    @required this.isEdgeEnabled,
    @required ScrambleGenController controller,
    @required this.isCornerEnabled,
  }) : _controller = controller, super(key: key);

  final bool isEdgeEnabled;
  final ScrambleGenController _controller;
  final bool isCornerEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              title: Text("Без переплавки буфера ребер"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isEdgeEnabled,
              onChanged: (value) {
                _controller.isEdgeEnabled = value;
              }),
        ),
        Expanded(
          child: CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              title: Text("Без переплавки буфера углов"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isCornerEnabled,
              onChanged: (value) {
                _controller.isCornerEnabled = value;
              }),
        ),
      ],
    );
  }
}

class ShowBlindDecision extends StatelessWidget {
  final String blindDecision;
  final bool showDecision;
  final ScrambleGenController _controller;

  const ShowBlindDecision({Key key,
    @required ScrambleGenController controller,
    @required this.blindDecision,
    @required this.showDecision,
  }) : _controller = controller, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 10.0 ),
            child: Text("Решение для сборки вслепую:")),
        CheckboxListTile(
            contentPadding: const EdgeInsets.all(0.0),
            title: Text(blindDecision),
            controlAffinity: ListTileControlAffinity.leading,
            value: showDecision,
            onChanged: (value) {
              _controller.showDecision = value;
            }),
      ],
    );
  }
}

class ScrambleLengthSelection extends StatelessWidget {
  const ScrambleLengthSelection({
    Key key,
    @required this.scrambleLength,
    @required ScrambleGenController controller,
  }) : _controller = controller, super(key: key);

  final String scrambleLength;
  final ScrambleGenController _controller;

  @override
  Widget build(BuildContext context) {
    final List<bool> _selections = List.generate(3, (index) => false);
    return Row(
      children: [
        Expanded(child: Center(child: Text("Длина скрамбла"))),
        ToggleButtons(
          children: [
            Icon(Icons.chevron_left_rounded),
            Text(scrambleLength),
            Icon(Icons.chevron_right_rounded)
          ],
          isSelected: _selections,
          onPressed: (index) {
            switch (index) {
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
            _controller.generateNewScramble();
            break;
        // Нажата кнопка "Настройки"
          case 2:
          //_controller.isEdgeEnabled = false;
            break;
          default:
            print("WARNING!!! selected bottom item - $tappedItemIndex");
            Get.back();
        }
      },
    );
  }
}
