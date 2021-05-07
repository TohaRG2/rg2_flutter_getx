import 'package:flutter/material.dart';

class FullScreenPreLoader extends StatelessWidget {
  final bool isShowing;
  const FullScreenPreLoader({Key key, this.isShowing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isShowing,
        child: Container(
          color: Colors.black38,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
