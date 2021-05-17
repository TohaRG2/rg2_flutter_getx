import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/info/advices/details/advices_images_detail_view.dart';
import 'package:rg2/views/info/advices/model/advices_items.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'dart:math';

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
                style: Get.textTheme.headline4,
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
                logPrint("Открываем диалог с просмотром советов по программе");
                Get.to(() => AdvicesImagesDetailView(), transition: Transition.cupertino);
                //Get.to(() => ComplicatedImageDemo());
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
