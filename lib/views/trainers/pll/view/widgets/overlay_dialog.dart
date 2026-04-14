import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/shared/buttons_style.dart';

class PllOverlayDialog extends StatelessWidget {
  final String message;
  final String imagePath;
  final Color imageColor;
  final String buttonText;
  final String cancelButtonText;
  final VoidCallback onNext;
  final VoidCallback onCancel;

  const PllOverlayDialog({
    Key? key,
    required this.message,
    required this.imagePath,
    required this.imageColor,
    required this.buttonText,
    required this.cancelButtonText,
    required this.onNext,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: UIHelper.SpaceMedium),
        Image.asset(
          imagePath,
          width: 100,
          height: 100,
          color: imageColor,
        ),
        const SizedBox(height: UIHelper.SpaceSmall),
        Text(
          message,
          style: Get.textTheme.headlineMedium,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: UIHelper.SpaceSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: raisedButtonStyleWithPadding,
              onPressed: onCancel,
              child: Text(cancelButtonText),
            ),
            ElevatedButton(
              style: raisedAccentButtonStyleWithPadding,
              onPressed: onNext,
              child: Text(buttonText),
            ),
          ],
        ),
        const SizedBox(height: UIHelper.SpaceMedium),
      ],
    );
  }
}
