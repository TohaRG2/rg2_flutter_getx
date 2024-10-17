import 'package:get/get.dart';
import 'package:rg2/database/daos/times_dao.dart';
import 'package:rg2/database/entitys/time_note_item.dart';

class TimerRepository extends GetxController {
  final TimesDao _timesDao = Get.find();

  Function(List<TimeNoteItem> timeNoteItems) timerTimesUpdateCallback;

  //--------------------- методы для работы с RoomDb  -----------------------

  /// Получаем список отсортированных по одному из полей записей из локальной базы
  Future<List<TimeNoteItem>> getAllTimeNotes({String orderBy}) async {
    var result = await _timesDao.getAllItems();
    var orderColumn = orderBy ?? "SOLVINGTIME"; //если orderBy не NULL, иначе "SolvingTime"
    // Делаем проверку
    switch (orderColumn.toUpperCase()) {
      case "UUID":
        orderColumn = "uuid";
        result.sort((item1, item2) => item1.uuid.compareTo(item2.uuid));
        break;
      case "DATETIME":
        orderColumn = "dateTime";
        result.sort((item1, item2) => item1.dateTime.compareTo(item2.dateTime));
        break;
      case "SCRAMBLE":
        orderColumn = "scramble";
        result.sort((item1, item2) => item1.scramble.compareTo(item2.scramble));
        break;
      case "COMMENT":
        orderColumn = "comment";
        result.sort((item1, item2) => item1.comment.compareTo(item2.comment));
        break;
      default:
        orderColumn = "solvingTime";
        result.sort((item1, item2) => item1.solvingTime.compareTo(item2.solvingTime));
    }
    //logPrint("orderBy - $orderColumn");
    return result;
  }

  /// Обновить запись в локальной базе
  updateTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.updateItem(item);
  }

  /// Добавить запись времени сборки в локальную базу
  addTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.insertItem(item);
  }

  /// Удалить запись времени сборк в локальной базе
  deleteTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.deleteItem(item);
  }

  /// Очищаем табличку с временами сборки в локальной базе (пока не используется)
  clearTimesTable() async {
    await _timesDao.clearTable();
  }

}
