import 'package:get/get.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/database/entitys/main_db_item.dart';

import 'learn_controller.dart';

class LearnDetailController extends GetxController {
  Repository _repo = Get.find();
  LearnController _learnController = Get.find();

  RxInt curPageNumberObs = 0.obs;
  int get curPageNumber => curPageNumberObs.value;

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


  //TODO Переделать на _currentItem и сделать get/set
  Rx<MainDBItem> currentItem = MainDBItem(id: 0, phase: "").obs;
  RxList<MainDBItem> currentItems = <MainDBItem>[].obs;

  Future<void> loadPages(String phase, int id) async {
    obsPhase = phase;
    var list = await _repo.getPhasePages(phase);
    currentItems.assignAll(list);
    changeCurrentPageNumberTo(_getNumFromId(id));

    //print("LoadPages Num = ${_getNumFromId(id)}. list = $list");
    //await Future.delayed(const Duration(seconds: 2), () {});
  }

  int _getNumFromId(int id) =>
      currentItems.indexWhere((element) => element.id == id);

  changeCurrentPageByItem(MainDBItem item) {
    changeCurrentPageNumberTo(_getNumFromId(item.id));
  }


  changeCurrentPageNumberTo(int num) {
    //print("changeCurrentItemTo $num, ${currentItems.value}");
    curPageNumberObs.value = num;
    currentItem.value = currentItems[num];
  }

  String getCurrentComment() => currentItems[curPageNumber].comment;

  setCurrentCommentTo(String text) {
    var item = currentItems[curPageNumber];
    item.comment = text;
    currentItems[curPageNumber] = item;
    _learnController.updateItemInPages(item);
    _repo.updateMainDBItem(item);
  }

  changeCurrentFavStatus() {
    currentItem.value = null;
    var item = currentItems[curPageNumber];
    item.isFavourite = !item.isFavourite;
    currentItems[curPageNumber] = item;
    currentItem.value = item;
    //_learnController
    _learnController.updateItemInPages(item);
    _repo.updateMainDBItem(item);
  }

  String getImagePathFromAssets(String shortPath) {
    return _learnController.getAssetFilePath(shortPath, currentItem.value.phase);
  }

  String getAssetPath(){
    return _learnController.getAssetPath(currentItem.value.phase);
  }

}
