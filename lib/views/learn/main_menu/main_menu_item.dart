import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_controller.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/dialogs/favourites/favourite_dialog.dart';
import 'package:rg2_flutter_getx/views/learn/detail/learn_detail_screen.dart';
import 'package:rg2_flutter_getx/views/settings/settings_screen.dart';

class MainMenuItem extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final SettingsController _settingsController = Get.find();
  final MainDBItem item;
  final bool isItemEnabled;

  MainMenuItem({this.item, this.isItemEnabled});

  @override
  Widget build(BuildContext context) {
    var _accentColor = Theme.of(context).accentColor;
    var _primaryColor = Theme.of(context).primaryColor;
    var _imagePath = _learnController.getAssetFilePath(item.icon, item.phase);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        child: Container(
          child: Material(
            //color: Colors.amberAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.grey,
                        //Выводим цветную или ч/б картинку в зависимости от настроек
                        (isItemEnabled) ? BlendMode.dst : BlendMode.saturation,
                    ),
                    child: _imagePath.endsWith(".svg") ?
                      SvgPicture.asset(_imagePath, height: 70,) :
                      Image.asset(_imagePath, height: 70,),
                  ),
                ),
                Expanded(
                  child: Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        softWrap: true,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          item.comment,
                          maxLines: 1,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )),
                Visibility(
                  //если enabled и не возврат на шаг выше
                  visible: (item.id != -1 && isItemEnabled) ? true : false,
                  child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,  // Выглядит странно, но без этого область нажатия на иконку не увеличивается на величину padding
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, top: 15.0, bottom: 15.0, left: 5.0),
                        child: Icon( item.isFavourite ?
                                Icons.favorite_rounded : Icons.favorite_border_rounded,
                                color: _primaryColor,
                              ),
                      ),
                    ),
                    onTap: () {
                      _learnController.changeFavStatus(item);
                    },
                    onLongPress: () {
                      Get.dialog(FavouriteDialog());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          print("Tap on mainMenu $item");
          if (isItemEnabled) {
            if (item.url == "submenu") {
              _learnController.changeCurrentPhaseWith(item);
            } else {
              _learnController.saveListPositionForPhase(item.phase);
              Get.to(LearnDetailScreen(item.phase, item.id),
                  transition: Transition.fadeIn);
            }
          } else {
            Get.snackbar(StrRes.snackTextWarning, "",
              icon: Icon(Icons.warning_amber_outlined),
              messageText: Center(child: Text(StrRes.snackTextItemDisabled)),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black54,
              duration: Duration(seconds: 6),
              mainButton: FlatButton(
                  onPressed: (){
                    //TODO Сделать переход к настройкам, а не открытие в новом окне
                    Get.to(SettingsScreen());
                  },
                  child: Text("Перейти")),
            );
          }
        },
      ),
    );
  }
}
