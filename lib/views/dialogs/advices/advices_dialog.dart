import 'package:flutter/material.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/info/advices/details/advice_image_slider.dart';
import 'package:rg2/views/shared/bottom_back_button.dart';

class AdvicesDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BigDialog(
      child: Scaffold(
        body: AdviceImageSlider(),
        bottomNavigationBar: BottomBackButton(),
      ),
    );
  }
}


