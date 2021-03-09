import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class IconWithTextWidget extends StatelessWidget {
  IconWithTextWidget({
    @required String text,
    @required IconData icon,
    Color color,
    Key key,
  }) : _text = text, _icon = icon, _color = color, super(key: key);

  final String _text;
  final IconData _icon;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _icon,
            color: _color,
            size: 40.0,),
          SizedBox(height: UIHelper.SpaceSmall,),
          Text(_text,
            style: Get.textTheme.headline6.copyWith(
              fontSize: 14,
              color: _color,
            ),
          )
        ],
      ),
    );
  }
}