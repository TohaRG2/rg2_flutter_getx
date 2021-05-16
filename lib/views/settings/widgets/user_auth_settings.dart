import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/connection_controller.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/auth/sign_in_view.dart';
import 'package:rg2/views/dialogs/edit_user_name/edit_user_name_view.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class UserAuthSettings extends StatelessWidget {
  final AuthController controller = Get.find();
  final ConnectionController _connectionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var user = controller.user;
      logPrint("build - ${user?.uid} ${user?.email}");
      return user == null ? buildEmptyUserRow() : buildUserRow(user);
      },
    );
  }

  Widget buildEmptyUserRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("Не авторизован")),
          _whyNeedAuthButton(),
          OutlinedButton(
              onPressed: () {
                if (_connectionController.connection != ConnectivityResult.none) {
                  Get.to(() => SignInView(), transition: Transition.cupertino);
                } else {
                  //Get.to(() => SignInView(), transition: Transition.cupertino);
                  Get.defaultDialog(
                    title: StrRes.internetAccessDialogTitle,
                    titleStyle: TextStyle(fontSize: 24),
                    middleText: StrRes.internetAccessDialogText,
                    textConfirm: StrRes.buttonOkText,
                    onConfirm: (){ Get.back(); }
                  );
                }
              },
              child: Text("Войти")),
        ],
      ),
    );
  }

  Widget buildUserRow(User user) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            maxRadius: 20,
            child: (user.photoURL == null || user.photoURL == "")
                ? Icon(MaterialCommunityIcons.account, size: 40,)
                : Image.network(user.photoURL, width: 40),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
              child: GestureDetector(
                onTap: () {
                  Get.dialog(EditUserNameView());
                },
                child: Text(
                  "${user.displayName}",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Get.textTheme.headline6,
                ),
              ),
            ),
          ),
          _whyNeedAuthButton(),
          OutlinedButton(
              onPressed: () {
                controller.signOut();
              },
              child: Text("Выйти")
          ),
        ]),
      );
  }

  IconButton _whyNeedAuthButton() {
    return IconButton(
      onPressed: () {
        if (Get.isSnackbarOpen) {
          Get.back();
        } else {
          _openSnackBar();
        }
      },
      icon: Icon(MaterialIcons.help_outline),
    );
  }

  _openSnackBar() {
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
  }

}
