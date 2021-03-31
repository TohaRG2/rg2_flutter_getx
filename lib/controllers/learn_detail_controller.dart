import 'package:get/get.dart';
import 'package:rg2/controllers/repository/repository.dart';
import 'package:rg2/controllers/settings/global_storage_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/fire_entitys/comment_item.dart';
import 'package:rg2/utils/my_logger.dart';

import 'learn_controller.dart';

class LearnDetailController extends GetxController {
  Repository _repo = Get.find();
  LearnController _learnController = Get.find();
  GlobalStorageController _storageController = Get.find();

  @override
  onInit() {
    super.onInit();
    logPrint("Init LearnDetailController");
    _storageController.commentsUpdateCallback = _commentsCallback;
  }

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

  Future<void> reLoadPages(String phase, int id) async {
    obsPhase = phase;
    var list = await _repo.getPhasePages(phase);
    currentItems.assignAll(list);
    changeCurrentPageNumberTo(_getNumFromId(id));

    //logPrint("LoadPages Num = ${_getNumFromId(id)}. list = $list");
    //await Future.delayed(const Duration(seconds: 2), () {});
  }

  int _getNumFromId(int id) =>
      currentItems.indexWhere((element) => element.id == id);

  /// Меняем текущую страницу в зависимовсти от того элемента, который подан на вход
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
    var commentItem = CommentItem.fromMainDbItem(item);
    _storageController.addOrUpdateCommentInFBS(commentItem);
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

  /// Путь к папке головоломки в ассетах
  String getAssetPath(){
    return currentItem.getAssetPath();
  }

  /// Колбэк вызываемый при получении комментариев из firebase
  /// обновляем данные в базе и кэше страниц
  _commentsCallback(List<CommentItem> commentItems) async {
    logPrint("_commentsCallback - $commentItems");
    List<MainDBItem> mainDBItems = [];

    // асинхронный цикл для всех записей в commentItems, с ожидаем выполнения операции над каждым элементом
    await Future.forEach(commentItems,(CommentItem commentItem) async {
      var mainDBItem = await _repo.getMainDBItem(commentItem.phase, commentItem.id);
      mainDBItem.comment = commentItem.comment;
      mainDBItems.add(mainDBItem);
    });

    // обновляем список в локальной базе и в кэше
    _repo.updateMainDBItems(mainDBItems);
    _learnController.updateItemsInCache(mainDBItems);
  }

}
