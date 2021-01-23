import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/blind_cube_support_arrays.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';

class ScrambleGenSettingsView extends StatelessWidget {
  final ScrambleGenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    Color getColorByNumber(int number) {
      // если поставить 8, то при нажатии на кнопки вращений кубика будет видна сетка
      // т.е. выбираем оставляем клетки прозрачными (number = 7) или меняем цвет фона на backgroundColor
      return (number < 6) ? cubeColor[number] : backgroundColor;
    }

    final Size size = context.mediaQuery.size;
    const padding = 8.0;
    var cellHeight = (size.width - padding * 2) / 12;
    _controller.settingsCube.resetCube();
    return Obx(() {
      var cubeAsTable = _controller.settingsColoredAzbuka;
      var tableRows = _controller.asTableRows(cubeAsTable);
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                R.scramble_gen_azbuka_select,
                style: TextStyle(color: Theme.of(context).textTheme.headline5.color),
              ),
            ),
            backgroundColor: backgroundColor,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              children: [
                Container(
                  width: cellHeight * 12,
                  height: cellHeight * 9,
                  child: Stack(
                    children: [
                      Table(
                      border: TableBorder.all(width: 3.0, color: backgroundColor),
                      children: tableRows.map((row) =>
                          TableRow(
                            children: row.map((tableItem) =>
                                GestureDetector(
                                  child: Container(
                                    height: cellHeight,
                                    color: getColorByNumber(tableItem.colorNumber),
                                    child: Center(
                                        child: Text(tableItem.letter, style: TextStyle(color: Colors.black),)
                                    ),
                                  ),
                                  onTap: () {
                                    if (tableItem.letter != "" && tableItem.letter != "-") {
                                      print("Нажата какая-то буква");
                                    }
                                  },
                                )).toList(),
                          )).toList(),
                      ),
                      Positioned(
                          top: cellHeight / 2,
                          left: cellHeight / 2,
                          child: IconButton(
                            color: Theme.of(context).primaryColor,
                            iconSize: cellHeight * 1.5,
                            icon: Icon(Icons.arrow_back_rounded),
                            onPressed: () {
                              _controller.leftArrowButtonPressed();
                            },
                          )
                      ),
                      Positioned(
                          top: cellHeight / 2,
                          left: cellHeight * 6.5,
                          child: IconButton(
                            color: Theme.of(context).primaryColor,
                            iconSize: cellHeight * 1.5,
                            icon: Icon(Icons.arrow_forward_rounded),
                            onPressed: () {
                              _controller.rightArrowButtonPressed();
                            },
                          )
                      ),
                      Positioned(
                          top: cellHeight * 6.5,
                          left: cellHeight / 2,
                          child: IconButton(
                            color: Theme.of(context).primaryColor,
                            iconSize: cellHeight * 1.5,
                            icon: Icon(Icons.subdirectory_arrow_right_rounded),
                            onPressed: () {
                              _controller.antiClockWiseArrowButtonPressed();
                            },
                          )
                      ),
                      Positioned(
                          top: cellHeight * 6.5,
                          left: cellHeight * 6.5,
                          child: IconButton(
                            color: Theme.of(context).primaryColor,
                            iconSize: cellHeight * 1.5,
                            icon: Icon(Icons.subdirectory_arrow_left_rounded),
                            onPressed: () {
                              _controller.clockWiseArrowButtonPressed();
                            },
                          )
                      ),
                    ]
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _controller.loadMyAzbuka();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(R.scrambleGenSettingsLoadMyAzbuka, textAlign: TextAlign.center,),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _controller.loadMaximAzbuka();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(R.scrambleGenSettingsLoadMaximAzbuka, textAlign: TextAlign.center,),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _controller.loadCustomAzbuka();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(R.scrambleGenSettingsLoadCustomAzbuka, textAlign: TextAlign.center,),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            _controller.saveCustomAzbuka();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(R.scrambleGenSettingsSaveCustomAzbuka, textAlign: TextAlign.center,),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomBarWithBackButton()
      );
    });
  }


}


