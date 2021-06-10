import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/auth/sign_in_view.dart';
import 'package:rg2/views/main_view.dart';

class MainAuthView extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {
    controller.checkBaseResourcesVersion();
    return (controller.showSignInDialog) ?
          SignInView() :
          MainView();
  }
}

