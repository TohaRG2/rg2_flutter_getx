import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class UserAuthSettings extends StatelessWidget {
  final AuthController controller = Get.find();

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
          Text("Не авторизован"),
          OutlinedButton(
              onPressed: () {
                controller.googleSignIn();
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
            backgroundImage: (user.photoURL == null) ? AssetImage("assets/images/icons/back_arrow.svg") : NetworkImage(user.photoURL),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
              child: Text(
                "${user.displayName}",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: Get.textTheme.headline6,
              ),
            ),
          ),
          IconButton(
              onPressed: (){
                if (Get.isSnackbarOpen) {
                  Get.back();
                } else {
                  Get.snackbar(StrRes.authSignInBecause, StrRes.authBodyText,
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.grey[800],
                    duration: Duration(seconds: 15),
                    onTap: (_) {
                      Get.back();
                    },
                  );
                }
              },
              icon: Icon(MaterialIcons.help_outline),
          ),
          OutlinedButton(
              onPressed: () {
                controller.googleSignOut();
              },
              child: Text("Выйти")
          ),
        ]),
      );
  }
}
