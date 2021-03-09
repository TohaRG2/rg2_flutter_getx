import 'package:flutter/material.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2/res/string_values.dart';

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
              title: Text(StrRes.scrambleGenEdgeBuffer),
              controlAffinity: ListTileControlAffinity.leading,
              value: isEdgeEnabled,
              onChanged: (value) {
                _controller.isEdgeEnabled = value;
              }),
        ),
        Expanded(
          child: CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              title: Text(StrRes.scrambleGenCornerBuffer),
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