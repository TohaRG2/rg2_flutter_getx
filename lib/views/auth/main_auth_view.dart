import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';
import 'package:rg2/views/auth/controller/redirect_auth_controller.dart';
import 'package:rg2/views/auth/sign_in_view.dart';
import 'package:rg2/views/main_view.dart';

class MainAuthView extends GetView<RedirectAuthController> {

  @override
  Widget build(BuildContext context) {
    logPrint("build - MainAuthView");
    Get.put(RedirectAuthController());
    return Center(child: CircularProgressIndicator(),);
  }
}

