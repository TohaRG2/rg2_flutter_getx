import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/utils/my_logger.dart';

class CloudDatabase{
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //static final _settingsCollection = FirebaseFirestore.instance.collection("settings");
  static final _usersCollection = FirebaseFirestore.instance.collection("users");
  var _timeout = 2;

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


  Future<Property> getUserParameter(String userId, String key) async {
    var mainDocRef = _usersCollection.doc(userId);
    var mainDoc = await mainDocRef.get();

    var dt = DateTime.fromMillisecondsSinceEpoch(mainDoc.data()["lastUpdate"].millisecondsSinceEpoch);
    var refCol = mainDocRef.collection("properties");
    logPrint("Date from base - $dt");

    try {
      var propDocSnapShot = await refCol
          .doc(key).get()
          .timeout(Duration(seconds: _timeout));
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

  /// Обновление property в базе
  Future<void> addOrUpdateProperty(String userId, Property property) async {
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = mainDocRef.collection("properties");
    mainDocRef.update({'lastUpdate': property.changeDate});
    return refCol
        .doc(property.key)
        .set(property.toMap())
        .then((value) => logPrint("Добавили/обновили $property в базу"))
        .catchError((error) => logPrint("Не удалось добавить $property в firebase"));
  }

  Future<List<Property>> getAllUserProperties(String userId) async {
    logPrint("getAllUserProperties $userId");
    var mainDocRef = _usersCollection.doc(userId);
    var refCol = await mainDocRef.collection("properties").get();
    var docs = refCol.docs;
    return docs.map((doc) {
      //logPrint("Doc: ${doc.id}, ${doc.data()["value"]}}");
      return Property.fromDocSnapShot(doc);
    }).toList();
  }

  disableNetwork() async {
    logPrint("disableNetwork");
    await FirebaseFirestore.instance.disableNetwork();
  }

  enableNetwork() async {
    logPrint("enableNetwork");
    await FirebaseFirestore.instance.enableNetwork();
  }

}