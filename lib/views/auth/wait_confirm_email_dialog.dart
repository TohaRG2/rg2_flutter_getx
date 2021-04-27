import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class WaitConfirmEmailDialog extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {
    var defStyle = Get.textTheme.bodyText2;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BigDialog(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Подтвердите email", style: Get.textTheme.headline5,),
            elevation: 0,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Чтобы закончить регистрацию, необходимо подтвердить адрес электронной почты.", style: defStyle,),
                SizedBox(height: UIHelper.SpaceMedium,),
                RichText(
                  text: TextSpan(
                    text: "Для подтверждения, на адрес ",
                    children: <TextSpan>[
                      TextSpan(text: "${controller.emailController.text}", style: TextStyle(decoration: TextDecoration.underline, color: Get.theme.accentColor)),
                      TextSpan(text: " отправлено письмо."),
                    ],
                    style: defStyle,
                  ),
                ),
                SizedBox(height: UIHelper.SpaceSmall,),
                Text("Пожалуйста, откройте его и подтвердите свой адрес, кликнув по ссылке в письме.", style: defStyle,),
                SizedBox(height: UIHelper.SpaceMedium,),
                ElevatedButton(
                  onPressed: () {
                    controller.checkEmailVerification();
                  },
                  child: Text("Я подтвердил")),
              ],
            ),
          ),
          bottomNavigationBar: _bottomBar(),
        ),
      ),
    );
  }


  Widget _bottomBar() {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Get.theme.primaryColor),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Вернуться на страницу входа"),
          ],
        ),
      ),
    );
  }

  /// Обрабатываем нажатие физической кнопки "назад"
  Future<bool> _onWillPop() async {
    logPrint("_onWillPop - Нажали назад");
    controller.signOut();
    return true;
  }

}
