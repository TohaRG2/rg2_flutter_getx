import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2/views/trainers/scramble_gen/model/blind_cube_support_arrays.dart';
import 'package:rg2/views/trainers/scramble_gen/view/show_scramble_text.dart';

import 'bottom_menu_bar.dart';
import 'melting_checkboxes.dart';
import 'scramble_length_selection.dart';
import 'show_blind_decision.dart';


class ScrambleGenView extends StatelessWidget {
  final ScrambleGenController _controller = Get.find();
  final String scramble;

  ScrambleGenView({this.scramble});

  @override
  Widget build(BuildContext context) {
    logPrint("ScrambleGenView");
    final title = StrRes.trainersScrambleGenTitle;
    final Color backgroundColor = Get.theme.scaffoldBackgroundColor;
    const padding = 8.0;
    var cellHeight = (Get.width - padding * 2) / 12;
    var border = 2.0;
    if (scramble != null) {
      logPrint("ScrambleGenView - executeScramble $scramble");
      _controller.executeScramble(scramble);
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(title,
              style: TextStyle(color: Get.textTheme.headline5.color),
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        body: Obx( () {
          //logPrint("Update scrambleGen Obx View");
          var coloredAzbuka = _controller.mainColoredAzbuka;
          var tableRows = _controller.asTableRows(coloredAzbuka);
          var scrambleLength = _controller.scrambleLength.toString();
          var scramble = _controller.currentScramble;
          var blindDecision = _controller.currentDecision;
          var isEdgeEnabled = _controller.isEdgeEnabled;
          var isCornerEnabled = _controller.isCornerEnabled;
          var showDecision = _controller.showDecision;
          var showDecisionText = _controller.showDecisionText;
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
                          )
                        ).toList(),
                      )
                    ).toList(),
                  ),
                  ShowBlindDecision(
                    blindDecision: blindDecision,
                    controller: _controller,
                    showDecision: showDecision,
                    showDecisionText: showDecisionText,
                  ),
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: BottomMenuBar()
    );
  }

}


