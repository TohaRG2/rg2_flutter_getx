import 'package:get/get.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';

class BindingControllers extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    //Get.put<SettingsController>(SettingsController(), permanent: true);
  }
}