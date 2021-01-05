import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/controllers/settings_controller.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';
import 'package:rg2_flutter_getx/database/entitys/page_properties.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

import 'learn_controller.dart';

class LearnDetailController extends GetxController {
  Repository _repo = Get.find();
  LearnController _learnController = Get.find();
  SettingsController _settings = Get.find();

  RxInt curPageNumberObs = 0.obs;
  int get curPageNumber => curPageNumberObs.value;


  RxString obsPhase = "".obs;
  Rx<MainDBItem> currentItem = MainDBItem(id: 0, phase: "").obs;
  RxList<MainDBItem> currentItems = <MainDBItem>[].obs;

  Future<void> loadPages(String phase, int id) async {
    obsPhase.value = phase;
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
