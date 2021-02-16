import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/azbuka_simple_item.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/view/input_letter_dialog.dart';
import '../controller/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';

import '../model/blind_cube_support_arrays.dart';

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
    var arrowColor = Get.textTheme.headline6.color;
    var border = 2.0;
    return Obx(() {
      var cubeAsTable = _controller.settingsColoredAzbuka;
      var tableRows = _controller.asTableRows(cubeAsTable);
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                StrRes.scrambleGenAzbukaSelect,
                style: TextStyle(color: Get.textTheme.headline5.color),
              ),
            ),
            backgroundColor: backgroundColor,
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: cellHeight * 12,
                    height: cellHeight * 9,
                    child: Stack(
                      children: [
                        Table(
                        //border: TableBorder.all(width: 3.0, color: backgroundColor),
                        children: tableRows.map((row) =>
                            TableRow(
                              children: row.map((tableItem) =>
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.all(border),
                                      color: (tableItem.colorNumber != 7) ? Colors.black87 : cubeColor[tableItem.colorNumber],
                                      child: Container(
                                        height: cellHeight - (border * 2),
                                        color: cubeColor[tableItem.colorNumber],
                                        child: Center(
                                            child: Text(tableItem.letter, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),)
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      if (tableItem.letter != "" && tableItem.letter != "-") {
                                        //print("Нажата буква ${tableItem.letter} ${tableItem.index} ");
                                        showSelectLetterDialog(context, tableItem);
                                      }
                                    },
                                  )).toList(),
                            )).toList(),
                        ),
                        Positioned(
                            top: cellHeight / 2,
                            left: cellHeight / 2,
                            child: IconButton(
                              color: arrowColor,
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
                              color: arrowColor,
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
                              color: arrowColor,
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
                              color: arrowColor,
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
                              child: Text(StrRes.scrambleGenSettingsLoadMyAzbuka, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
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
                              child: Text(StrRes.scrambleGenSettingsLoadMaximAzbuka, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
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
                              child: Text(StrRes.scrambleGenSettingsLoadCustomAzbuka, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
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
                              child: Text(StrRes.scrambleGenSettingsSaveCustomAzbuka, textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
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
          ),
          bottomNavigationBar: BottomBarWithBackButton()
      );
    });
  }

  void showSelectLetterDialog(BuildContext context, ColoredAzbukaItem item) {
    _controller.selectedLetter = item.letter;
    _controller.storedLetter = item.letter;
    Get.defaultDialog(
        title: StrRes.scrambleGenSettingsSelectLetter,
        barrierDismissible: false,
        content: InputLetterDialog(),
        buttonColor: Theme.of(context).secondaryHeaderColor,
        textCancel: StrRes.buttonCancelText,
        cancelTextColor: Theme.of(context).primaryColor,
        textConfirm: StrRes.buttonOkText,
        confirmTextColor: Theme.of(context).accentColor,
        onConfirm: () => {
          _controller.confirmLetterSelection(item.index),
          Get.back()
        }
    );
  }


}


