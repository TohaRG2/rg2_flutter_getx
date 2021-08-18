import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';

class BindingControllers extends Bindings {
  @override
  void dependencies() {
    logPrint("BindingControllers in helper");
    //Get.put<AuthController>(AuthController(), permanent: true);
  }
}