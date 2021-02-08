import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/azbuka_dialog_controller.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/dialogs/azbuka/azbuka_item.dart';

class AzbukaDialog extends StatelessWidget {
  final _controller = Get.find<AzbukaDialogController>();
  final String phase;

  AzbukaDialog(this.phase);

  @override
  Widget build(BuildContext context) {

    final Future<void> moves = _controller.loadMoves(phase);
    return FutureBuilder(
        future: moves,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text(StrRes.somethingWrong);

            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator()
              );

            case ConnectionState.done:
              return _showDialog(context);   //Если все ок, выводим диалог

            default:
              return Text(StrRes.somethingWrong);
          }
        });
  }

  SafeArea _showDialog(BuildContext context) {
    var _theme = Theme.of(context);
    var _primaryColor = _theme.primaryColor;
    return SafeArea(
      child: Center(
        child: Container(
          width: context.mediaQuerySize.width - 50,
          height: context.mediaQuerySize.height - 50,
          decoration: BoxDecoration(
            color: _theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StrRes.azbukaDialogTitle, style: _theme.textTheme.headline5),
                ),
                Expanded(
                  child: ListView.builder(
                  itemCount: _controller.movesItems.length,
                  itemBuilder: (_, index) {
                    //print("Создаем элемент сиска $pageNumber - $index");
                    return AzbukaItem(
                        _controller.movesItems[index]);
                  },
                ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          color: _primaryColor,
                          child: Text(StrRes.backButtonText)),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          StrRes.azbukaDialogHint,
                          style: _theme.textTheme.headline6.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
  );
  }
}
