import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/controllers/settings/global_settings_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/database/entitys/phase_position_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class LearnController extends GetxController {
  final Repository _repo = Get.find();
  final SettingsController _settings = Get.find();
  final FavouriteController _favController = Get.find();
  final GlobalSettingsController _globalSettings = Get.find();

  double curPositionInList = 0.0;
  String _backIconPath = "assets/images/icons/back_arrow.svg";

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
    _globalSettings.favouriteUpdateCallback = _favCallback;
  }


  Future<void> loadPages() async {
    await _loadBackPhases();
    await _getPagesFromBase();
    await _setCurrentPhasesObsLists();
    await _getPhasesPositions();
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
    // сохраняем позицию скрола
    saveListPositionForPhase(item.phase);

    var index = pages[curPageNumber].currentList.indexOf(item);

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
    var rootPhase = MainDBItem.getRootPhaseFor(phase);
    var pageNumber = _getPageByRoot(rootPhase);
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
      list = await _repo.getFavourites();
    } else {
      list = await _repo.getMainDBItems(phase);
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

  ///Обновляем элемент если он есть в текущем кэше (pages) в каком-нибудь currentList
  void updateItemInPages(MainDBItem item) {
    logPrint("updateItemInPages - $item");
    _updateItemInCache(item);
    _favController.updateInFavourites(item);
  }

  /// Проверяем есть ли item в pages (в кэше) и обновляем его, если есть
  void _updateItemInCache(MainDBItem item) {
    pages.forEach((pageProp) {
      List<MainDBItem> list = pageProp.currentList;
      var index = list.indexWhere((element) => element.phase == item.phase && element.id == item.id);
      if (index != -1) {
        logPrint("find in page ${pageProp.number}");
        List<MainDBItem> list = pageProp.currentList.toList();
        list[index] = item;
        pages[pageProp.number].currentList.assignAll(list);
      }
    });
  }

  ///Инициализируем список backFrom фазами на которые нужно возвращаться с текущей. типа backFrom['G2F'] = 'MAIN3X3'
  ///для корневых(основных) фаз backFrom будет возвращать null
  _loadBackPhases() async {
    var subMenusList = await _repo.getSubMenuList();
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
    if (curPageNumber == 0) {
      if (fromPhase != Const.FAVOURITES) {
        toPhase = Const.FAVOURITES;
      }
    }
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


  /// Колбэк вызываемый при получении избранного от firebase
  _favCallback(List<FavItem> favItems) async {
    logPrint("_favCallback - получили список из firebase $favItems");
    // удалить все записи избранного в локальной базе
    // сначала копируем из текущего избранного
    var mainDBItems = _favController.favourites.toList();
    // снимаем признак избранного
    mainDBItems.forEach((mainDBItem) {
      mainDBItem.isFavourite = false;
      mainDBItem.subId = 0;
      _updateItemInCache(mainDBItem);
    });
    // обновляем записи в базе
    _repo.updateMainDBItems(mainDBItems);
    // создаем новый список, на основе пришедшего из firebase
    mainDBItems.clear();
    // logPrint("_favCallback - очистили список");
    // асинхронный цикл для всех записей в favItems, с ожидаем выполнения операции над каждым элементом
    await Future.forEach(favItems,(favItem) async {
      var mainDBItem = await _repo.getMainDBItem(favItem.phase, favItem.id);
      mainDBItem.isFavourite = true;
      mainDBItem.subId = favItem.subId;
      mainDBItems.add(mainDBItem);
      _updateItemInCache(mainDBItem);
    });
    // logPrint("_favCallback - задаем новый список $tmpMainDBItems");
    _favController.setFavourites(mainDBItems);
  }


}