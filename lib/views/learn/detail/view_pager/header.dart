import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_detail_controller.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required int curPageNumber,
  })  : _curPageNumber = curPageNumber,
        super(key: key);

  final int _curPageNumber;

  @override
  Widget build(BuildContext context) {
    LearnDetailController _controller = Get.find();
    var item = _controller.currentItems[_curPageNumber];
    bool isPngImg = item.icon.endsWith(".png");
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: isPngImg
                ? Image.asset(
                    _controller.getImagePathFromAssets(item.icon),
                    height: 70,
                  )
                : SvgPicture.asset(
                    _controller.getImagePathFromAssets(item.icon),
                    height: 70,
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
              ],
            ),
          )),
        ],
      ),
    );
  }
}
