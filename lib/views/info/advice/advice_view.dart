import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/dialogs/advices_images/advices_images_dialog.dart';
import 'package:rg2_flutter_getx/views/shared/ui_helpers.dart';
import 'dart:math';

import 'advices.dart';

class AdviceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var index = Random().nextInt(Advices.advicesList.length);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: UIHelper.SpaceSmall,
                  right: UIHelper.SpaceSmall,
                  top: UIHelper.SpaceSmall
              ),
              child: Text(Advices.advicesList[index].adviceText,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: UIHelper.SpaceMedium,
                    horizontal: UIHelper.SpaceSmall
                ),
                child: Image.asset(Advices.advicesList[index].adviceImagePath)
              ),
              onTap: (){
                print("Открываем диалог с просмотром советов по программе");
                Get.to(AdvicesImagesDialog());
                //Get.to(ComplicatedImageDemo());
              },
            ),
            SizedBox(height: UIHelper.SpaceLarge,)
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(UIHelper.SpaceSmall),
        child: Text(
            StrRes.infoAdviceComment,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 16,
            ),
        )
      ),
    );
  }
}
