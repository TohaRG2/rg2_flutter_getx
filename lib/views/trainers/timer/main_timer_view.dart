import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text( R.trainersTimerTitle,
            style:
            TextStyle(color: Theme.of(context).textTheme.headline5.color),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        child: Center(child: Text("Таймер")),
      ),
    );
  }
}
