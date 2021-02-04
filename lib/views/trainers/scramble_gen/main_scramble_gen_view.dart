import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/blind_cube_support_arrays.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/view/show_scramble_text.dart';

import 'view/bottom_menu_bar.dart';
import 'view/melting_checkboxes.dart';
import 'view/scramble_length_selection.dart';
import 'view/show_blind_decision.dart';


class ScrambleGenView extends StatelessWidget {
  final ScrambleGenController _controller = Get.find();
  final String title;

  ScrambleGenView({this.title});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    const padding = 8.0;
    var cellHeight = (Get.width - padding * 2) / 12;
    var border = 2.0;
    print("ScrambleGenView");
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text( title,
              style:
              TextStyle(color: Theme.of(context).textTheme.headline5.color),
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        body: Obx( () {
          //print("Update scrambleGen Obx View");
          var coloredAzbuka = _controller.mainColoredAzbuka;
          var tableRows = _controller.asTableRows(coloredAzbuka);
          var scrambleLength = _controller.scrambleLength.toString();
          var scramble = _controller.currentScramble;
          var blindDecision = _controller.currentDecision;
          var isEdgeEnabled = _controller.isEdgeEnabled;
          var isCornerEnabled = _controller.isCornerEnabled;
          var showDecision = _controller.showDecision;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MeltingCheckBoxes(isEdgeEnabled: isEdgeEnabled, isCornerEnabled: isCornerEnabled, controller: _controller),
                  ScrambleLengthSelection(scrambleLength: scrambleLength, controller: _controller),
                  ShowScrambleText(scramble: scramble),
                  Table(
                    //border: TableBorder.all(width: 0.0, color: backgroundColor),
                    children: tableRows.map((row) =>
                        TableRow(
                          children: row.map((tableItem) =>
                              Container(
                                padding: EdgeInsets.all(border),
                                color: (tableItem.colorNumber != 7) ? Colors.black87 : cubeColor[tableItem.colorNumber],
                                child: Container(
                                  height: cellHeight - (border * 2),
                                  color: cubeColor[tableItem.colorNumber],
                                ),
                              )).toList(),
                        )).toList(),
                  ),
                  ShowBlindDecision(blindDecision: blindDecision, controller: _controller, showDecision: showDecision,),
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar:
        BottomMenuBar(bottomNavBarItem: _bottomNavBarItems)
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back),
      label: R.scrambleGenBottomBack,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.autorenew_rounded),
      label: R.scrambleGenBottomGenerate,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: R.scrambleGenBottomSettings,
    )
  ];
}


