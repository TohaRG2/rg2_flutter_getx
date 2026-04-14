import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PllTrainerCounts extends StatelessWidget {
  final int wrongCount;
  final int rightCount;
  final String badIconPath;
  final String goodIconPath;

  const PllTrainerCounts({
    Key? key,
    required this.wrongCount,
    required this.rightCount,
    required this.badIconPath,
    required this.goodIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _countItem(badIconPath, wrongCount, Colors.red),
        _countItem(goodIconPath, rightCount, Colors.green),
      ],
    );
  }

  Widget _countItem(String iconPath, int count, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconPath, height: 40, color: color),
        Text(
          "$count",
          style: Get.textTheme.displaySmall,
        ),
      ],
    );
  }
}
