import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rg2/database/fire_entitys/comment_item.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/database/fire_entitys/timer_time_item.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';

class CloudDatabase extends GetxController {

  static final _usersCollection = FirebaseFirestore.instance.collection("users");
  // название коллекции для комментариев
  static const COMMENTS = "comments";
  static const COMMENTS_UPDATE_DATE = "lastCommentsUpdate";
  // название коллекции для параметров программы
  static const PROPERTIES = "properties";
  static const PROPERTIES_UPDATE_DATE = "lastPropertiesUpdate";
  // название ключа для хранения избранного в коллекции userId
  static const FAVOURITES = "favourites";
  static const FAVOURITES_UPDATE_DATE = "lastFavouritesUpdate";
  // название коллекции для хранения времени сборки кубика в коллекции userId
  static const TIMER_TIMES = "timerTimes";
  static const TIMER_TIMES_UPDATE_DATE = "lastTimerTimesUpdate";
  // название парметров для хранения счетчика входов
  static const ENTERS_COUNT = "entersCount";
  static const LAST_ENTER_DATE = "lastEnterDate";



  disableNetwork() async {
    logPrint("disableNetwork");
    await FirebaseFirestore.instance.disableNetwork();
  }

  enableNetwork() async {
    logPrint("enableNetwork");
    await FirebaseFirestore.instance.enableNetwork();
  }

  /// Создать или обновить данные пользователя в firebase
  Future<bool> createOrUpdateUser(User user) async {
    try {
      logPrint("try createOrUpdateUser ${user.uid}");
      DocumentReference docRef = _usersCollection.doc(user.uid);
      DocumentSnapshot docSnapShot = await docRef.get();
      if (docSnapShot.exists) {
        logPrint("updateUser");
        await docRef.update({
          "displayName": user.displayName,
          "email": user.email,
        });
      } else {
        logPrint("createUser");
        await docRef.set({
          "displayName": user.displayName,
          "email": user.email,
        });
      }

      return true;
    } catch(e) {
      logPrintErr("Ошибка создания пользователя: $e");
      return false;
    }
  }

  //--------------------------- работа с параметрами программы ------------------------

  /// получение отдельного параметра из firebase по id юзера и кллючу параметра,
  /// ответ должен быть получен в течении [timeout] секунд
  Future<Property> getUserParameter(String userId, String key, {timeout = 2}) async {
    var mainDocRef = _usersCollection.doc(userId);
    var mainDoc = await mainDocRef.get();

    //var dt = DateTime.fromMillisecondsSinceEpoch(mainDoc.data()["lastUpdate"].millisecondsSinceEpoch);
    var dt = mainDoc.data()[PROPERTIES_UPDATE_DATE].toDate();
    var refCol = mainDocRef.collection(PROPERTIES);
    logPrint("Date from base - $dt");

    try {
      var propDocSnapShot = await refCol
          .doc(key).get()
          .timeout(Duration(seconds: timeout));
      logPrint("propSnapshot = ${propDocSnapShot.data()}");
      if (propDocSnapShot.exists) {
        return Property.fromDocSnapShot(propDocSnapShot);
      }
    } catch (e) {
      logPrintErr("catch get propSnapShot $e");
      return null;
    }
    return null;
  }

  /// Обновление одного property в базе
  Future<void> addOrUpdateProperty(String userId, Property property) async {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection(PROPERTIES);
    mainDocRef.update({PROPERTIES_UPDATE_DATE: property.changeDate});
    return refCol
        .doc(property.key)
        .set(property.toMap())
        .then((value) => logPrint("Добавили/обновили $property в базу"))
        .catchError((error) => logPrint("Не удалось добавить $property в firebase"));
  }

  /// Получаем все сохраненные в FBS свойства программы, по сути всю коллекцию properties
  Future<List<Property>> getAllUserProperties(String userId) async {
    logPrint("getAllUserProperties $userId");
    try {
      var mainDocRef = _usersCollection.doc(userId);
      var refCol = await mainDocRef.collection(PROPERTIES).get();
      var docs = refCol.docs;
      return docs.map((doc) {
        //logPrint("Doc: ${doc.id}, ${doc.data()["value"]}}");
        return Property.fromDocSnapShot(doc);
      }).toList();
    } catch (e) {
      logPrintErr("Ошибка получения свойств из базы\n $e");
      return null;
    }
  }
  //------------------ для работы с избранным ----------------------------

  /// Обновление Избранного
  addOrUpdateFavourites(String userId, List<FavItem> favourites) async {
    var mainDocRef = _usersCollection.doc(userId);
    //var refCol = mainDocRef.collection("favourites");
    mainDocRef.update({FAVOURITES_UPDATE_DATE: DateTime.now()});
    var items = favourites.map((fav) => fav.toMap()).toList();
    mainDocRef.update({FAVOURITES: items})
      .then((value) => logPrint("Обновили избранное $items в базе"))
      .catchError((error) => logPrintErr("Не удалось обновить избранное $items в firebase"));
  }

  /// Возвращаем список избранного из документа в usersId/favourites
  Future<List<FavItem>> getFavourites(String userId) async{
    try {
      //logPrint("CloudDB.getFavourites - $userId");
      DocumentSnapshot docSnapShot = await _usersCollection.doc(userId).get();
      List<dynamic> favourites = docSnapShot.get(FieldPath([FAVOURITES]));
      //logPrint("getFavourites - a = $favourites");
      List<Map<String, dynamic>> favMap = favourites.map((e) => e as Map<String, dynamic>).toList();
      //logPrint("CloudDB.getFavourites - favMap is ${favMap.runtimeType} $favMap");
      List<FavItem> list = favMap.map((map) => FavItem.fromMap(map)).toList();
      //logPrint("CloudDB.getFavourites - $list");
      return list;
    } catch (e) {
      logPrint("catch getFavourites - $e");
      return null;
    }
  }

  //----------- для работы с коллекцией комментариев -----------------

  /// Создаем или обновляем один комментарий в FBS
  addOrUpdateComment(String userId, CommentItem comment) {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection(COMMENTS);
    mainDocRef.update({COMMENTS_UPDATE_DATE: DateTime.now()});
    return refCol
        .doc("${comment.phase} - ${comment.id}")
        .set(comment.toMap())
        .then((value) => logPrint("Добавили/обновили $comment в базу"))
        .catchError((error) => logPrintErr("Не удалось добавить $comment в FBS\n $error"));
  }

  /// Создаем или обновляем один комментарий в FBS
  deleteComment(String userId, CommentItem comment) {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection(COMMENTS);
    mainDocRef.update({COMMENTS_UPDATE_DATE: DateTime.now()});
    return refCol
        .doc("${comment.phase} - ${comment.id}")
        .delete()
        .then((value) => logPrint("Удалили $comment из базы"))
        .catchError((error) => logPrintErr("Не удалось удалить $comment в FBS\n $error"));
  }

  /// Очищаем комментарии в FBS
  clearAllComments(String userId) async {
    var mainDocRef = _usersCollection.doc(userId);
    mainDocRef.update({COMMENTS_UPDATE_DATE: DateTime.now()});
    var refCol = await mainDocRef.collection(COMMENTS).get();
    refCol.docs.forEach((docSnap) {
      docSnap.reference.delete();
    });
  }

  /// Возвращаем список всех комментариев к этапам из коллеккции в usersId/comments
  Future<List<CommentItem>> getComments(String userId) async{
    logPrint("getComments - получаем список комментов из FBS");
    try {
      var mainDocRef = _usersCollection.doc(userId);
      var refCol = await mainDocRef.collection(COMMENTS).get();
      var docs = refCol.docs;
      return docs.map((doc) {
        //logPrint("Doc: ${doc.id}, ${CommentItem.fromDocSnapShot(doc)}");
        return CommentItem.fromDocSnapShot(doc);
      }).toList();
    } catch (e) {
      logPrintErr("Ошибка получения комментариев из базы\n $e");
      return null;
    }
  }

  //----------- для работы с коллекцией времени сборки в таймере -----------------

  /// Создаем или обновляем одну запись в коллекции TimerTimes в FBS
  addOrUpdateTimerTime(String userId, TimerTimeItem timerItem) {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection(TIMER_TIMES);
    mainDocRef.update({TIMER_TIMES_UPDATE_DATE: DateTime.now()});
    return refCol
        .doc("${timerItem.date.millisecondsSinceEpoch}")
        .set(timerItem.toMap())
        .then((value) => logPrint("Добавили/обновили $timerItem в базу"))
        .catchError((error) => logPrintErr("Не удалось добавить $timerItem в firebase\n $error"));
  }

  /// Удяляем записи в коллекции TimerTimes в FBS у которых время создания (idDoc) +/- 10 милисекунд от заданного
  deleteTimerTime(String userId, TimerTimeItem timerItem) async {
    var mainDocRef = _usersCollection.doc(userId);
    // отметка, что изменяли что-то в TimerTimes
    mainDocRef.update({TIMER_TIMES_UPDATE_DATE: DateTime.now()});

    var refCol = mainDocRef.collection(TIMER_TIMES);
    var qSnapShot = await refCol.get();
    var listIdToDelete = getDocIdsWithTimeNear(timerItem.date, qSnapShot);
    listIdToDelete.forEach((delId) {
      refCol.doc("$delId")
          .delete()
          .then((_) => logPrint("getDocIdsWithTimeNear Удалили $delId из FBS.TimerTimes"))
          .catchError((error) => logPrintErr("Не удалось удалить $timerItem в FBS\n $error"));
    });
  }

  /// Очищаем табличку TimerTimes в FBS
  clearTimerTimes(String userId) async {
    var mainDocRef = _usersCollection.doc(userId);
    // отметка, что изменяли что-то в TimerTimes
    mainDocRef.update({TIMER_TIMES_UPDATE_DATE: DateTime.now()});
    var refCol = await mainDocRef.collection(TIMER_TIMES).get();
    refCol.docs.forEach((docSnap) {
      docSnap.reference.delete();
    });
  }

  /// пересматриваем все записи в коллекции и отбираем те, которые отличаются временем создания менее чем на 10 милисек
  /// можем вернуть не одну запись
  List<String> getDocIdsWithTimeNear(DateTime dateTime, QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    var listIdToDelete = <String>[];
    var docs = querySnapshot.docs;
    docs.forEach((doc) {
      var timerTime = TimerTimeItem.fromDocSnapShot(doc);
      var dur = timerTime.date.isAfter(dateTime)
          ? timerTime.date.difference(dateTime)
          : dateTime.difference(timerTime.date);
      if (dur < Duration(milliseconds: 10)) {
        listIdToDelete.add(doc.id);
      }
    });
    logPrint("getDocIdsWithTimeNear - $listIdToDelete");
    return listIdToDelete;
  }

  /// Возвращаем список всех записей сборок в таймере в usersId/timerTimes
  Future<List<TimerTimeItem>> getTimerTimes(String userId) async{
    logPrint("getTimerTimes - получаем список времени сборок");
    try {
      var mainDocRef = _usersCollection.doc(userId);
      var refCol = await mainDocRef.collection(TIMER_TIMES).get();
      var docs = refCol.docs;
      return docs.map((doc) {
        //logPrint("Doc: ${doc.id}, ${CommentItem.fromDocSnapShot(doc)}");
        return TimerTimeItem.fromDocSnapShot(doc);
      }).toList();
    } catch (e) {
      logPrintErr("Ошибка получения списка сборок в таймере из базы\n $e");
      return null;
    }
  }

  //------------------------------------------------------------------

  /// Обновляем глобальный счетчик входов в FBS по id пользователя
  updateGlobalEntersCount(String userId) async {
    try {
      var mainDocRef = _usersCollection.doc(userId);
      DocumentSnapshot<Map<String, dynamic>> docSnapShot = await mainDocRef.get();
      Map<String, dynamic> a = docSnapShot.data();

      int currentCount = docSnapShot.data()[ENTERS_COUNT] ?? 0;
      currentCount++;
      mainDocRef.update({ENTERS_COUNT: currentCount});
      mainDocRef.update({LAST_ENTER_DATE: DateTime.now()});
    } catch (e) {
      logPrintErr("ERROR! Ошибка обновления счетчика входов\n $e");
    }
  }

}