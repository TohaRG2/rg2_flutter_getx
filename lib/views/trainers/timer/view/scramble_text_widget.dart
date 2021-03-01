import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrambleTextWidget extends StatelessWidget {
  final String _text;
  final double _textRatio;
  final Function() _onTapCallBack;

  ScrambleTextWidget({String text, Function onTapCallBack, double textRatio = 1, Key key,
  })  : _text = text,
        _onTapCallBack = onTapCallBack,
        _textRatio = textRatio,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _accentColor = Get.theme.accentColor;
    final textSize = Get.textTheme.headline6.fontSize * _textRatio;
    return GestureDetector(
      onTap: () {
        _onTapCallBack();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
            child: Text(
              _text,
              style: Get.textTheme.headline6.copyWith(color: _accentColor, fontSize: textSize),
              maxLines: 2,
            )),
      ),
    );
  }
}