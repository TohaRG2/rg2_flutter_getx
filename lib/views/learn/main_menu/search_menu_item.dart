import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/shared/menu_card_item.dart';
typedef FunctionForCallback = Function(MainDBItem);

class SearchMenuItem extends StatelessWidget {
  final MainDBItem item;
  final FunctionForCallback onTapCallback;

  const SearchMenuItem({
    @required this.item,
    @required this.onTapCallback,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imagePath = item.getAssetFilePath();
    return GestureDetector(
      child: MenuCardItem(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.grey,
                  //Выводим цветную или ч/б картинку в зависимости от настроек
                  (item.subId == 1) ? BlendMode.dst : BlendMode.saturation,
                ),
                child: Image.asset(_imagePath, height: 66,)
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Text(
                  item.title.replaceFirst('(', '\n('),
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
      onTap: () {
        onTapCallback(item);
      },

    );
  }
}
