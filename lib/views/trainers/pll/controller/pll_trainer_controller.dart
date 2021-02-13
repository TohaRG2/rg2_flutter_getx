import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PllTrainerController extends GetxController {

  final _showBottomBar = true.obs;
  bool get showBottomBar => _showBottomBar.value;
  set showBottomBar(value) => _showBottomBar.value = value;


}