import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';
import 'package:rg2_flutter_getx/res/constants.dart';

class ResultViewController extends GetxController {
  final Repository _repository = Get.find();
  var _orderBy = "solvingTime";

  @override
  void onInit() {
    _orderBy = GetStorage().read(Const.RESULT_ORDER_BY) ?? "solvingTime";
    super.onInit();
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
    GetStorage().write(Const.RESULT_ORDER_BY, _orderBy);
  }

  sortTimeNoteItemsBySolvingTime() {
    _timeNoteItems.sort((item1, item2) => item1.solvingTime.compareTo(item2.solvingTime));
    _orderBy = "solvingTime";
    GetStorage().write(Const.RESULT_ORDER_BY, _orderBy);
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