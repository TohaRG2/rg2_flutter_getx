import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
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
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(StrRes.scrambleGenAzbukaSelect, style: TextStyle(color: Get.textTheme.headline5.color),),
            ),
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
              child: buildTableAndButtons()),
          ),
          bottomNavigationBar: BottomBarWithBackButton()
      );
    });
  }

  Widget buildTableAndButtons() {
    var cubeAsTable = _controller.settingsColoredAzbuka;
    var tableRows = _controller.asTableRows(cubeAsTable);
    const padding = UIHelper.SpaceSmall;
    var cellHeight = (Get.width - padding * 2) / 12;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: cellHeight * 12,
          height: cellHeight * 9,
          child: _buildTableWithArrows(tableRows, cellHeight),
        ),
        Row(
          children: [
            _buildButton(
              text: StrRes.scrambleGenSettingsLoadMyAzbuka,
              onPressed: () {
                _controller.loadMyAzbuka();
              },
            ),
            _buildButton(
              text: StrRes.scrambleGenSettingsLoadMaximAzbuka,
              onPressed: () {
                _controller.loadMaximAzbuka();
              },
            ),
          ],
        ),
        Row(
          children: [
            _buildButton(
              text: StrRes.scrambleGenSettingsLoadCustomAzbuka,
              onPressed: () {
                _controller.loadCustomAzbuka();
              },
            ),
            _buildButton(
              text: StrRes.scrambleGenSettingsSaveCustomAzbuka,
              onPressed: () {
                _controller.saveCustomAzbuka();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton({String text, VoidCallback onPressed}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Get.theme.primaryColor,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildTableWithArrows(List<List<ColoredAzbukaItem>> tableRows, double cellHeight) {
    var border = 2.0;
    var arrowColor = Get.textTheme.headline6.color;
    return Stack(children: [
      Table(
        //border: TableBorder.all(width: 3.0, color: backgroundColor),
        children: tableRows.map((row) => 
          TableRow(   
            children: row.map((tableItem) => GestureDetector(
              child: Container(
                padding: EdgeInsets.all(border),
                color: (tableItem.colorNumber != 7) ? Colors.black87 : cubeColor[tableItem.colorNumber],
                child: Container(
                  height: cellHeight - (border * 2),
                  color: cubeColor[tableItem.colorNumber],
                  child: Center(
                      child: Text(
                    tableItem.letter,
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              onTap: () {
                if (tableItem.letter != "" && tableItem.letter != "-") {
                  //print("Нажата буква ${tableItem.letter} ${tableItem.index} ");
                  showSelectLetterDialog(tableItem);
                }
              },
            )).toList(),
          )
        ).toList(),
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
          )),
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
          )),
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
          )),
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
          )),
    ]);
  }

  void showSelectLetterDialog(ColoredAzbukaItem item) {
    _controller.selectedLetter = item.letter;
    _controller.storedLetter = item.letter;
    Get.defaultDialog(
        title: StrRes.scrambleGenSettingsSelectLetter,
        barrierDismissible: false,
        content: InputLetterDialog(),
        buttonColor: Get.theme.secondaryHeaderColor,
        textCancel: StrRes.buttonCancelText,
        cancelTextColor: Get.theme.primaryColor,
        textConfirm: StrRes.buttonOkText,
        confirmTextColor: Get.theme.accentColor,
        onConfirm: () => {
          _controller.confirmLetterSelection(item.index),
          Get.back()
        }
    );
  }


}


