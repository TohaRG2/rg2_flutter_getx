import 'package:get/get.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/controllers/repository/timer_repository.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';

class ResultViewController extends GetxController {
  final TimerRepository _repository = Get.find();
  final GlobalStorageController _storage = Get.find();
  var _orderBy = "solvingTime";

  @override
  void onInit() {
    super.onInit();
    _initializeVariables();
    _storage.callbacks.add(_initializeVariables);
    _repository.timerTimesUpdateCallback = _updateTimeNoteItems;
  }

  /// Инициализируем переменные (перечитываем из локалстора)
  void _initializeVariables() {
    _orderBy = _storage.getPropertyByKey(Const.RESULT_ORDER_BY) ?? "solvingTime";
  }

  /// Observable список
  RxList<TimeNoteItem> _timeNoteItems = <TimeNoteItem>[].obs;
  List<TimeNoteItem> get timeNoteItems => _timeNoteItems;

  /// Обновляем список результатов сборки из локальной базы
  updateTimeNoteItems() async {
    var list = await _repository.getAllTimeNotes(orderBy: _orderBy);
    _timeNoteItems.assignAll(list);
  }

  /// Обновляем список результатов сборки из переданных данных
  _updateTimeNoteItems(List<TimeNoteItem> timeNoteItems) {
    _timeNoteItems.assignAll(timeNoteItems);
  }

  /// Сортируем список результатов по дате сборки
  sortTimeNoteItemsByDate() {
    _timeNoteItems.sort((item1, item2) => item1.dateTime.compareTo(item2.dateTime));
    _orderBy = "dateTime";
    _storage.setProperty(Property(key: Const.RESULT_ORDER_BY, value: _orderBy));
  }

  /// Сортируем список результатов по времени сборки
  sortTimeNoteItemsBySolvingTime() {
    _timeNoteItems.sort((item1, item2) => item1.solvingTime.compareTo(item2.solvingTime));
    _orderBy = "solvingTime";
    _storage.setProperty(Property(key: Const.RESULT_ORDER_BY, value: _orderBy));
  }

  /// Удалить элемент из списка и в базах
  removeItem(TimeNoteItem item) {
    //_timeNoteItems.removeWhere((it) => it.uuid == item.uuid);
    _timeNoteItems.remove(item);
    _repository.deleteTimeNoteItem(item);
  }

  /// обновить комментарий у записи, сохраняем в базу и перечитываем из нее
  updateComment(TimeNoteItem item, String text) {
    item.comment = text;
    _repository.updateTimeNoteItem(item);
    updateTimeNoteItems();
  }

}