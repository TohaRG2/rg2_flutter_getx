import 'package:get/get.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/database/entitys/main_db_item.dart';

import 'learn_controller.dart';

class LearnDetailController extends GetxController {
  Repository _repo = Get.find();
  LearnController _learnController = Get.find();

  RxInt _curPageNumberObs = 0.obs;
  int get curPageNumber => _curPageNumberObs.value;
  set _curPageNumber(value) => _curPageNumberObs.value = value;

  RxBool _isBottomBarShowing = true.obs;
  bool get isBottomBarShowing => _isBottomBarShowing.value;
  set isBottomBarShowing(value) {
    _isBottomBarShowing.value = value;
  }

  RxString _obsPhase = "".obs;
  String get obsPhase => _obsPhase.value;
  set obsPhase(value) {
    _obsPhase.value = value;
  }

  Rx<MainDBItem> _currentItem = MainDBItem(id: 0, phase: "").obs;
  MainDBItem get currentItem => _currentItem.value;
  set currentItem(value) {
    _currentItem.value = value;
  }
  
  RxList<MainDBItem> _currentItems = <MainDBItem>[].obs;
  List<MainDBItem> get currentItems => _currentItems;
  set currentItems(items) {
    _currentItems.assignAll(items);
  }

  Future<void> loadPages(String phase, int id) async {
    obsPhase = phase;
    var list = await _repo.getPhasePages(phase);
    currentItems.assignAll(list);
    changeCurrentPageNumberTo(_getNumFromId(id));

    //logPrint("LoadPages Num = ${_getNumFromId(id)}. list = $list");
    //await Future.delayed(const Duration(seconds: 2), () {});
  }

  int _getNumFromId(int id) =>
      currentItems.indexWhere((element) => element.id == id);

  changeCurrentPageByItem(MainDBItem item) {
    changeCurrentPageNumberTo(_getNumFromId(item.id));
  }

  /// Меняем номер текущей страницы на num
  changeCurrentPageNumberTo(int num) {
    //logPrint("changeCurrentItemTo $num, ${currentItems.value}");
    _curPageNumber = num;
    currentItem = currentItems[num];
  }

  /// Комментарий для текущей страницы viewPager'a
  String get currentComment => currentItems[curPageNumber].comment;

  /// Устанавливаем коммент для текущего элемента
  setCurrentCommentTo(String text) {
    var item = currentItems[curPageNumber];
    item.comment = text;
    currentItems[curPageNumber] = item;
    _learnController.updateItemInPages(item);
    _repo.updateMainDBItem(item);
  }

  /// Меняем статус избранного на противоположное и обновляем в кэше страниц и в списке избранного
  changeCurrentFavStatus() {
    currentItem = null;
    var item = currentItems[curPageNumber];
    item.isFavourite = !item.isFavourite;
    currentItems[curPageNumber] = item;
    currentItem = item;
    _learnController.updateItemInPages(item);
    _repo.updateMainDBItem(item);
  }

  String getImagePathFromAssets(String shortPath) {
    return currentItem.getAssetFilePath();
  }

  String getAssetPath(){
    return currentItem.getAssetPath();
  }

}
