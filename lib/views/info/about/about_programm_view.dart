import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/flutter_html/flutter_html.dart';
import 'package:rg2_flutter_getx/flutter_html/style.dart';
import 'package:rg2_flutter_getx/views/info/about/text_about.dart';
import 'package:rg2_flutter_getx/views/shared/url_helper.dart';

class AboutProgramView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset("assets/icons/ic_icon_rg2.png", width: 100,),
                ),
                Expanded(
                    child: Column(
                      children: [
                        Text(TextAbout.infoAppDescription, style: Get.textTheme.headline5.copyWith(fontSize: 26),),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(TextAbout.version, style: Get.textTheme.headline6.copyWith(fontSize: 16),)
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Html(
              data: TextAbout.text,
              style: {
                "a": Style(
                  color: Theme.of(context).accentColor,
                ),
                "h5":
                    Style(textAlign: TextAlign.center, fontSize: FontSize.large),
              },
              onLinkTap: (url) {
                UrlHelper.onUrlTap(url);
              },
            ),
          )
        ],
      ),
    );
  }
}
