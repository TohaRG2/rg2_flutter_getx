import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rg2/database/cloud_database.dart';
import 'package:rg2/database/daos/times_dao.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:rg2/database/fire_entitys/timer_time_item.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/auth/controller/auth_controller.dart';

class TimerRepository extends GetxController {
  final TimesDao _timesDao = Get.find();
  final CloudDatabase _cloudDB = Get.find();
  final AuthController _auth = Get.find();

  String _userId = "";

  Function(List<TimeNoteItem> timeNoteItems) timerTimesUpdateCallback;

  @override
  onInit() async {
    super.onInit();
    logPrint("onInit - TimerRepository ${_auth.firebaseUser.value?.uid}");
    // подписываемся на получение изменений firebaseUser, при изменении вызываем _userAuthChanged не чаще, чем раз в 2 сек
    debounce(_auth.firebaseUser, _userAuthChanged, time: Duration(seconds: 2));
    // если к моменту инициализации пользователь уже залогинен, то апдейтим данные из FBS
    if (_auth.user != null) {
      _userAuthChanged(_auth.user);
    }
  }

  /// Что-то поменялось в аутентификации пользователя
  _userAuthChanged(User user) {
    logPrint("TimerRepository._userAuthChanged - ${user?.uid}");
    _userId = (user == null) ? "" : user?.uid;
    if (_userId != "") {
      _updateTimerTimes();
    }
  }

  //--------------------- методы для работы с RoomDb  -----------------------

  /// Получаем список отсортированных по одному из полей записей из локальной базы
  Future<List<TimeNoteItem>> getAllTimeNotes({String orderBy}) async {
    var result = await _timesDao.getAllItems();
    var orderColumn = orderBy ?? "SOLVINGTIME"; //если orderBy не NULL, иначе "SolvingTime"
    // Делаем проверку
    switch(orderColumn.toUpperCase()) {
      case "UUID": orderColumn = "uuid"; result.sort((item1, item2) => item1.uuid.compareTo(item2.uuid)); break;
      case "DATETIME": orderColumn = "dateTime"; result.sort((item1, item2) => item1.dateTime.compareTo(item2.dateTime)); break;
      case "SCRAMBLE": orderColumn = "scramble"; result.sort((item1, item2) => item1.scramble.compareTo(item2.scramble)); break;
      case "COMMENT": orderColumn = "comment"; result.sort((item1, item2) => item1.comment.compareTo(item2.comment)); break;
      default: orderColumn = "solvingTime"; result.sort((item1, item2) => item1.solvingTime.compareTo(item2.solvingTime));
    }
    //logPrint("orderBy - $orderColumn");
    return result;
  }

  /// Обновить запись в локальной базе и в FBS
  updateTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.updateItem(item);
    await _addOrUpdateTimerTimeInFBS(item);
  }

  /// Добавить запись времени сборки в локальную базу и в FBS
  addTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.insertItem(item);
    await _addOrUpdateTimerTimeInFBS(item);
  }

  /// Удалить запись времени сборк в локальной базе и в FBS
  deleteTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.deleteItem(item);
    await _deleteTimerTimeInFBS(item);
  }

  /// Очищаем табличку с временами сборки в локальной базе (пока не используется)
  clearTimesTable() async {
    await _timesDao.clearTable();
  }


  //------------------------ методы для работы с FirebaseStore -----------------------


  /// Получаем время сборки из FBS и обновляем их в локальной базе и на экране (кэше)
  Future _updateTimerTimes() async {
    logPrint("_updateTimerTimes - получаем время таймера из FBS");
    List<TimerTimeItem> fbsItems = await _getTimerTimes();
    List<TimeNoteItem> dbItems = await getAllTimeNotes();
    // синхронизируем списки из локальной базы и FBS
    await Future.forEach(fbsItems,(TimerTimeItem fbsItem) async {
      // ищем запись с таким же временем создания в локальной базе
      var index = dbItems.indexWhere((dbItem) => dbItem.dateTime.isAtSameMomentAs(fbsItem.date));
      // если не находим, то добавляем
      if (index == -1) {
        var newItem = TimeNoteItem(
            fbsItem.solvingTime,
            fbsItem.date,
            fbsItem.scramble,
            fbsItem.comment
        );
        await _timesDao.insertOrReplace(newItem);
      } else {
        // если находим, то обновляем у нее комментарий из FBS
        var upItem = dbItems[index];
        upItem.comment = fbsItem.comment;
        await _timesDao.updateItem(upItem);
      }
    });
    dbItems = await getAllTimeNotes();
    // logPrint("_updateTimerTimes - список из fbs $fbsItems");
    // logPrint("_updateTimerTimes - список после синхронизации $dbItems");
    if (dbItems.length != fbsItems.length) {
      dbItems.forEach((dbItem) {
        _addOrUpdateTimerTimeInFBS(dbItem);
      });
    }
    // обновляем список результатов сборок на экране, если задан колбэк
    if (timerTimesUpdateCallback != null) {
      timerTimesUpdateCallback(dbItems);
    }
  }

  /// Добавить или обновить время сборки в FBS, если пользователь залогинен
  _addOrUpdateTimerTimeInFBS(TimeNoteItem item) async {
    if (_userId != "") {
      var timerTimeItem = TimerTimeItem.fromTimeNoteItem(item);
      await _cloudDB.addOrUpdateTimerTime(_userId, timerTimeItem);
    }
  }

  /// получаем список всех сборок в таймере из FBS
  Future<List<TimerTimeItem>> _getTimerTimes() async {
    //logPrint("_getTimerTimes - ");
    if (_userId != "") {
      return await _cloudDB.getTimerTimes(_userId);
    }
    return null;
  }

  /// Удалить время сборки в FBS
  _deleteTimerTimeInFBS(TimeNoteItem item) async {
    if (_userId != "") {
      var timerTimeItem = TimerTimeItem.fromTimeNoteItem(item);
      await _cloudDB.deleteTimerTime(_userId, timerTimeItem);
    }

  }

}
