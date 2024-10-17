import 'package:get/get.dart';
import 'package:rg2/controllers/db_controller.dart';
import 'package:rg2/database/daos/main_dao.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/utils/my_logger.dart';

class MainRepository extends GetxController {
  final MainDao _mainDao = Get.find();

  String _userId = "";

  Function(List<MainDBItem> items) favouritesUpdateCallback;
  Function(List<MainDBItem> items) detailUpdateCacheCallback;
  Function(List<MainDBItem> items) learnUpdateMainCacheCallback;


  //--------------- методы для работы с локальной базой room ----------------

  Future<MainDBItem> getMainDBItem(String phase, int id) async {
    //logPrint("getMainDBItem $phase $id");
    var result = await _mainDao.getItem(phase, id);
    return result;
  }

  Future<List<MainDBItem>> getMainDBItems(String phase) async {
    //logPrint("getMainDBItems $phase");
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


  /// Получаем список записей отображаемых в детальной информации для данной фазы
  /// т.е. записей у которых url <> "submenu" (не являются ссылкой на другую фазу)
  Future<List<MainDBItem>> getPhasePages(String phase) async {
    var result = await _mainDao.getPhasePages(phase, "submenu");
    logPrint("getPhasePages - $result");
    return result;
  }

  /// Обновляем одну запись в базе
  Future<int> updateMainDBItem(MainDBItem item) async {
    logPrint("repo updateItem $item ${item.comment}");
    return await _mainDao.updateItem(item);
  }

  /// Обновляем список записей в базе
  Future<int> updateMainDBItems(List<MainDBItem> items) async {
    //logPrint("repo updateItems $items");
    return await _mainDao.updateItems(items);
  }

  //-------------------- методы для работы с FBS ------------------------
  // методы для работы с избранным


  /// Обновляем список избранного в локальной базе и кэшах: обучалок, деталки и избранного
  Future updateFavouritesInLocalDBAndCaches(List<MainDBItem> mainDBItems) async {
    logPrint("обновляем список в локальной базе $mainDBItems");
    await updateMainDBItems(mainDBItems);

    // обновляем данные в кэше основного меню обучалок
    if (learnUpdateMainCacheCallback != null) {
      await learnUpdateMainCacheCallback(mainDBItems);
    }

    // обновляем данные в кэше избранного
    if (favouritesUpdateCallback != null) {
      await favouritesUpdateCallback(mainDBItems);
    }
  }


  //------------------------ методы для работы с комментариями -----------------------


  /// Добавить или обновить комментарий в FBS и локальной базе
  void addOrUpdateComment(MainDBItem item) {
    logPrint("_addOrUpdateCommentInBase = $item, userId = $_userId");
    // обновляем в локальной базе
    updateMainDBItem(item);
  }

  /// Обновляем список комментов в локальной базе и кэшах: обучалок, деталки и избранного
  Future updateCommentsInLocalDBAndCaches(List<MainDBItem> mainDBItems) async {
    logPrint("обновляем список в локальной базе $mainDBItems");
    await updateMainDBItems(mainDBItems);
    _updateItemsInCache(mainDBItems);
  }

  /// Очищаем все комментарии в локальной базе и кэшах
  Future clearCommentsInLocalDBAndCaches() async {
    logPrint("clearCommentsInLocalDBAndCaches - очищаем комментарии в локальной базе и кэшах");
    await _mainDao.clearAllComments();

    final DBController _dbController = Get.find();
    List<MainDBItem> mainDBItems = await _dbController.initComments();
    mainDBItems.forEach((mainDBItem) => addOrUpdateComment(mainDBItem));

    // обновляем все кэши
    List<MainDBItem> allMainDBItems = await _mainDao.getAllItems();
    logPrint("clearCommentsInLocalDBAndCaches - ${allMainDBItems.length} - $allMainDBItems");
    _updateItemsInCache(allMainDBItems);
  }

  /// Обновляем данные в кэшах
  _updateItemsInCache(List<MainDBItem> mainDBItems) async {
    // обновляем данные в кэше основного меню обучалок
    if (learnUpdateMainCacheCallback != null) {
      learnUpdateMainCacheCallback(mainDBItems);
    }
    // обновляем комментарии, если задан колбэк и получили не null в listCommentItems
    if (detailUpdateCacheCallback != null) {
      // вызываем колбэк, он находится в learnDetailController
      detailUpdateCacheCallback(mainDBItems);
    }
  }

}