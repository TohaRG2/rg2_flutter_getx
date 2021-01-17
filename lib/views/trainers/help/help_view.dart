import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/flutter_html/flutter_html.dart';
import 'package:rg2_flutter_getx/flutter_html/style.dart';
import 'package:rg2_flutter_getx/models/trainer_menu_item.dart';
import 'package:rg2_flutter_getx/views/shared/url_helper.dart';
import 'package:rg2_flutter_getx/views/trainers/help/bottom_bar_with_back_button.dart';

import 'bottom_nav_bar.dart';

class HelpView extends StatelessWidget {
  final TrainerMenuItem item;

  HelpView({this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
                item.title,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline5.color),
              ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: _htmlView(context),
        bottomNavigationBar: BottomBarWithBackButton(),
    );
  }

  Widget _htmlView(BuildContext context) {
    var htmlText = UrlHelper.getNormalHtmlTextFromDescription(item.helpItem, '');
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Html(
              data: htmlText,
              style: {
                "a": Style(
                  color: Theme.of(context).accentColor,
                ),
                "h5": Style(
                    textAlign: TextAlign.center,
                    fontSize: FontSize.large
                ),
                "b": Style(
                  color: Theme.of(context).accentColor,
                ),
              },
              onLinkTap: (url) {
                UrlHelper.onUrlTap(url);
              },
            ),
            SizedBox(height: 150,)
          ],
        ),
      ),
    );
  }

}
