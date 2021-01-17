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
    final Size size = context.mediaQuery.size;
    const padding = 8.0;
    var cellHeight = (size.width - padding * 2) / 12;
    return Obx(() {
      var azbuka = _controller.currentAzbuka;
      var tableRows = _controller.cube.asTableRows(azbuka: azbuka);
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              R.scramble_gen_azbuka_select,
              style:
              TextStyle(color: Theme.of(context).textTheme.headline5.color),
            ),
            backgroundColor: backgroundColor,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Table(
              border: TableBorder.all(width: 3.0, color: backgroundColor),
              children: tableRows.map((row) =>
                  TableRow(
                    children: row.map((tableItem) =>
                        Container(
                          height: cellHeight,
                          color: cubeColor[tableItem.colorNumber],
                          child: Center(
                              child: Text(tableItem.letter, style: TextStyle(color: Colors.black),)
                          ),
                        )).toList(),
                  )).toList(),
            ),
          ),
          bottomNavigationBar: BottomBarWithBackButton()
      );
    });
  }
}


