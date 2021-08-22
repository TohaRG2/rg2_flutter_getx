import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceSmall),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceSmall),
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            // border: Border.all(color: Colors.black.withOpacity(0.3)),
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
                  item.title,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        onTapCallback(item);
      },

    );
  }
}
