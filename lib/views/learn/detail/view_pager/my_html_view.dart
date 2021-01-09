import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_detail_controller.dart';
import 'package:rg2_flutter_getx/flutter_html/flutter_html.dart';
import 'package:rg2_flutter_getx/flutter_html/style.dart';
import 'package:rg2_flutter_getx/views/learn/detail/learn_detail_screen.dart';
import 'package:html/dom.dart' as dom;
import 'package:rg2_flutter_getx/views/shared/url_helper.dart';
import 'package:url_launcher/url_launcher.dart';

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
          color: Theme.of(context).accentColor,
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
