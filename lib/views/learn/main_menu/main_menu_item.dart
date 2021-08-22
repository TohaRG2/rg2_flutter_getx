import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/favourites/dialog/favourite_dialog.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
typedef FunctionForCallback = Function(MainDBItem, bool);

class MainMenuItem extends StatelessWidget {
  final LearnController _learnController = Get.find();
  final MainDBItem item;
  final bool isItemEnabled;
  final FunctionForCallback onTapCallback;

  MainMenuItem({
    @required this.item,
    @required this.isItemEnabled,
    @required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Get.theme.primaryColor;
    final _imagePath = item.getAssetFilePath(); // _learnController.getAssetFilePath(item.icon, item.phase);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceMini),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Get.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 7,
                    offset: Offset(2,4)
                )
              ]
          ),
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
                    SvgPicture.asset(_imagePath, height: 66,) :
                    Image.asset(_imagePath, height: 66,),
                ),
              ),
              SizedBox(width: 4,),
              Expanded(
                child: Padding(
                padding: EdgeInsets.symmetric(vertical: UIHelper.SpaceSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title.replaceFirst('(', '\n('),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodyText1,
                    ),
                    Visibility(
                      visible: item.comment.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          item.comment,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14),
                        ),
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
        onTap: () {
          onTapCallback(item, isItemEnabled);
        },
      ),
    );
  }
}
