import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/db_controller.dart';
import 'package:rg2/database/cloud_database.dart';
import 'package:rg2/database/daos/main_dao.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/fire_entitys/comment_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';

class MainRepository extends GetxController {
  final MainDao _mainDao = Get.find();
  final CloudDatabase _cloudDB = Get.find();
  final AuthController _auth = Get.find();

  String _userId = "";

  Function(List<MainDBItem> items) favouritesUpdateCallback;
  Function(List<MainDBItem> items) detailUpdateCacheCallback;
  Function(List<MainDBItem> items) learnUpdateMainCacheCallback;

  @override
  onInit() async {
    super.onInit();
    logPrint("onInit - MainRepository ${_auth.user?.uid}");
    // подписываемся на получение изменений firebaseUser, при изменении вызываем _userAuthChanged не чаще, чем раз в 2 сек
    debounce(_auth.firebaseUser, _userAuthChanged, time: Duration(seconds: 2));
    // если к моменту инициализации пользователь уже залогинен, то апдейтим данные из FBS
    if (_auth.user != null) {
      _userAuthChanged(_auth.user);
    }
  }

  /// Что-то поменялось в аутентификации пользователя
  Future<void> _userAuthChanged(User user) async {
    logPrint("MainRepository._userAuthChanged - ${user?.uid}");
    _userId = (user == null) ? "" : user?.uid;
    if (_userId != "") {
      await _updateFavourites();
      await updateCommentsFromFBS();
      await _cloudDB.updateGlobalEntersCount(_userId);
    }
  }



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

  /// Получаем список избранного из FBS и обновляем избранное и кэши полученным списком
  Future _updateFavourites() async {
    //logPrint("_updateFavourites - если в FBS есть избранное, то снимаем признак избранного у текущих записей и обновляем в базе и кэшах");

    List<FavItem> favItems = await _getFavourites();
    var mainDBItems = await getFavourites();

    // Если в FBS есть избранное и оно не пустое
    if (favItems != null && favItems.length != 0) {
      // снимаем признак избранного у всех текущих записей
      mainDBItems.forEach((mainDBItem) {
        mainDBItem.isFavourite = false;
        mainDBItem.subId = 0;
      });
      // по уму, не надо обновлять список в кэше избранного, но чуть ниже его все равно перезапишем
      await updateFavouritesInLocalDBAndCaches(mainDBItems);

      mainDBItems.clear();
      // асинхронный цикл для всех записей в favItems, с ожиданием выполнения операции над каждым элементом
      await Future.forEach(favItems,(FavItem favItem) async {
        var mainDBItem = await getMainDBItem(favItem.phase, favItem.id);
        mainDBItem.isFavourite = true;
        mainDBItem.subId = favItem.subId;
        mainDBItems.add(mainDBItem);
      });
      // обновляем кэши уже списком созданным из записей FBS
      await updateFavouritesInLocalDBAndCaches(mainDBItems);
    } else {
      logPrint("_updateFavourites - в FBS нет избранного, перезаписываем локальным $mainDBItems");
      addOrUpdateCloudFavourites(mainDBItems);
    }
  }

  /// получаем список избранного из FBS
  Future<List<FavItem>> _getFavourites() async {
    //logPrint("_getFavourites - ");
    if (_userId != "") {
      return await _cloudDB.getFavourites(_userId);
    }
    return null;
  }

  /// Обновляем список избранного в FBS
  addOrUpdateCloudFavourites(List<MainDBItem> items) {
    //logPrint("setFavourites - $favourites");
    if (_userId != "") {
      var favItems = items.map((mainDBItem) =>
          FavItem(id: mainDBItem.id, phase: mainDBItem.phase, subId: mainDBItem.subId)
      ).toList();
      _cloudDB.addOrUpdateFavourites(_userId, favItems);
    }
  }


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

  /// Получаем комменты из FBS и обновляем их в локальной базе и на экране (кэше)
  Future updateCommentsFromFBS() async {
    logPrint("_updateComments - получаем комментарии из FBS");
    List<CommentItem> commentItems = await _getComments() ?? [];
    // асинхронный цикл для всех записей в commentItems, с ожиданием выполнения операции над каждым элементом
    List<MainDBItem> mainDBItems = [];
    await Future.forEach(commentItems,(CommentItem commentItem) async {
      var mainDBItem = await getMainDBItem(commentItem.phase, commentItem.id);
      mainDBItem.comment = commentItem.comment;
      mainDBItems.add(mainDBItem);
    });

    await updateCommentsInLocalDBAndCaches(mainDBItems);
  }

  /// получаем список всех сохраненных комментариев к этапам из FBS
  Future<List<CommentItem>> _getComments() async {
    //logPrint("_getComments - ");
    if (_userId != "") {
      return await _cloudDB.getComments(_userId);
    }
    return null;
  }

  /// Добавить или обновить комментарий в FBS и локальной базе
  void addOrUpdateComment(MainDBItem item) {
    logPrint("_addOrUpdateCommentInBase = $item, userId = $_userId");
    if (_userId != "") {
      var commentItem = CommentItem.fromMainDbItem(item);
      // удаляем или добавляем/апдейтим коммент
      if (commentItem.comment == "") {
        _cloudDB.deleteComment(_userId, commentItem);
      } else {
        _cloudDB.addOrUpdateComment(_userId, commentItem);
      }
    }
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

  /// Очищаем все комментарии в FBS
  Future clearAllCommentsInFBS() async {
    logPrint("clearAllCommentsInFBS - очищаем все комменты в FBS");
    if (_userId != "") {
      await _cloudDB.clearAllComments(_userId);
    }
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