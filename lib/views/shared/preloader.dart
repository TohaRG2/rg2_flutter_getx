import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
