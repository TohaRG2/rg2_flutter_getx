import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AzbukaTrainerController extends GetxController {

  final _showStartScreen = true.obs;
  set showStartScreen(value) => _showStartScreen.value = value;
  get showStartScreen => _showStartScreen.value;
}