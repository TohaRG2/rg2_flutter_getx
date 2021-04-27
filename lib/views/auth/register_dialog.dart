import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/dialogs/big_dialog.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/auth/wait_confirm_email_dialog.dart';

class RegisterDialog extends GetWidget<AuthController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BigDialog(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _signUpFields(),
          SizedBox(height: UIHelper.SpaceSmall,),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                if (await controller.registerWithEmailAndPassword()) {
                  Get.back();
                  if (Get.isDialogOpen) { Get.back(); }
                  Get.dialog(WaitConfirmEmailDialog());
                }
              }
            },
            child: Text("Создать нового пользователя")
          ),
          SizedBox(height: UIHelper.SpaceSmall,),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Уже зарегистрированы? Войти")
          )
      ])
    );
  }


  Widget _signUpFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Имя"),
              validator: RequiredValidator(errorText: "Необходимо заполнить это поле"),
              onChanged: (val) {
                //controller.name = val;
              },
            ),
          ),
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
              onChanged: (val) {
                //controller.email = val;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Пароль"),
              validator: MultiValidator([
                RequiredValidator(errorText: "Необходимо заполнить это поле"),
                MinLengthValidator(8, errorText: "Пароль должен быть не меньше 8 символов"),
              ]),
              obscureText: true,
              onChanged: (val) {
                //controller.password = val;
              },
            ),
          ),
        ],
      ),
    );
  }


}
