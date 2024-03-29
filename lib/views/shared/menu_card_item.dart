import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class MenuCardItem extends StatelessWidget {
  final Widget child;
  const MenuCardItem({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.Zero, vertical: UIHelper.One),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall, vertical: UIHelper.SpaceSmall),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 7,
                offset: Offset(0, 4))
          ]),
        child: child,
      )
    );
  }
}
