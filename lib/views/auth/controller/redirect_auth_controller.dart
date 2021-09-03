import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';

class RedirectAuthController extends GetxController {
  final AuthController authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    logPrint("onInit - RedirectAuthController");
  }

  @override
  void onReady() {
    logPrint("onReady - RedirectAuthController");
    if (authController.showSignInDialog) {
      Get.offNamed('/signIn');
    } else {
      authController.goToMainPage();
    }
    super.onReady();
  }

}