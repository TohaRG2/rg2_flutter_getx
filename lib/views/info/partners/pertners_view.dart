import 'package:flutter/material.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Ищите все эти и многие другие головоломки на сайте нашего партнера:",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: UIHelper.SpaceMedium,),
            Image.asset("assets/images/ads/cubemarket_logo.png"),
            SizedBox(height: UIHelper.SpaceMedium,),
            Text("Используйте промокод 'RG2', чтобы получить наклейки в подарок, а так же скидку 5% на первую покупку",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                launch("https://vk.cc/9Hgeyd");
              },
              child: Text("Перейти на сайт магазина"))
          ],
        ),
      ),
    );
  }
}
