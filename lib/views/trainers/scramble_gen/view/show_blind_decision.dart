import 'package:flutter/material.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2/res/string_values.dart';

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
            child: Text(StrRes.scrambleGenBlindDecision)),
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
