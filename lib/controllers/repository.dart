import 'package:get/get.dart';
import 'package:rg2_flutter_getx/database/daos/main_dao.dart';
import 'package:rg2_flutter_getx/database/daos/moves_dao.dart';
import 'package:rg2_flutter_getx/database/daos/page_prop_dao.dart';
import 'package:rg2_flutter_getx/database/daos/phase_position_dao.dart';
import 'package:rg2_flutter_getx/database/daos/times.dao.dart';
import 'package:rg2_flutter_getx/database/entitys/basic_move.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';
import 'package:rg2_flutter_getx/database/entitys/page_properties.dart';
import 'package:rg2_flutter_getx/database/entitys/phase_position_item.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';

class Repository extends GetxController {
  MainDao _mainDao = Get.find();
  PagePropertiesDao _propertiesDao = Get.find();
  MovesDao _movesDao = Get.find();
  PhasePositionDao _positionsDao = Get.find();
  TimesDao _timesDao = Get.find();

  List<MainDBItem> _cache = [];

  Future<List<MainDBItem>> getMainDBItems(String phase) async {
    //if (_cache.isEmpty) { _cache = await _mainDao.getAllItems();}
    var result = await _mainDao.getPhase(phase);
    return result;
  }

  Future<List<MainDBItem>> getSubMenuList() async {
    var result = await _mainDao.getSubMenuList();
    return result;
  }

  Future<List<MainDBItem>> getFavourites() async {
    var result = await _mainDao.getFavourites();
    return result;
  }

  Future<List<MainDBItem>> getPhasePages(String phase) async {
    var result = await _mainDao.getPhasePages(phase);
    return result;
  }

  updateMainDBItem(MainDBItem item) async {
    print("repo updateItem $item");
    _mainDao.updateItem(item);
  }

  Future<int> updateMainDBItems(List<MainDBItem> items) async {
    print("repo updateItems $items");
    return await _mainDao.updateItems(items);
  }

  //----------------------------------------------

  Future<List<PageProperties>> getCubeTypes() async {
    var result = await _propertiesDao.getAllItems();
    print("cubeTypes = $result");
    //await Future.delayed(const Duration(seconds: 1), () {});
    return result;
  }

  Future<int> updateCubeType(PageProperties item) async {
    return await _propertiesDao.updateItem(item);
  }

  //-----------------------------------------------

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

  Future<List<TimeNoteItem>> getAllTimeNoteList() async {
    return await _timesDao.getAllItems();
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
  
  
}
