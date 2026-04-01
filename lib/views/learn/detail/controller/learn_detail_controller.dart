import 'package:get/get.dart';
import 'package:rg2/controllers/repository/main_repository.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';


class LearnDetailController extends GetxController {
  final MainRepository _mainRepo = Get.find();
  final LearnController _learnController = Get.find();

  @override
  onInit() {
    super.onInit();
    logPrint("LearnDetailController onInit");
    _mainRepo.detailUpdateCacheCallback = _commentsCallback;
    // Делаем отметку в основном контроллере, что создан DetailController
    // костыль, который нужен для корректного перехода из одного DetailView в другое с новыми параметрами
    // Переход осуществляется через learn_redirect_view со своим контролеером
    _learnController.hasDetailController = true;
  }

  @override
  onClose() {
    logPrint("LearnDetailController onClose - ");
    // Убираем отметку в основном контроллере, что создан DetailController
    // нужно для отмены ожидания в learn_redirect_controller
    _learnController.hasDetailController = false;
  }

  final RxInt _curPageNumberObs = 0.obs;
  int get curPageNumber => _curPageNumberObs.value;
  set _curPageNumber(int value) => _curPageNumberObs.value = value;

  final RxBool _isBottomBarShowing = true.obs;
  bool get isBottomBarShowing => _isBottomBarShowing.value;
  set isBottomBarShowing(bool value) {
    _isBottomBarShowing.value = value;
  }

  final RxString _obsPhase = "".obs;
  String get obsPhase => _obsPhase.value;
  set obsPhase(String value) {
    _obsPhase.value = value;
  }

  final Rx<MainDBItem> _currentItem = MainDBItem(id: 0, phase: "").obs;
  MainDBItem get currentItem => _currentItem.value;
  set currentItem(MainDBItem value) {
    _currentItem.value = value;
  }
  
  final RxList<MainDBItem> _currentItems = <MainDBItem>[].obs;
  List<MainDBItem> get currentItems => _currentItems;
  set currentItems(List<MainDBItem> items) {
    _currentItems.assignAll(items);
  }

  Future<void> reLoadPages(String phase, int id) async {
    logPrint("reLoadPages - $phase, $id");
    obsPhase = phase;
    var list = await _mainRepo.getPhasePages(phase);
    currentItems.assignAll(list);
    changeCurrentPageNumberTo(_getNumFromId(id));

    //logPrint("LoadPages Num = ${_getNumFromId(id)}. list = $list");
    //await Future.delayed(const Duration(seconds: 2), () {});
  }

  int _getNumFromId(int id) =>
      currentItems.indexWhere((element) => element.id == id);

  /// Меняем текущую страницу в зависимовсти от того элемента, который подан на вход
  void changeCurrentPageByItem(MainDBItem item) {
    changeCurrentPageNumberTo(_getNumFromId(item.id));
  }

  /// Меняем номер текущей страницы на num
  void changeCurrentPageNumberTo(int num) {
    //logPrint("changeCurrentItemTo $num, ${currentItems.value}");
    _curPageNumber = num;
    currentItem = currentItems[num];
  }

  /// Комментарий для текущей страницы viewPager'a
  String get currentComment => currentItems[curPageNumber].comment;

  /// Устанавливаем коммент для текущего элемента
  void setCurrentCommentTo(String text) {
    var item = currentItems[curPageNumber];
    item.comment = text;
    currentItems[curPageNumber] = item;

    _mainRepo.addOrUpdateComment(item);
    _learnController.updateItemInPages(item);
  }

  /// Меняем статус избранного на противоположное и обновляем в кэше страниц и в списке избранного
  void changeCurrentFavStatus() {
    var item = currentItems[curPageNumber];
    item.isFavourite = !item.isFavourite;
    currentItems[curPageNumber] = item;
    currentItem = item;
    _learnController.updateItemInPages(item);
    _mainRepo.updateMainDBItem(item);
  }

  /// Путь к папке головоломки в ассетах
  String getAssetPath(){
    return currentItem.getAssetPath();
  }

  /// Колбэк вызываемый при получении комментариев из firebase
  /// обновляем данные в базе и кэше страниц
  Future<void> _commentsCallback(List<MainDBItem> items) async {
    logPrint("_commentsCallback - $items");
    // обновляем в кэше детальной инфы
    for (var mainDBItem in items) {
      var index = currentItems.indexWhere((element) => element.phase == mainDBItem.phase && element.id == mainDBItem.id);
      if (index >= 0) {
        currentItems[index] = mainDBItem;
      }
    }
  }

  // ScrollController drawerScrollController = ScrollController(keepScrollOffset: false);
  // double drawerOffset = 0;
  // ScrollPosition drawerPosition;
  //
  // setDrawerOffset(){
  //   logPrint("setDrawerOffset - $drawerOffset");
  //   if (drawerPosition != null) {
  //     drawerScrollController.attach(drawerPosition);
  //   }
  // }

}
