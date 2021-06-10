import 'package:get/get.dart';
import 'package:rg2/controllers/repository/main_repository.dart';
import 'package:rg2/utils/my_logger.dart';

bool updateMainBaseFunction(int num) {
  final MainRepository _mainRepository = Get.put(MainRepository());

  logPrint("updateMainBaseFunction - start");


  return true;
}