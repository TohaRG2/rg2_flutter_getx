import 'package:get/get.dart';
import 'package:rg2/controllers/repository/main_repository.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/utils/my_logger.dart';

class FavouriteController extends GetxController {
  MainRepository _mainRepo = Get.find();

  @override
  void onInit() async {
    super.onInit();
    logPrint("onInit - FavouriteController");
    reloadFromBase();
    _mainRepo.favouritesUpdateCallback = _setFavourites;
  }

  final RxList<MainDBItem> __favourites = <MainDBItem>[].obs;
  List<MainDBItem> get favourites => __favourites;
  set _favourites(List<MainDBItem> items) {
    __favourites.assignAll(items);
    _mainRepo.addOrUpdateFavourites(items);
  }

  /// Перечитываем список избранного из базы и если надо апдейтим в FB
  void reloadFromBase() async {
    logPrint("ReloadFavourites");
    _favourites = await _mainRepo.getFavourites();
    //logPrint("favourites - $favourites");
  }

  /// меняем местами два элемента в списке избранного. Переписываем списком с новым порядком
  void reorderFavouritesElements(List<MainDBItem> newList){
    _favourites = newList;
    _updateFavouritesSubIds();
  }

  /// Обновлеем индексы порядка вывода для избранного
  /// и сохраняем записи в базе
  void _updateFavouritesSubIds() {
    Map<int, MainDBItem> map = favourites.asMap();
    map.forEach((index, item) {
      item.subId = index;
    });
    _favourites = map.values.toList();
    _mainRepo.updateMainDBItems(map.values.toList());
  }

  /// Обновляем избранное у элемента
  void updateInFavourites(MainDBItem item) {
    logPrint("updateInFavourites - $item, \n curFav = $favourites");
    var index = favourites.indexWhere((e) => (e.id == item.id && e.phase == item.phase));
    if (item.isFavourite) {
      // если этот элемент избранного
      if (index == -1) {
        // и его нет в избранном, то добавляем
        favourites.insert(0, item);
      } else {
        // если уже есть, то обновляем
        favourites[index] = item;
      }
    } else {
      // убираем из избранного, если item там есть, но его там не должно быть
      if (index >= 0) {
        favourites.removeAt(index);
        item.subId = 0; // на всякий случай обнуляем индекс (не обязательно)
        _mainRepo.updateMainDBItem(item);
      }
    }
    _updateFavouritesSubIds();
  }

  /// Убираем элемент из Избранного
  void removeElementFromFavourites(MainDBItem item) {
    favourites.removeAt(item.subId);
    _updateFavouritesSubIds();
    item.isFavourite = false;
    item.subId = 0;
  }

  /// Задаем новое избранное (из списка) без сохранения в firebase
  void _setFavourites(List<MainDBItem> items) {
    logPrint("_updateCallBackForFavourites - $items");
    __favourites.assignAll(items);
  }

  /// Перемешиваем избранное
  void shuffleFavourites(){
    favourites.shuffle();
    _updateFavouritesSubIds();
  }
}