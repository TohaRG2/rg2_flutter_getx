import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/auth/sign_in_view.dart';
import 'package:rg2/views/main_view.dart';

class MainAuthView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return (controller.user == null) ?
          SignInView() :
          MainViewWithBottomBar();
  }
}

