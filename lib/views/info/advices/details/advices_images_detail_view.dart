import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:rg2/views/trainers/help/bottom_bar_with_back_button.dart';

import 'advice_image_slider.dart';

/// диалог с просмотром советов по программе
///

class AdvicesImagesDetailView extends StatefulWidget {
  @override
  _AdvicesImagesDetailViewState createState() => _AdvicesImagesDetailViewState();
}

class _AdvicesImagesDetailViewState extends State<AdvicesImagesDetailView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AdviceImageSlider(),
        bottomNavigationBar: BottomBarWithBackButton(),
      )
    );
  }

}
