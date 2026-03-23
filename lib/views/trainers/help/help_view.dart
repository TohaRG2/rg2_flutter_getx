import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
// Style is available via flutter_html export
import 'package:rg2/views/trainers/model/trainer_menu_item.dart';
import 'package:rg2/views/shared/url_helper.dart';
import 'package:rg2/views/shared/bottom_bar_with_back_button.dart';
import 'package:rg2/utils/theme_compat.dart';

class HelpView extends StatelessWidget {
  final TrainerMenuItem item;

  HelpView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
                item.title,
                style: TextStyle(
                    color: Get.textTheme.headlineSmall?.color),
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
                "a": Style(color: Theme.of(context).colorScheme.secondary),
                "h5": Style(
                    textAlign: TextAlign.center,
                    fontSize: FontSize.large
                ),
                "b": Style(color: Theme.of(context).colorScheme.secondary),
              },
      onLinkTap: (url, _, __) => UrlHelper.onUrlTap(url ?? ""),
            ),
            SizedBox(height: 150,)
          ],
        ),
      ),
    );
  }

}
