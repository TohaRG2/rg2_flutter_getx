import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

class TrainersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(R.trainersTitle,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline5.color)
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Center(
          child: Text("Тут будут тренажеры"),
        )
    );
  }
}
