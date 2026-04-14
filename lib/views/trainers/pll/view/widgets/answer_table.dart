import 'package:flutter/material.dart';
import 'package:rg2/views/shared/buttons_style.dart';

class PllAnswerTable extends StatelessWidget {
  final List<List<String>> rows;
  final Function(String) onAnswer;
  final double horizontalBorder;
  final double verticalBorder;

  const PllAnswerTable({
    Key? key,
    required this.rows,
    required this.onAnswer,
    this.horizontalBorder = 3.0,
    this.verticalBorder = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: rows
          .map(
            (row) => TableRow(
              children: row
                  .map((letter) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalBorder,
                            vertical: verticalBorder),
                        child: (letter != "")
                            ? _buildSmallButton(letter)
                            : Container(),
                      ))
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  Widget _buildSmallButton(String letter) {
    return ElevatedButton(
      style: raisedButtonStyle.copyWith(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
      onPressed: () => onAnswer(letter),
      child: Text(
        letter,
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );
  }
}
