import 'package:cloud_firestore/cloud_firestore.dart';
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

  onInit() async {
    super.onInit();
    logPrint("onInit - TimerRepository");
    // подписываемся на получение изменений firebaseUser, при изменении вызываем _userAuthChanged не чаще, чем раз в 2 сек
    debounce(_auth.firebaseUser, _userAuthChanged, time: Duration(seconds: 2));
  }

  /// Что-то поменялось в аутентификации пользователя
  _userAuthChanged(User user) {
    logPrint("TimerRepository._userAuthChanged - ${user.uid}");
    _userId = (user == null) ? "" : user?.uid;
    if (_userId != "") {
      _updateTimerTimes();
    }
  }


  //--------------------- методы для работы с RoomDb  -----------------------

  /// Получаем список отсортированных по одному из полей записей
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

  updateTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.updateItem(item);
    await _addOrUpdateTimerTimeInFBS(item);
  }


  addTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.insertItem(item);
    await _addOrUpdateTimerTimeInFBS(item);
  }

  deleteTimeNoteItem(TimeNoteItem item) async {
    await _timesDao.deleteItem(item);
  }
  
  clearTimesTable() async {
    await _timesDao.clearTable();
  }


  //------------------------ методы для работы с FirebaseStore -----------------------


  /// Получаем время сборки из FBS и обновляем их в локальной базе и на экране (кэше)
  Future _updateTimerTimes() async {
    logPrint("_updateTimerTimes - получаем время таймера из FBS");
    var listTimerTimesItems = await _getTimerTimes();
    List<TimeNoteItem> timeNoteItems = await getAllTimeNotes();
    // синхронизируем списки из локальной базы и FBS
    timeNoteItems?.forEach((timeNoteItem) {
      var timerTimesItem = TimerTimeItem.fromTimeNoteItem(timeNoteItem);
      //TODO додумать процесс синхронизации удаленной и локальной базы
    });
    // Пройтись по списку FBS записей,
    // если в локальной базе нет записи с временем создания как FBS.id.toDateTime,
    // то конвертим FBS => локальную и добавляем в лок.базу

    // перечитываем значение из локальной базы


    // обновляем список результатов сборок на экране, если задан колбэк
    if (timerTimesUpdateCallback != null) {
      timerTimesUpdateCallback(timeNoteItems);
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


}
