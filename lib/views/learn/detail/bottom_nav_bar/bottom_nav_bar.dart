import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/controllers/learn_detail_controller.dart';
import 'package:rg2_flutter_getx/views/dialogs/azbuka/azbuka_dialog.dart';
import 'buttons_container.dart';
import 'package:get/get.dart';

import 'bottom_nav_bar_painter.dart';

class BottomNavBar extends StatelessWidget {
  final LearnDetailController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaQuery.size;
    final iconColor = Theme.of(context).scaffoldBackgroundColor;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: size.width,
        height: 70,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            // Подложка
            CustomPaint(
              size: Size(size.width, 70),
              painter: BottomNavBarPainter(Theme.of(context).primaryColor),
            ),
            // FAB
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                  backgroundColor: Theme.of(context).accentColor,
                  foregroundColor: iconColor,
                  child: Icon(Icons.repeat),
                  elevation: 0.1,
                  onPressed: () {
                    Get.dialog(AzbukaDialog(_controller.obsPhase.value));
                  }),
            ),
            // Кнопки на подложке
            ButtonsContainer(size: size, iconColor: iconColor)
          ],
        ),
      ),
    );
  }
}

