import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/controller/result_view_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/result_view/result_bottom_menu_bar.dart';
import 'package:rg2_flutter_getx/views/trainers/timer/view/result_view/saved_result_list_view.dart';

class TimerResultsView extends StatelessWidget {
  final ResultViewController _controller = Get.find();

  @override
  Widget build(BuildContext context) {

    // обновляем список из базы и пока не обновим, отображаем прелоадер
    final Future<void> items = _controller.updateTimeNoteItems();
    return FutureBuilder(
      future: items,
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
            return Text(StrRes.somethingWrong);
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            return _buildMainViewScaffold(context);
          default:
            return Text(StrRes.somethingWrong);
        }
    });
  }

  Scaffold _buildMainViewScaffold(BuildContext context) {
    var backgroundColor = Get.theme.scaffoldBackgroundColor;
    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          StrRes.timerResultTitle,
          style: TextStyle(color: Get.textTheme.headline5.color),
        ),
      ),
      backgroundColor: backgroundColor,
    ),
    body: Container(
        child: (_controller.timeNoteItems.length == 0)
            ? Center(
            child: Text(
              StrRes.timerResultNothing,    // Нет сохраненных результатов сборок
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.headline5,
            ))
            : SavedResultListView()
      ),

    /// Кнопки в нижней части экрана
    bottomNavigationBar: ResultBottomMenuBar(),
  );
  }
}
