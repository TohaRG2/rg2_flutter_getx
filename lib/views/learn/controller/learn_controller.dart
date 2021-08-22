import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/ads/ad_show_controller.dart';
import 'package:rg2/controllers/repository/main_repository.dart';
import 'package:rg2/controllers/repository/repository.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/database/entitys/phase_position_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';
import 'package:rg2/views/learn/detail/learn_redirect_page.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class LearnController extends GetxController {
  final MainRepository _mainRepo = Get.find();
  final Repository _repo = Get.find();
  final SettingsController _settings = Get.find();
  final FavouriteController _favController = Get.find();



  double curPositionInList = 0.0;
  final _backIconPath = "assets/images/icons/back_arrow.png";

  final searchEditingController = TextEditingController();
  final searchFocusNode = FocusNode();
  final RxBool _showSearchResult = false.obs;
    bool get showSearchResult => _showSearchResult.value;
  List<MainDBItem> allPuzzles = [];
  RxList<MainDBItem> _searchList  = <MainDBItem>[].obs;
    List<MainDBItem> get searchList  => _searchList;

  // Список со свойствами страниц
  RxList<PageProperties> pages = <PageProperties>[].obs;
  Map<String, double> phasesPositions = Map();

  RxInt _curPageNumber =  1.obs;
  int get curPageNumber => _curPageNumber.value;
  set curPageNumber(value) {
    _curPageNumber.value = value;
    _settings.currentPageNumber = value;
  }

  @override
  onInit() {
    super.onInit();
    logPrint("Init LearnController");
    curPageNumber = _settings.currentPageNumber;
    _mainRepo.learnUpdateMainCacheCallback = _updateItemsInCache;
  }

  searchInitialization() {
    logPrint("searchInitialization");
    searchEditingController.addListener(searchTextListener);
    searchFocusNode.addListener(searchFocusNodeListener);
    final isPurchaseEnabled = _settings.isAllPuzzlesEnabled;
    final isGodModeEnabled = _settings.godMode;
    _mainRepo.getSubMenuList().then((List<MainDBItem> subMenuList) {
      allPuzzles = subMenuList;
      allPuzzles.sort((item1, item2) => item1.title.compareTo(item2.title));
      allPuzzles.forEach((MainDBItem item) {
        final rootPhase = MainDBItem.getRootPhaseFor(item.phase);
        final pageNumber = _getPageByRoot(rootPhase);
        final isItemEnabled = (isPurchaseEnabled || pageNumber < 3 || (pageNumber < 4 && Platform.isAndroid) || isGodModeEnabled);
        if (isItemEnabled) {
          item.subId = 1;
        } else {
          item.subId = 0;
        }
        // logPrint("searchInitialization - ${item.subId} - $rootPhase - $pageNumber -  ${item.title} ");
      });
    });
  }

  void searchFocusNodeListener() {
    // if (searchFocusNode.hasFocus) {
    //   searchInitialization();
    // }
  }

  void onSearchClearButtonPressed(){
    logPrint("onSearchClearButtonPressed - ");
    searchEditingController.text = '';
    searchFocusNode.unfocus();
    _showSearchResult.value = false;
    update();
  }

  void searchTextListener() {
    String sText = searchEditingController.text;
    logPrint("searchTextListener - $sText");
    _showSearchResult.value = true;
    if (sText.isNotEmpty) {
      _searchList.assignAll(allPuzzles.where(
          (mainDBItem) => mainDBItem.title.toLowerCase().contains(sText.toLowerCase())
      ));
    } else {
      _searchList.assignAll(allPuzzles);
    }
    update();
  }


  Future<void> loadPages() async {
    await _loadBackPhases();
    await _getPagesFromBase();
    await _setCurrentPhasesObsLists();
    await _getPhasesPositions();
    searchInitialization();
  }

  /// Заполняем currentList для всех фаз
  Future _setCurrentPhasesObsLists() async {
    for (int i = 0; i < pages.length; i++) {
      var phase = pages[i].currentPhase;
      //logPrint("i = $i, phase = $phase");
      pages[i].currentList = <MainDBItem>[].obs;
      pages[i].currentList.assignAll(await _getMenuItemsListFor(phase, i));
    }
  }

  /// Получаем pages из базы (без currentList)
  Future _getPagesFromBase() async {
    if (pages.isEmpty) {
      pages.clear();
      var list = await _repo.getCubeTypes();
      pages.assignAll(list);
    }
  }

  /// Инициализируем список позиций из базы
  Future _getPhasesPositions() async {
    List<PhasePositionItem> list = await _repo.getAllPositionsList();
    phasesPositions.clear();
    list.forEach((element) {
      phasesPositions[element.phase] = element.position;
    });
    logPrint("Инициализация списка позиций завершена: $list");
  }

  /// Вызываем по тапу на сердечко и
  /// меняем статус избранного для указанного элемента
  changeFavStatus(MainDBItem item) {
    logPrint("changeFavStatus - $item, curPage - $curPageNumber");
    logPrint("fav - ${_favController.favourites}");
    // сохраняем позицию скрола
    saveListPositionForPhase(item.phase);

    var index = pages[curPageNumber].currentList.indexOf(item);

    logPrint("index = $index, fav - ${_favController.favourites}");
    if (index != -1) {
      item.isFavourite = !item.isFavourite;
      pages[curPageNumber].currentList[index] = item;              // Обновляем элемент на текущей странице
      _favController.updateInFavourites(item);
    } else {
      logPrint("Error. Element $item not found in ${pages[curPageNumber].currentList}");
      Get.snackbar("Что-то пошло не так!!!",
          "Can't add to Favourites. Element $item not found in ${pages[curPageNumber].currentList}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, duration: Duration(seconds: 8));
    }
  }

  /// Убираем элемент из Избранного
  removeElementFromFavourites(MainDBItem item) {
    logPrint("removeElementFromFavourites - $item");
    _favController.removeElementFromFavourites(item);
    updateItemInPages(item);
  }

  /// По фазе узнаем страницу и меняем на ней фазу
  changePageAndPhaseTo(String phase){
    logPrint("changePageAndPhaseTo $phase");
    final rootPhase = MainDBItem.getRootPhaseFor(phase);
    final pageNumber = _getPageByRoot(rootPhase);
    curPageNumber = pageNumber;
    changeCurrentPhaseTo(phase);
    update();
  }

  // /// Меняем номер текущей (отображаемой) страницы
  // changeCurrentPageNumberTo(int pageNumber) {
  //   logPrint("changeCurrentPageNumberTo $pageNumber");
  //   curPageNumber = pageNumber;
  //   _settings.currentPageNumber = pageNumber;
  // }

  /// Меняем текущую фазу по объекту MainDBItem
  changeCurrentPhaseWith(MainDBItem item) {
    changeCurrentPhaseTo(item.description);
  }

  ///Меняем текущую фазу на другую по ее имени
  changeCurrentPhaseTo(String phase) async {
    logPrint("Change phase to $phase, curPageN - $curPageNumber");
    saveListPositionForPhase(pages[curPageNumber].currentPhase);

    pages[curPageNumber].currentPhase = phase;
    logPrint("pages[$curPageNumber].currentPhase - updated");
    var list = await _getMenuItemsListFor(phase, curPageNumber);
    pages[curPageNumber].currentList.assignAll(list);
    _repo.updateCubeType(pages[curPageNumber]);
  }

  /// Сохраняем позицю скрола для фазы
  saveListPositionForPhase(String phase) {
    logPrint("savePositionFor $phase, $curPositionInList");
    phasesPositions[phase] = curPositionInList;
    _repo.updatePhasePosition(phase, phasesPositions[phase]);
  }

  ///делаем список для отображения по имени фазы и номеру страницы. Номер нужен для определения необходимости добавления пункта "..."
  Future<List<MainDBItem>> _getMenuItemsListFor(String phase, int pageNumber) async {
    //logPrint("_getMenuItemsListFor phase:$phase pageN:$pageNumber");
    var rootPhase = pages[pageNumber].rootPhase;
    var list = <MainDBItem>[];
    if (phase == Const.FAVOURITES) {
      list = await _mainRepo.getFavourites();
    } else {
      list = await _mainRepo.getMainDBItems(phase);
    }
    //Если фаза не главная, то добавляем переход на один уровень выше "..."
    if (phase != rootPhase) {
      var icon = _backIconPath;
      var backPhase = (rootPhase == Const.FAVOURITES)
          ? rootPhase
          : MainDBItem.backFrom[phase] ?? rootPhase;
      var backItem = MainDBItem(
          id: -1,
          phase: phase,
          title: "...",
          url: "submenu",
          icon: icon,
          description: backPhase);
      list.insert(0, backItem);
    }
    return list;
  }

  /// Получаем номер страницы по названию рут фазы
  int _getPageByRoot(String rootPhase) {
    var page = 0;
    pages.asMap().forEach((key, value) {
      if (value.rootPhase == rootPhase) page = key;
    });
    return page;
  }

  ///Обновляем элемент если он есть в текущем кэше страниц (pages) в каком-нибудь currentList страницы
  void updateItemInPages(MainDBItem item) {
    logPrint("updateItemInPages - $item");
    _updateItemInCache(item);
    _favController.updateInFavourites(item);
  }

  /// Проверяем есть ли item в pages (в кэше) и обновляем его, если есть
  void _updateItemInCache(MainDBItem item) {
    pages.forEach((pageProp) {
      List<MainDBItem> list = pageProp.currentList;
      var index = list?.indexWhere((element) => element.phase == item.phase && element.id == item.id) ?? -1;
      if (index >= 0) {
        //logPrint("find in page ${pageProp.number}");
        List<MainDBItem> list = pageProp.currentList.toList();
        list[index] = item;
        pages[pageProp.number].currentList.assignAll(list);
      }
    });
  }

  /// Проверяем есть ли элементы списка в кэше и обновляем при необходимости кэш
  void _updateItemsInCache(List<MainDBItem> items) {
    // logPrint("_updateItemsInCache - $items");
    items.forEach((item) { 
      _updateItemInCache(item); 
    });
  }

  ///Инициализируем список backFrom фазами на которые нужно возвращаться с текущей. типа backFrom['G2F'] = 'MAIN3X3'
  ///для корневых(основных) фаз backFrom будет возвращать null
  _loadBackPhases() async {
    var subMenusList = await _mainRepo.getSubMenuList();
    //logPrint("subMenusList - $subMenusList");
    var backFrom = Map<String, String>();
    subMenusList.forEach((element) {
      backFrom[element.description] = element.phase;
    });
    MainDBItem.backFrom = backFrom;
  }

  ///возвращаем false если вернулись на одну фазу назад или true если и так в главной фазе (можно выходить из приложения)
  bool canReturnToOnePhaseBack() {
    //saveCurrentPhasePosition(); - сохраняем текущую позицию
    var fromPhase = pages[curPageNumber].currentPhase;
    var toPhase = MainDBItem.backFrom[fromPhase] ?? fromPhase;
    if (toPhase != fromPhase) {
      changeCurrentPhaseTo(toPhase);
      return false;
    } else {
      return true;
    }
  }

  /// получаем позицию для прокрутки по номеру текущей страницы
  double getPositionForPage(int pageNumber) {
    var curPhase = pages[pageNumber].currentPhase;
    var position = phasesPositions[curPhase] ?? 0.0;
    logPrint("position for $curPhase - $position, page - $pageNumber, curPage = $curPageNumber, curPos = $curPositionInList");
    if (pageNumber != curPageNumber) {
      saveListPositionForPhase(pages[curPageNumber].currentPhase);
    }
    curPositionInList = position;
    return position;
  }

  RxBool _hasDetailController = false.obs;
    bool get hasDetailController => _hasDetailController.value;
    set hasDetailController(value) => _hasDetailController.value = value;

  String redirectPhase = "";
  int redirectId = 0;
  bool isNeedRedirectToDetail = false;

  setRedirectPage(String phase, int id){
    logPrint("setRedirectPage - $phase, $id");
    redirectPhase = phase;
    redirectId = id;
    isNeedRedirectToDetail = true;
  }

  resetRedirectPage(){
    logPrint("resetRedirectPage - ");
    redirectPhase = "";
    redirectId = 0;
    isNeedRedirectToDetail = false;
  }

  /// Обрабатываем клик на запись в избранном
  onFavouriteItemClick(MainDBItem item) {
    // переходим на "Обучалки" в любом случае
    _settings.bottomItem = 0;
    // Если submenu, то меняем фазу в основном меню
    if (item.url == "submenu") {
      logPrint("onTap -> submenu -> change to ${item.description}");
      changePageAndPhaseTo(item.description);
      logPrint("rawRoute - ${Get.rawRoute} currentRoute - ${Get.currentRoute} previousRoute - ${Get.previousRoute}");
      if (Get.isDialogOpen) { Get.back(); }
      while (Get.currentRoute != "/() => MainView" && Get.currentRoute != "/") {
        Get.back();
        // logPrint("CurRoute - ${Get.currentRoute}");
      }
      logPrint("GetBack complete");
    } else {
      // Если url не submenu, значит переходим в детальную информацию, т.е. в обучалку
      logPrint("onTap -> not submenu -> change detailScreen to ${item.phase}");
      changePageAndPhaseTo(item.phase);
      if (Get.isDialogOpen) { Get.back(); }
      // while (Get.currentRoute != "/() => MainView"  && Get.currentRoute != "/") {
      //   Get.back();
      //   logPrint("CurRoute - ${Get.currentRoute}");
      // }
      logPrint("GetBack complete -> Get.to(LearnDetailScreen(${item.phase}, ${item.id})");
      //setRedirectPage(item.phase, item.id);
      if (Get.currentRoute == "/() => MainView" || Get.currentRoute == "/") {
        logPrint("onTap Get.to ");
        Get.to(() => LearnDetailScreen(item.phase, item.id), transition: Transition.cupertino);
      } else {
        logPrint("onTap Get.off ");
        Get.off(() => LearnRedirectPage(item.phase, item.id));
      }
    }
  }


}