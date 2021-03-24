import 'package:get/get.dart';
import 'package:rg2/controllers/repository.dart';
import 'package:rg2/controllers/settings/global_settings_controller.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';

class ResultViewController extends GetxController {
  final Repository _repository = Get.find();
  final GlobalSettingsController _settingsController = Get.find();
  var _orderBy = "solvingTime";

  @override
  void onInit() {
    super.onInit();
    _initializeVariables();
    _settingsController.callbacks.add(_initializeVariables);
  }

  /// Инициализируем переменные
  void _initializeVariables() {
    _orderBy = _settingsController.getPropertyByKey(Const.RESULT_ORDER_BY) ?? "solvingTime";
  }

  RxList<TimeNoteItem> _timeNoteItems = <TimeNoteItem>[].obs;
  List<TimeNoteItem> get timeNoteItems => _timeNoteItems;

  updateTimeNoteItems() async {
    var list = await _repository.getAllTimeNotes(orderBy: _orderBy);
    _timeNoteItems.assignAll(list);
  }

  sortTimeNoteItemsByDate() {
    _timeNoteItems.sort((item1, item2) => item1.dateTime.compareTo(item2.dateTime));
    _orderBy = "dateTime";
    _settingsController.setPropertyByKey(Property(key: Const.RESULT_ORDER_BY, value: _orderBy));
  }

  sortTimeNoteItemsBySolvingTime() {
    _timeNoteItems.sort((item1, item2) => item1.solvingTime.compareTo(item2.solvingTime));
    _orderBy = "solvingTime";
    _settingsController.setPropertyByKey(Property(key: Const.RESULT_ORDER_BY, value: _orderBy));
  }

  removeItem(TimeNoteItem item) {
    //_timeNoteItems.removeWhere((it) => it.uuid == item.uuid);
    _timeNoteItems.remove(item);
    _repository.deleteTimeNoteItem(item);
  }

  updateComment(TimeNoteItem item, String text) {
    item.comment = text;
    _repository.updateTimeNoteItem(item);
    updateTimeNoteItems();
  }

}