import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';

class InfoController extends GetxController {
  SettingsController _settings = Get.find();

  int get curPageNumber => _settings.currentInfoPageNumber;

}