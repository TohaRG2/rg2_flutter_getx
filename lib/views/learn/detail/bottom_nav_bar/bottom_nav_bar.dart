import 'package:flutter/material.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/views/dialogs/azbuka/azbuka_dialog.dart';
import 'buttons_container.dart';
import 'package:get/get.dart';

import '../../../shared/bottom_nav_bar_painter.dart';

///
/// Диалог отображения азбуки вращений, не путать с азбукой блайндов
///
class BottomNavBar extends StatelessWidget {
  final LearnDetailController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final iconColor = Get.theme.scaffoldBackgroundColor;
    return Container(
      width: width,
      height: 70,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          /// Подложка
          CustomPaint(
            size: Size(width, 70),
            painter: BottomNavBarPainter(Theme.of(context).primaryColor),
          ),
          /// Кнопки на подложке
          ButtonsContainer(width: width, iconColor: iconColor),
          /// FAB
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                foregroundColor: iconColor,
                child: Icon(Icons.repeat),
                elevation: 0.1,
                onPressed: () {
                  Get.dialog(AzbukaDialog(_controller.obsPhase));
                }),
          )
        ],
      ),
    );
  }
}

