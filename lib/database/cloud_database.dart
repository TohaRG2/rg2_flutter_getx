import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rg2/database/fire_entitys/comment_item.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';

class CloudDatabase{

  static final _usersCollection = FirebaseFirestore.instance.collection("users");
  // название коллекции для комментариев
  static const COMMENTS = "comments";
  // название коллекции для параметров программы
  static const PROPERTIES = "properties";
  // название ключа для хранения избранного в коллекции userId
  static const FAVOURITES = "favourites";


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
      logPrint("try createOrUpdateUser");
      await _usersCollection.doc(user.uid).set({
        "displayName": user.displayName,
        "email": user.email,
      });
      return true;
    } catch(e) {
      logPrint("Ошибка создания пользователя: $e");
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
    var dt = mainDoc.data()["lastUpdate"].toDate();
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
      logPrint("catch get propSnapShot $e");
      return null;
    }
    return null;
  }

  /// Обновление одного property в базе
  Future<void> addOrUpdateProperty(String userId, Property property) async {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection(PROPERTIES);
    mainDocRef.update({'lastUpdate': property.changeDate});
    return refCol
        .doc(property.key)
        .set(property.toMap())
        .then((value) => logPrint("Добавили/обновили $property в базу"))
        .catchError((error) => logPrint("Не удалось добавить $property в firebase"));
  }

  /// Получаем все сохраненные в FB свойства программы, по сути всю коллекцию properties
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
      logPrint("ERROR! Ошибка получения свойств из базы\n $e");
      return null;
    }
  }
  //------------------ для работы с избранным ----------------------------

  /// Обновление Избранного
  addOrUpdateFavourites(String userId, List<FavItem> favourites) async {
    var mainDocRef = _usersCollection.doc(userId);
    //var refCol = mainDocRef.collection("favourites");
    mainDocRef.update({'favUpdate': DateTime.now()});
    var items = favourites.map((fav) => fav.toMap()).toList();
    mainDocRef.update({FAVOURITES: items})
      .then((value) => logPrint("Обновили избранное $items в базе"))
      .catchError((error) => logPrint("Не удалось обновить избранное $items в firebase"));
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

  /// Создаем или обновляем один комментарий в firebase
  addOrUpdateComment(String userId, CommentItem comment) {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection(COMMENTS);
    mainDocRef.update({'lastCommentUpdate': DateTime.now()});
    return refCol
        .doc("${comment.phase} - ${comment.id}")
        .set(comment.toMap())
        .then((value) => logPrint("Добавили/обновили $comment в базу"))
        .catchError((error) => logPrint("Не удалось добавить $comment в firebase\n $error"));
  }

  /// Возвращаем список всех комментариев к этапам из коллеккции в usersId/comments
  Future<List<CommentItem>> getComments(String userId) async{
    logPrint("getComments - получаем список комментов");
    try {
      var mainDocRef = _usersCollection.doc(userId);
      var refCol = await mainDocRef.collection(COMMENTS).get();
      var docs = refCol.docs;
      return docs.map((doc) {
        //logPrint("Doc: ${doc.id}, ${CommentItem.fromDocSnapShot(doc)}");
        return CommentItem.fromDocSnapShot(doc);
      }).toList();
    } catch (e) {
      logPrint("ERROR! Ошибка получения свойств из базы\n $e");
      return null;
    }
  }



}