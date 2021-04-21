import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/settings/widgets/theme_switch.dart';
import 'package:rg2/views/main_view.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class SignInView extends GetWidget<AuthController> {
  final SettingsController _settings  = Get.find();

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
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: UIHelper.SpaceMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                SizedBox(
                  width: Get.width / 3,
                  height: Get.width / 3,
                  child: Image.asset("assets/icons/icon_rg2.png", fit: BoxFit.scaleDown)
                ),

                Spacer(),

                /// Войти в гугл аккаунт
                GoogleAuthButton(
                  onPressed: () {
                    // Закрыть снэкбар, если он открыт
                    if (Get.isSnackbarOpen) { Get.back(); }
                    controller.googleSignInAndGoToStart();
                  },
                  darkMode: _settings.isDarkThemeSelect,
                  text: StrRes.authSignInGoogleButtonText,
                ),
                SizedBox(height: UIHelper.SpaceMedium,),
                AppleAuthButton(
                  onPressed: () {
                    if (Get.isSnackbarOpen) { Get.back(); }
                    controller.appleSignInAndGoToStart();
                  },
                  darkMode: _settings.isDarkThemeSelect,
                  text: StrRes.authSignInAppleButtonText,
                ),
                SizedBox(height: UIHelper.SpaceMedium,),

                GestureDetector(
                  child: Text(
                      StrRes.authSignInWhy,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline5.copyWith(
                          decoration: TextDecoration.underline,
                          // Не получится использовать Get.theme, т.к. он кэширует информацию
                          // либо надо наследоваться от StatelessWidget, а не от GetWidget
                          color: Theme.of(context).textTheme.headline5.color,
                      )
                  ),
                  onTap: () {
                    /// Вызываем снэкбар
                    if (Get.isSnackbarOpen) { Get.back(); }
                    Get.snackbar(StrRes.authSignInBecause, StrRes.authBodyText,
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                      backgroundColor: Colors.grey[800],
                      duration: Duration(seconds: 15),
                      onTap: (_) { Get.back(); },
                    );
                  },
                ),

                Spacer(),

                /// Кнопки "сделаю это позже" и "больше не спрашивать"
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
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
                ),
                SizedBox(height: UIHelper.SpaceMedium,)
              ],
            ),
          ),
    );
  }
}

