import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/database/entitys/main_db_item.dart';

class FavouriteController extends GetxController {
  Repository _repo = Get.find();

  @override
  void onInit() async {
    super.onInit();
    reloadFromBase();
  }

  final _favourites = <MainDBItem>[].obs;
  List<MainDBItem> get favourites => _favourites;
  set favourites(value) {
    _favourites.assignAll(value);
  }

  /// Перечитываем список избранного из базы
  reloadFromBase() async {
    print("ReloadFavourites");
    favourites = await _repo.getFavourites();
    print("favourites - $favourites");
  }

  // меняем местами два элемента в списке избранного. Переписываем списком с новым порядком
  reorderFavouritesElements(List<MainDBItem> newList){
    favourites = newList;
    _updateFavouritesSubIds();
  }

  /// Обновлеем индексы порядка вывода для избранного в соответствии с тем, как расположены элементы в списке pages[0].currentList
  /// и сохраняем записи в базе
  _updateFavouritesSubIds() {
    Map<int, MainDBItem> map = favourites.asMap();
    map.forEach((index, item) {
      item.subId = index;
    });
    favourites = map.values.toList();
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