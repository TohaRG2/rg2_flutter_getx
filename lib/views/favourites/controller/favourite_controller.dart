import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/controllers/settings/global_settings_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/utils/my_logger.dart';

class FavouriteController extends GetxController {
  Repository _repo = Get.find();
  final GlobalSettingsController _settingsController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    reloadFromBase();
    _settingsController.favouriteUpdateCallback = _favCallback;
  }

  final RxList<MainDBItem> __favourites = <MainDBItem>[].obs;
  List<MainDBItem> get favourites => __favourites;
  set _favourites(List<MainDBItem> dbItems) {
    __favourites.assignAll(dbItems);
    var favItems = dbItems.map((mainDBItem) =>
        FavItem(id: mainDBItem.id, phase: mainDBItem.phase, subId: mainDBItem.subId)
    ).toList();
    _settingsController.updateFavourites(favItems);
  }

  /// Колбэк вызываемый при получении данных от firebase
  _favCallback(List<FavItem> favItems) async {
    logPrint("_favCallback - получили список из firebase $favourites");
    // удалить все записи избранного в локальной базе
    var delList = favourites.toList();
    favourites.forEach((mainDBItem) {
      mainDBItem.isFavourite = false;
      mainDBItem.subId = 0;
    });
    _repo.updateMainDBItems(favourites);
    reloadFromBase();
    favItems.forEach((element) {

    });
    //TODO Обработать список из базы и обновить избранное

  }

  /// Перечитываем список избранного из базы и если надо апдейтим в FB
  reloadFromBase() async {
    logPrint("ReloadFavourites");
    _favourites = await _repo.getFavourites();
    //logPrint("favourites - $favourites");
  }

  /// меняем местами два элемента в списке избранного. Переписываем списком с новым порядком
  reorderFavouritesElements(List<MainDBItem> newList){
    _favourites = newList;
    _updateFavouritesSubIds();
  }

  /// Обновлеем индексы порядка вывода для избранного
  /// и сохраняем записи в базе
  _updateFavouritesSubIds() {
    Map<int, MainDBItem> map = favourites.asMap();
    map.forEach((index, item) {
      item.subId = index;
    });
    _favourites = map.values.toList();
    _repo.updateMainDBItems(map.values.toList());
  }

  /// Обновляем избранное у элемента
  updateInFavourites(MainDBItem item) {
    if (item.isFavourite) {
      // добавляем в избранное
      favourites.insert(0, item);
    } else {
      // убираем из избранного
      var index = favourites.indexWhere((e) => (e.id == item.id && e.phase == item.phase));
      if (index >= 0) favourites.removeAt(index);
      item.subId = 0; // на всякий случай обнуляем индекс (не обязательно)
      _repo.updateMainDBItem(item);
    }
    _updateFavouritesSubIds();
  }

  /// Убираем элемент из Избранного
  removeElementFromFavourites(MainDBItem item) {
    favourites.removeAt(item.subId);
    _updateFavouritesSubIds();
    item.isFavourite = false;
    item.subId = 0;
  }
}