import 'package:get/get.dart';
import 'package:rg2/database/daos/moves_dao.dart';
import 'package:rg2/database/daos/page_prop_dao.dart';
import 'package:rg2/database/daos/phase_position_dao.dart';
import 'package:rg2/database/daos/pll_trainer_dao.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/database/entitys/phase_position_item.dart';
import 'package:rg2/database/entitys/pll_trainer_item.dart';
import 'package:rg2/utils/my_logger.dart';

class Repository extends GetxController {
  PagePropertiesDao _propertiesDao = Get.find();
  MovesDao _movesDao = Get.find();
  PhasePositionDao _positionsDao = Get.find();
  PllTrainerDao _pllTrainerDao = Get.find();

  List<MainDBItem> _cache = [];

  //----------------------------------------------

  /// Получаем список типов (основных фаз) из базы
  Future<List<PageProperties>> getCubeTypes() async {
    var result = await _propertiesDao.getAllItems();
    logPrint("cubeTypes = $result");
    //await Future.delayed(const Duration(seconds: 1), () {});
    return result;
  }

  /// Обновляем список типов головоломок (основных фаз)
  Future<int> updateCubeType(PageProperties item) async {
    return await _propertiesDao.updateItem(item);
  }

  //-----------------------------------------------

  /// Получение из базы азбуки вращений для определенного типа головоломки
  Future<List<BasicMove>> getAzbukaForType(String eType) async {
    //await Future.delayed(const Duration(seconds: 3), () {});
    return await _movesDao.getTypeItems(eType);
  }


  //------------------------------------------------

  Future<List<PhasePositionItem>> getAllPositionsList() async {
    return await _positionsDao.getAllItems();
  }

  Future<int> updatePhasePosition(String phase, double position) async {
    var item = PhasePositionItem(phase, position);
    return await _positionsDao.insertOrReplace(item);
  }


  //------------------------------------------------

  Future<List<PllTrainerItem>> getAllPllTrainer() async {
    return await _pllTrainerDao.getAllItems();
  }

  Future<int> updatePllTrainerItem(PllTrainerItem item) async {
    return await _pllTrainerDao.updateItem(item);
  }

  Future<int> updatePllTrainerItems(List<PllTrainerItem> items) async {
    return await _pllTrainerDao.updateItems(items);
  }


}
