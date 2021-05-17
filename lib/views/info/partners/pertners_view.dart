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
            Text("Эти и многие другие головоломки ищите на сайте нашего партнера:",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: UIHelper.SpaceMedium,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: UIHelper.SpaceMedium),
              child: Image.asset("assets/images/ads/cubemarket_logo.png")
            ),
            SizedBox(height: UIHelper.SpaceMedium,),
            Text("По промокоду 'RG2' наклейка с логотипом в подарок!",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: UIHelper.SpaceSmall,),
            ElevatedButton(
              onPressed: () {
                launch("https://vk.cc/9Hgeyd");
              },
              child: Text("Перейти на сайт"))
          ],
        ),
      ),
    );
  }
}
