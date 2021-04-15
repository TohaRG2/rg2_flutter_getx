import 'package:flutter/material.dart';
import 'package:rg2/views/trainers/model/trainer_menu_item.dart';
import 'package:get/get.dart';
import 'package:rg2/views/shared/bottom_nav_bar_painter.dart';
import 'package:rg2/views/trainers/scramble_gen/view/main_scramble_gen_view.dart';

import 'buttons_container.dart';

//TODO Проверить, нужен ли этот класс? Удалить?
class BottomNavBar extends StatelessWidget {
  final TrainerMenuItem item;

  BottomNavBar({this.item});

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
                    Get.to(() => ScrambleGenView(title: item.title), transition: Transition.downToUp);
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

