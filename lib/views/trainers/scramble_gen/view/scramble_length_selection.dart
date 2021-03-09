import 'package:flutter/material.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2/res/string_values.dart';

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
        Expanded(child: Center(child: Text(StrRes.scrambleGenScrambleLength))),
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