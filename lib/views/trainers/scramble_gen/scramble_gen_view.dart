import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/trainers_scramble_gen_controller.dart';
import 'package:rg2_flutter_getx/models/scramble_gen/blind_cube_support_arrays.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/input_scramble_dialog.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/show_scramble_text.dart';

import 'bottom_menu_bar.dart';
import 'melting_checkboxes.dart';
import 'scramble_length_selection.dart';
import 'show_blind_decision.dart';


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

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back),
      label: R.scramble_gen_bottom_back,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.autorenew_rounded),
      label: R.scramble_gen_bottom_generate,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: R.scramble_gen_bottom_settings,
    )
  ];
}


