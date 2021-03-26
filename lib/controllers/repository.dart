import 'package:get/get.dart';
import 'package:rg2/database/daos/main_dao.dart';
import 'package:rg2/database/daos/moves_dao.dart';
import 'package:rg2/database/daos/page_prop_dao.dart';
import 'package:rg2/database/daos/phase_position_dao.dart';
import 'package:rg2/database/daos/pll_trainer_dao.dart';
import 'package:rg2/database/daos/times_dao.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/database/entitys/phase_position_item.dart';
import 'package:rg2/database/entitys/pll_trainer_item.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:rg2/utils/my_logger.dart';

class Repository extends GetxController {
  MainDao _mainDao = Get.find();
  PagePropertiesDao _propertiesDao = Get.find();
  MovesDao _movesDao = Get.find();
  PhasePositionDao _positionsDao = Get.find();
  TimesDao _timesDao = Get.find();
  PllTrainerDao _pllTrainerDao = Get.find();

  List<MainDBItem> _cache = [];

  Future<MainDBItem> getMainDBItem(String phase, int id) async {
    logPrint("getMainDBItem $phase $id");
    var result = await _mainDao.getItem(phase, id);
    return result;
  }

  Future<List<MainDBItem>> getMainDBItems(String phase) async {
    //if (_cache.isEmpty) { _cache = await _mainDao.getAllItems();}
    logPrint("getMainDBItems $phase");
    var result = await _mainDao.getPhase(phase);
    return result;
  }

  Future<List<MainDBItem>> getSubMenuList() async {
    var result = await _mainDao.getSubMenuList("submenu");
    return result;
  }

  /// Получаем список записей у которых isFavourite = 1
  Future<List<MainDBItem>> getFavourites() async {
    var result = await _mainDao.getFavourites();
    return result;
  }

  Future<List<MainDBItem>> getPhasePages(String phase) async {
    var result = await _mainDao.getPhasePages(phase, "submenu");
    return result;
  }

  updateMainDBItem(MainDBItem item) async {
    logPrint("repo updateItem $item");
    _mainDao.updateItem(item);
  }

  Future<int> updateMainDBItems(List<MainDBItem> items) async {
    logPrint("repo updateItems $items");
    return await _mainDao.updateItems(items);
  }

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

  /// Получаем список отсортированных по одному из полей записей
  Future<List<TimeNoteItem>> getAllTimeNotes({String orderBy}) async {
    var result = await _timesDao.getAllItems();
    var orderColumn = orderBy ?? "SOLVINGTIME"; //если orderBy не NULL, иначе "SolvingTime"
    // Делаем проверку
    switch(orderColumn.toUpperCase()) {
      case "UUID": orderColumn = "uuid"; result.sort((item1, item2) => item1.uuid.compareTo(item2.uuid)); break;
      case "DATETIME": orderColumn = "dateTime"; result.sort((item1, item2) => item1.dateTime.compareTo(item2.dateTime)); break;
      case "SCRAMBLE": orderColumn = "scramble"; result.sort((item1, item2) => item1.scramble.compareTo(item2.scramble)); break;
      case "COMMENT": orderColumn = "comment"; result.sort((item1, item2) => item1.comment.compareTo(item2.comment)); break;
      default: orderColumn = "solvingTime"; result.sort((item1, item2) => item1.solvingTime.compareTo(item2.solvingTime));
    }
    logPrint("orderBy - $orderColumn");
    return result;
  }

  Future<int> updateTimeNoteItem(TimeNoteItem item) async {
    return await _timesDao.updateItem(item);
  }

  Future<int> addTimeNoteItem(TimeNoteItem item) async {
    return await _timesDao.insertItem(item);
  }

  Future<int> deleteTimeNoteItem(TimeNoteItem item) async {
    return await _timesDao.deleteItem(item);
  }
  
  void clearTimesTable() async {
    return await _timesDao.clearTable();
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
