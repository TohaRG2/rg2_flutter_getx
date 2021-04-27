import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigDialog extends StatelessWidget {
  final Widget child;

  BigDialog({this.child});

  @override
  Widget build(BuildContext context) {
    return _showDialog(context);
  }

  Widget _showDialog(BuildContext context) {
    return SafeArea(
      child: Center(
        // Чтобы Scaffold не спрямил закругленные углы, засовываем его в контейнер с полями (margin)
        child: Container(
          width: Get.width - 50,
          height: Get.height - 50,
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: child
          ),
        ),
      ),
    );
  }

}