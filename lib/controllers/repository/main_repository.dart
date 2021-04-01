import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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
    logPrint("onInit - MainRepository ${_auth.firebaseUser.value?.uid}");
    // подписываемся на получение изменений firebaseUser, при изменении вызываем _userAuthChanged не чаще, чем раз в 2 сек
    debounce(_auth.firebaseUser, _userAuthChanged, time: Duration(seconds: 2));
    // если к моменту инициализации пользователь уже залогинен, то апдейтим данные из FBS
    if (_auth.user != null) {
      _userAuthChanged(_auth.user);
    }
  }

  /// Что-то поменялось в аутентификации пользователя
  _userAuthChanged(User user) async {
    logPrint("MainRepository._userAuthChanged - ${user?.uid}");
    _userId = (user == null) ? "" : user?.uid;
    if (_userId != "") {
      await _updateFavourites();
      await _updateComments();
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
    //logPrint("repo updateItem $item");
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
    //logPrint("_updateFavourites - снимаем признак избранного у текущих записей и обновляем в базе и кэшах");
    var mainDBItems = await getFavourites();
    mainDBItems.forEach((mainDBItem) {
      mainDBItem.isFavourite = false;
      mainDBItem.subId = 0;
    });
    await updateListInLocalDBAndCaches(mainDBItems);

    //logPrint("_updateFavourites - получаем избранное из firebase");
    List<FavItem> favItems = await _getFavourites() ?? [];

    // асинхронный цикл для всех записей в favItems, с ожиданием выполнения операции над каждым элементом
    mainDBItems.clear();
    logPrint("_updateFavourites - reset $mainDBItems");
    await Future.forEach(favItems,(FavItem favItem) async {
      var mainDBItem = await getMainDBItem(favItem.phase, favItem.id);
      mainDBItem.isFavourite = true;
      mainDBItem.subId = favItem.subId;
      mainDBItems.add(mainDBItem);
    });

    await updateListInLocalDBAndCaches(mainDBItems);
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
  addOrUpdateFavourites(List<FavItem> favourites) {
    //logPrint("setFavourites - $favourites");
    if (_userId != "") {
      _cloudDB.addOrUpdateFavourites(_userId, favourites);
    }
  }

  //------------------------ методы для работы с комментариями -----------------------

  /// Получаем комменты из FBS и обновляем их в локальной базе и на экране (кэше)
  Future _updateComments() async {
    logPrint("_updateComments - получаем комментарии из FBS");
    List<CommentItem> commentItems = await _getComments() ?? [];

    // асинхронный цикл для всех записей в commentItems, с ожиданием выполнения операции над каждым элементом
    List<MainDBItem> mainDBItems = [];
    await Future.forEach(commentItems,(CommentItem commentItem) async {
      var mainDBItem = await getMainDBItem(commentItem.phase, commentItem.id);
      mainDBItem.comment = commentItem.comment;
      mainDBItems.add(mainDBItem);
    });

    await updateListInLocalDBAndCaches(mainDBItems);
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

  //------------------

  /// Обновляем список в локальной базе и кэшах: обучалок, деталки и избранного
  Future updateListInLocalDBAndCaches(List<MainDBItem> mainDBItems) async {
    // обновляем список в локальной базе
    await updateMainDBItems(mainDBItems);

    // обновляем данные в кэше основного меню обучалок
    if (learnUpdateMainCacheCallback != null) {
      learnUpdateMainCacheCallback(mainDBItems);
    }

    // обновляем данные в кэше избранного
    if (favouritesUpdateCallback != null) {
      favouritesUpdateCallback(mainDBItems);
    }

    // обновляем комментарии, если задан колбэк и получили не null в listCommentItems
    if (detailUpdateCacheCallback != null) {
      // вызываем колбэк, он находится в learnDetailController
      detailUpdateCacheCallback(mainDBItems);
    }
  }

}