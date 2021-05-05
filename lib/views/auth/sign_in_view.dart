import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/auth/register_dialog.dart';
import 'package:rg2/views/auth/reset_password_view.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/widgets/theme_switch.dart';
import 'package:rg2/views/main_view.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class SignInView extends GetWidget<AuthController> {
  final SettingsController _settings  = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(StrRes.authTitle, style: TextStyle(color: Theme.of(context).textTheme.headline5.color)),
            ),
            actions: [
              ThemeSwitch(),
              SizedBox(width: UIHelper.SpaceSmall,),
            ],
          ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: UIHelper.SpaceMedium),
              child: Center(
                child: loginPage(context),
              ),
            ),
            Obx(() =>
              Visibility(
                visible: controller.showPreLoader,
                child: Container(
                  color: Colors.black38,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ),
            )
          ],
        ),
    );
  }

  Widget loginPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: UIHelper.SpaceMedium,
          ),
          _signInFields(),
          SizedBox(
            height: UIHelper.SpaceMedium,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // logPrint("build - Проверка прошла");
                  controller.loginWithEmailAndPassword();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Get.theme.accentColor, // background
              ),
              child: Text("Войти")),

          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // controller.registerWithEmailAndPassword();
                  Get.dialog(RegisterDialog());
                },
                child: Text("Новый пользователь"),
              ),
              Text("/"),
              TextButton(
                onPressed: () {
                  Get.dialog(ResetPasswordView());
                },
                child: Text("Забыли пароль?"),
              ),
            ],
          ),
          Divider(
            height: 2,
            color: Get.theme.primaryColor,
          ),
          SizedBox(
            height: UIHelper.SpaceMedium,
          ),

          /// Войти в гугл аккаунт
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GoogleAuthButton(
                onPressed: () {
                  // Закрыть снэкбар, если он открыт
                  if (Get.isSnackbarOpen) {
                    Get.back();
                  }
                  controller.googleSignInAndGoToStart();
                },
                darkMode: _settings.isDarkThemeSelect,
                style: AuthButtonStyle(
                  buttonType: AuthButtonType.icon,
                ),
                // text: StrRes.authSignInGoogleButtonText,
              ),

              /// Войти в эппл аккаунт, только для iPhone
              if (Platform.isIOS) ...{
                AppleAuthButton(
                  onPressed: () {
                    if (Get.isSnackbarOpen) {
                      Get.back();
                    }
                    controller.appleSignInAndGoToStart();
                  },
                  darkMode: _settings.isDarkThemeSelect,
                  style: AuthButtonStyle(
                    buttonType: AuthButtonType.icon,
                  ),
                  // text: StrRes.authSignInAppleButtonText,
                )
              },
            ],
          ),

          SizedBox(
            height: UIHelper.SpaceMedium,
          ),

          GestureDetector(
            child: Text(StrRes.authSignInWhy,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline5.copyWith(
                  decoration: TextDecoration.underline,
                  // Не получится использовать Get.theme, т.к. он кэширует информацию
                  // либо надо наследоваться от StatelessWidget, а не от GetWidget
                  color: Theme.of(context).textTheme.headline5.color,
                )),
            onTap: () {
              /// Вызываем снэкбар
              if (Get.isSnackbarOpen) {
                Get.back();
              }
              Get.snackbar(
                StrRes.authSignInBecause,
                StrRes.authBodyText,
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.grey[800],
                duration: Duration(seconds: 15),
                onTap: (_) {
                  Get.back();
                },
              );
            },
          ),
          SizedBox(
            height: UIHelper.SpaceMedium,
          ),
          buildBottomButtons(),
        ],
      ),
    );
  }

  Widget buildBottomButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Get.offAll(() => MainView(), transition: Transition.leftToRight);
            },
            child: Text(StrRes.authLaterButtonText),
          ),
          TextButton(
            onPressed: () {
              controller.disableShowSignInView();
              Get.offAll(() => MainView(), transition: Transition.rightToLeft);
            },
            child: Text(StrRes.authNeverButtonText),
          ),
        ],
      ),
    );
  }


  Widget _signInFields() {
    return Form(
      key: _formKey,
      child: Column(
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

