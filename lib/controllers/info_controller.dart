import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/controllers/settingsController.dart';

class InfoController extends GetxController {
  Repository _repo = Get.find();
  SettingsController _settings = Get.find();


  int curPageNumber = 2;

  @override
  onInit() {
    print("Init InfoController");
    curPageNumber = _settings.currentInfoPageNumber.value;
    super.onInit();
  }

}