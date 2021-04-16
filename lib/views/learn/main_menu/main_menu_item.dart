import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/favourites/dialog/favourite_dialog.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';
import 'package:rg2/views/settings/settings_screen_view.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class MainMenuItem extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final MainDBItem item;
  final bool isItemEnabled;

  MainMenuItem({this.item, this.isItemEnabled});

  @override
  Widget build(BuildContext context) {
    var _primaryColor = Get.theme.primaryColor;
    var _imagePath = item.getAssetFilePath(); // _learnController.getAssetFilePath(item.icon, item.phase);
    //TODO переделать на использование card
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
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
                        style: Get.textTheme.headline6,
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
          logPrint("Tap on mainMenu $item");
          if (isItemEnabled) {
            if (item.url == "submenu") {
              _learnController.changeCurrentPhaseWith(item);
            } else {
              _learnController.saveListPositionForPhase(item.phase);
              Get.to(() => LearnDetailScreen(item.phase, item.id),
                  transition: Transition.fadeIn);
            }
          } else {
            if (Get.isSnackbarOpen) { Get.back(); }
            Get.snackbar(StrRes.snackTextWarning, "",
              icon: Icon(Icons.warning_amber_outlined),
              messageText: Center(child: Text(StrRes.snackTextItemDisabled)),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black54,
              duration: Duration(seconds: 6),
              mainButton: TextButton(
                  onPressed: (){
                    // закрываем снэкбар
                    Get.back();
                    //TODO сделать переход с прокруткой к определенному пункту в настройках
                    Get.to(() => SettingsScreen(), transition: Transition.downToUp);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Перейти"))
              ),
            );
          }
        },
      ),
    );
  }
}
