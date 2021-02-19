import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/pll_select_view/pll_algorithm_selection_item.dart';

class PllAlgorithmSelectionView extends StatelessWidget {
  final PllSettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Get.theme.bottomAppBarColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(StrRes.pllTrainerSettingsAlgorithmTitle, style: TextStyle(color: Get.textTheme.headline5.color)),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      body: Container(
        child: Column(
          children: [
            // Expanded(
            //   child: buildPllList(),
            // ),
            Row(
              children: [
                buildButton1(context, backgroundColor),
                buildButton2(context, backgroundColor),
              ],
            ),
            Row(
              children: [
                buildButton3(context, backgroundColor),
                buildButton4(context, backgroundColor),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWithBackButton(),
    );
  }

  /// Список PLL алгоритмов
  Widget buildPllList() {
    var _scrollController = ScrollController();
    return Obx(() {
      var items = _controller.pllTrainerItems;
      return ListView(
        controller: _scrollController,
        children: items.map((pllTrainerItem) =>
          PllAlgorithmSelectionItem(item: pllTrainerItem),
        ).toList(),
      );
    });
  }

  /// Кнопка Стандартные названия
  Widget buildButton1(BuildContext context, Color backgroundColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            print("Стандартные названия");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: Text(
              StrRes.pllTrainerSettingsAlgorithmButton1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: backgroundColor),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }


  /// Кнопка Максимкины названия
  Widget buildButton2(BuildContext context, Color backgroundColor) {
    return Expanded(
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            print("Максимкины названия");
          },
          child: Container(
            //padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              StrRes.pllTrainerSettingsAlgorithmButton2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: backgroundColor),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  /// Кнопка Сохранить текущие
  Widget buildButton3(BuildContext context, Color backgroundColor) {
    return Expanded(
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            print("Сохранить текущие");
          },
          child: Container(
            //padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(StrRes.pllTrainerSettingsAlgorithmButton3,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: backgroundColor),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  /// Кнопка Загрузить сохраненные
  Widget buildButton4(BuildContext context, Color backgroundColor) {
    return Expanded(
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            print("Загрузить сохраненные");
          },
          child: Container(
            //padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(StrRes.pllTrainerSettingsAlgorithmButton4,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: backgroundColor),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }


}
