import 'package:get/get.dart';
import 'package:meta/meta.dart';

class TimerController extends GetxController {

  final _time = ''.obs;
  set time(value) => _time.value = value;
  get time => _time.value;


}