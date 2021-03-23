import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

class UserAuthSettings extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var user = controller.user;
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
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceMini),
              child: Text(
                "${user.displayName}",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: Get.textTheme.headline6,
              ),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                controller.googleSignOut();
              },
              child: Text("Выйти")),
        ]),
      );
  }
}
