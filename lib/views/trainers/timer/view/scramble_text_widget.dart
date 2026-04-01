import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrambleTextWidget extends StatelessWidget {
  final String _text;
  final double _textRatio;
  final VoidCallback? _onTapCallBack;

  const ScrambleTextWidget({
    Key? key,
    required String text,
    VoidCallback? onTapCallBack,
    double textRatio = 1,
  })  : _text = text,
        _onTapCallBack = onTapCallBack,
        _textRatio = textRatio,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color accentColor = Get.theme.colorScheme.secondary;
    final baseSize = Get.textTheme.titleMedium?.fontSize ?? 20.0;
    final textSize = baseSize * _textRatio;
    return GestureDetector(
      onTap: () {
        _onTapCallBack?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
            child: Text(
          _text,
          style: Get.textTheme.titleMedium
              ?.copyWith(color: accentColor, fontSize: textSize),
          maxLines: 2,
        )),
      ),
    );
  }
}
