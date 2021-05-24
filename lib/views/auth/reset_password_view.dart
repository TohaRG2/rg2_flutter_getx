import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class ResetPasswordView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return BigDialog(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("Сброс пароля", style: Get.textTheme.headline5,)),
          elevation: 0,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Необходимо заполнить это поле"),
                    EmailValidator(errorText: "Неверно указан адрес"),
                  ]),
                ),
              ),
              SizedBox(height: UIHelper.SpaceMedium,),
                ElevatedButton(
                  onPressed: () {
                    controller.resetPasswordForEmail();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Get.theme.accentColor, // background
                  ),
                  child: Text("Подтвердить")
                ),
              ],
          )),
        bottomNavigationBar: _bottomBar(),
      )
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

}
