import 'package:get/get.dart';
import 'package:meta/meta.dart';

class TimerController extends GetxController {

  final _time = ''.obs;
  set time(value) => _time.value = value;
  get time => _time.value;

  final _isOneHanded = true.obs;
  bool get isOneHanded => _isOneHanded.value;
  set isOneHanded(value) {
    _isOneHanded.value = value;
  }

  final _scramble = "".obs;
  String get scramble => _scramble.value;
  set scramble(value) {
    _scramble.value = value;
  }

}