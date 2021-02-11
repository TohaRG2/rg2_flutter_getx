import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';

class ResultDialogController extends GetxController {
  final Repository _repository = Get.find();

  RxList<TimeNoteItem> _timeNoteItems = List<TimeNoteItem>().obs;
  List<TimeNoteItem> get timeNoteItems => _timeNoteItems;

  updateTimeNoteItems() async {
    var list = await _repository.getAllTimeNoteList(orderBy: "solvingTime");
    _timeNoteItems.assignAll(list);
  }

}