import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:flutter_html/flutter_html.dart';
// Style is available via flutter_html export
import 'package:rg2/views/shared/url_helper.dart';


class MyHtmlView extends StatelessWidget {
  final int _curPageNumber;

  const MyHtmlView({
    Key? key,
    required int curPageNumber,
  })  : _curPageNumber = curPageNumber,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    LearnDetailController _controller = Get.find();
    final htmlText = UrlHelper.getNormalHtmlTextFromDescription(
        _controller.currentItems[_curPageNumber].description,
        _controller.getAssetPath()
    );
    return Html(
      data: htmlText,
      style: {
        "a": Style(
          color: Get.theme.colorScheme.primary,
        ),
        "h5": Style(
          textAlign: TextAlign.center,
          fontSize: FontSize.large
        ),
      },
      onLinkTap: (url, _, __) {
        UrlHelper.onUrlTap(url ?? "");
      },
    );
  }

}
