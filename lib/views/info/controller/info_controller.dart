import 'package:get/get.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class InfoController extends GetxController {
  SettingsController _settings = Get.find();

  int get curPageNumber => _settings.currentInfoPageNumber;

}