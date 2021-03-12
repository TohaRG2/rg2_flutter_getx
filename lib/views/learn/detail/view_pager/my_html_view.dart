import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/learn_detail_controller.dart';
import 'package:rg2/flutter_html/flutter_html.dart';
import 'package:rg2/flutter_html/style.dart';
import 'package:rg2/views/shared/url_helper.dart';

class MyHtmlView extends StatelessWidget {
  const MyHtmlView({
    Key key,
    @required int curPageNumber,
  })  : _curPageNumber = curPageNumber,
        super(key: key);

  final int _curPageNumber;

  @override
  Widget build(BuildContext context) {
    LearnDetailController _controller = Get.find();
    var htmlText = UrlHelper.getNormalHtmlTextFromDescription(
        _controller.currentItems[_curPageNumber].description,
        _controller.getAssetPath()
    );
    return Html(
      data: htmlText,
      style: {
        "a": Style(
          color: Get.theme.accentColor,
        ),
        "h5": Style(
          textAlign: TextAlign.center,
          fontSize: FontSize.large
        ),
      },
      onLinkTap: (url) {
        UrlHelper.onUrlTap(url);
      },
    );
  }

}
