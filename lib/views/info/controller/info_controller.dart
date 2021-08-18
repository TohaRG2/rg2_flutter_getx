import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class InfoController extends GetxController {
  SettingsController _settings = Get.find();
  RxString _versionNumber = "ver. 4.210517.1".obs;
  String get versionNumber => _versionNumber.value;

  int get curPageNumber => _settings.currentInfoPageNumber;

  @override
  void onInit() {
    super.onInit();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      // String appName = packageInfo.appName;
      // String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      _versionNumber.value = "ver. $version ($buildNumber)";
    });
  }

}