import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/controllers/settings_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/database/entitys/phase_position_item.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';

class LearnController extends GetxController {
  Repository _repo = Get.find();
  SettingsController _settings = Get.find();
  FavouriteController _favController = Get.find();

  int curPageNumber = 2;
  double curPositionInList = 0.0;
  String _backIconPath = "assets/images/icons/back_arrow.svg";

  RxList<PageProperties> pages = <PageProperties>[].obs;
  Map<String, double> phasesPositions = Map();

  //var backFrom = Map<String, String>(); //map для получения предыдущей фазы, по ее названию

  @override
  onInit() {
    super.onInit();
    print("Init LearnController");
    curPageNumber = _settings.currentPageNumber.value;
  }


  Future<void> loadPages() async {
    await _loadBackPhases();
    await _getPagesFromBase();
    //await _setFavouritesObsList();
    await _setCurrentPhasesObsLists();
    await _getPhasesPositions();
  }

  /// Заполняем currentList для остальных фаз, кроме избранного
  Future _setCurrentPhasesObsLists() async {
    for (int i = 0; i < pages.length; i++) {
      var phase = pages[i].currentPhase;
      //print("i = $i, phase = $phase");
      pages[i].currentList = <MainDBItem>[].obs;
      pages[i].currentList.assignAll(await _getMenuItemsListFor(phase, i));
    }
  }

  // Считываем избранное из базы и заносим в pages[0].currentList
  // Future _setFavouritesObsList() async {
  //   var list = await _repo.getFavourites();
  //   pages[0].currentList = <MainDBItem>[].obs;
  //   pages[0].currentList.assignAll(list);
  //   print("fav - $list");
  // }

  /// Получаем pages из базы (без currentList)
  Future _getPagesFromBase() async {
    if (pages.isEmpty) {
      pages.clear();
      var list = await _repo.getCubeTypes();
      pages.assignAll(list);
    }
  }

  Future _getPhasesPositions() async {
    List<PhasePositionItem> list = await _repo.getAllPositionsList();
    phasesPositions.clear();
    list.forEach((element) {
      phasesPositions[element.phase] = element.position;
    });
    print("PhasesPositionsFromBase $list");
  }

  /// Вызываем по тапу на сердечко и
  /// меняем статус избранного для указанного элемента
  changeFavStatus(MainDBItem item) {
    print("changeFavStatus - $item, curPage - $curPageNumber");
    // сохраняем позицию скрола
    saveListPositionForPhase(item.phase);

    var index = pages[curPageNumber].currentList.indexOf(item);

    if (index != -1) {
      item.isFavourite = !item.isFavourite;
      pages[curPageNumber].currentList[index] = item;              // Обновляем элемент на текущей странице
      _favController.updateInFavourites(item);
    } else {
      print("Error. Element $item not found in ${pages[curPageNumber].currentList}");
      Get.snackbar("Что-то пошло не так!!!",
          "Can't add to Favourites. Element $item not found in ${pages[curPageNumber].currentList}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, duration: Duration(seconds: 8));
    }
  }

  // /// Обновляем избранное у элемента
  // _updateInFavourites(MainDBItem item) {
  //   if (item.isFavourite) {
  //     // добавляем в избранное
  //     pages[0].currentList.insert(0, item);
  //   } else {
  //     // убираем из избранного
  //     var index = pages[0].currentList.indexWhere((e) => (e.id == item.id && e.phase == item.phase));
  //     if (index >= 0) pages[0].currentList.removeAt(index);
  //     item.subId = 0;         // на всякий случай обнуляем индекс (не обязательно)
  //     _repo.updateMainDBItem(item);
  //   }
  //   _updateFavouritesSubIds();
  // }

  /// Убираем элемент из Избранного
  removeElementFromFavourites(MainDBItem item) {
    _favController.removeElementFromFavourites(item);
    updateItemInPages(item);
  }

  // Обновлеем индексы порядка вывода для избранного в соответствии с тем, как расположены элементы в списке pages[0].currentList
  // и сохраняем записи в базе
  // _updateFavouritesSubIds() {
  //   Map<int, MainDBItem> map = pages[0].currentList.asMap();
  //   map.forEach((key, item) {
  //     item.subId = key;
  //   });
  //   pages[0].currentList.assignAll(map.values.toList());
  //   _repo.updateMainDBItems(map.values.toList());
  // }

  // По фазе узнаем страницу и меняем на ней фазу
  changePageAndPhaseTo(String phase){
    var rootPhase = MainDBItem.getRootPhaseFor(phase);
    var pageNumber = _getPageByRoot(rootPhase);
    curPageNumber = pageNumber;
    changeCurrentPhaseTo(phase);
    update();
  }

  /// Меняем номер текущей (отображаемой) страницы
  changeCurrentPageNumberTo(int pageNumber) {
    print("changeCurrentPageNumberTo $pageNumber");
    curPageNumber = pageNumber;
    _settings.currentPageNumber.value = pageNumber;
  }

  /// Меняем текущую фазу по объекту MainDBItem
  changeCurrentPhaseWith(MainDBItem item) {
    changeCurrentPhaseTo(item.description);
  }

  ///Меняем текущую фазу на другую по ее имени
  changeCurrentPhaseTo(String phase) async {
    print("Change phase to $phase");
    saveListPositionForPhase(pages[curPageNumber].currentPhase);

    pages[curPageNumber].currentPhase = phase;
    print("pages[curPageNumber].currentPhase - updated");
    var list = await _getMenuItemsListFor(phase, curPageNumber);
    pages[curPageNumber].currentList.assignAll(list);
    _repo.updateCubeType(pages[curPageNumber]);
  }

  /// Сохраняем позицю скрола для фазы
  saveListPositionForPhase(String phase) {
    print("savePositionFor $phase, $curPositionInList");
    phasesPositions[phase] = curPositionInList;
    _repo.updatePhasePosition(phase, phasesPositions[phase]);
  }

  // changeListPositionForCurrentPhase(int position){
  //   print("savePosition for ${pages[curPageNumber].currentPhase} - $position");
  //   phasesPositions[pages[curPageNumber].currentPhase] = position;
  // }

  ///делаем список для отображения по имени фазы и номеру страницы. Номер нужен для определения необходимости добавления пункта "..."
  Future<List<MainDBItem>> _getMenuItemsListFor(String phase, int pageNumber) async {
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

  //Получаем название основной root фазы для любой фазы
  // String _getRootPhaseFor(String phase){
  //   var rootPhase = phase;
  //   while (backFrom[rootPhase] != null) {
  //     rootPhase = backFrom[rootPhase];
  //   }
  //   return rootPhase;
  // }

  int _getPageByRoot(String rootPhase) {
    var page = 0;
    pages.asMap().forEach((key, value) {
      if (value.rootPhase == rootPhase) page = key;
    });
    return page;
  }

  ///Обновляем элемент если он есть в текущем кэше (pages) в каком-нибудь currentList
  updateItemInPages(MainDBItem item) {
    print("updateItemInPages - $item");
    pages.asMap().forEach((pageNum, pageProp) {
      List<MainDBItem> list = pageProp.currentList;
      var index = list.indexWhere((element) => element.phase == item.phase && element.id == item.id);
      if (index != -1) {
        // print("find in page $pageNum with index = $index");
        List<MainDBItem> list = pageProp.currentList.toList();
        list[index] = item;
        pages[pageNum].currentList.assignAll(list);
      }
    });
    _favController.updateInFavourites(item);
  }

  // String getAssetFilePath(String iconName, String curPhase) {
  //   String path;
  //   iconName = iconName.replaceAll(".xml", "");
  //   if (iconName.endsWith(".svg") || iconName.endsWith(".png")) {              //Если есть расширение, то считаем, что путь указан полностью
  //     path = iconName;
  //   } else {
  //     var subDir = getAssetPath(curPhase);
  //     path = "assets/images/$subDir/$iconName.svg";
  //   }
  //   return path;
  // }

  //
  // String getAssetPath(String curPhase) {
  //   var rootPhase = MainDBItem.getRootPhaseFor(curPhase);   //тест получения основной фазы по текущей
  //   var subDir = curPhase.toLowerCase();
  //   if (rootPhase != curPhase) {
  //     subDir = rootPhase.toLowerCase() + "/$subDir";
  //   }
  //   return subDir;
  // }

  ///Инициализируем список backFrom фазами на которые нужно возвращаться с текущей. типа backFrom['G2F'] = 'MAIN3X3'
  ///для корневых(основных) фаз backFrom будет возвращать null
  _loadBackPhases() async {
    var subMenusList = await _repo.getSubMenuList();
    //print("subMenusList - $subMenusList");
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

  double getPositionForPage(int pageNumber) {
    var curPhase = pages[pageNumber].currentPhase;
    var position = phasesPositions[curPhase] ?? 0.0;
    print("position for $curPhase - $position, page - $pageNumber, curPage = $curPageNumber, curPos = $curPositionInList");
    if (pageNumber != curPageNumber) {
      saveListPositionForPhase(pages[curPageNumber].currentPhase);
    }
    curPositionInList = position;
    return position;
  }


}