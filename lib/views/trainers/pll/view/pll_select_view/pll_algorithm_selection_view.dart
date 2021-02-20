import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/database/entitys/pll_trainer_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/controller/pll_settings_controller.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/view/pll_select_view/pll_algorithm_selection_item.dart';

class PllAlgorithmSelectionView extends StatelessWidget {
  final PllSettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.loadPllTrainerItems();
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
            Expanded(
              child: buildPllList(),
            ),
            SizedBox(height: UIHelper.SpaceMini,),
            Row(
              children: [
                buildButton(text: StrRes.pllTrainerSettingsAlgorithmButton1, onPressed: _controller.selectInternationalNames),
                buildButton(text: StrRes.pllTrainerSettingsAlgorithmButton2, onPressed: _controller.selectMaximNames),
              ],
            ),
            Row(
              children: [
                buildButton(text: StrRes.pllTrainerSettingsAlgorithmButton3, onPressed: _controller.saveCurrentNames),
                buildButton(text: StrRes.pllTrainerSettingsAlgorithmButton4, onPressed: _controller.selectCustomNames),
              ],
            ),
            SizedBox(height: UIHelper.SpaceMini,)
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
          PllAlgorithmSelectionItem(item: pllTrainerItem, onCheckBoxChange: _onCheckBoxChange, onTap: _onTapItem,),
        ).toList(),
      );
    });
  }

  /// Колбэк вызываемый при нажатии на чекбокс
  /// на входе новое значение чекбокса и элемент для которого он изменен
  _onCheckBoxChange(bool value, PllTrainerItem pllTrainerItem) {
    pllTrainerItem.isChecked = value;
    _controller.updatePllTrainerItem(pllTrainerItem);
  }

  ///Колбэк вызваемый при нажатии на саму запись (изменяем текущее название)
  _onTapItem(PllTrainerItem pllTrainerItem){
    //print(pllTrainerItem);
    showEditCommentDialog(pllTrainerItem);
  }

  /// Кнопка c надписью и колбэком
  Widget buildButton({String text, Function onPressed}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
        child: FlatButton(
          color: Get.theme.primaryColor,
          onPressed: () {
            onPressed();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: UIHelper.SpaceMini),
            child: Text(text,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Get.theme.bottomAppBarColor),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  showEditCommentDialog(PllTrainerItem item) {
    var _textController = TextEditingController();
    _textController.text = item.currentName;
    return Get.defaultDialog(
        title: StrRes.timerResultEditItemTitle,
        content: Container(
          child: Padding(
            padding: const EdgeInsets.all(UIHelper.SpaceMedium),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: StrRes.timerEditResultHint,
                  ),
                  maxLines: 2,
                  controller: _textController,
                ),
              ],
            ),
          ),
        ),
        buttonColor: Get.theme.secondaryHeaderColor,

        /// Кнопка Отмена
        textCancel: StrRes.buttonCancelText,
        cancelTextColor: Get.theme.primaryColor,

        /// Кнопка ОК
        textConfirm: StrRes.buttonOkText,
        confirmTextColor: Get.theme.accentColor,
        onConfirm: () => {
          _controller.updateCurrentText(item, _textController.text),
          Get.back()
        }
    );
  }

}
