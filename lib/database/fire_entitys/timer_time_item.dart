import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rg2/database/entitys/time_note_item.dart';


/// Датакласс для хранения в firebase данных по сборкам пользователя (время сборки в таймере)
/// в качестве ID используем время в милисекундах, когда создана запись в локальной БД
/// этот же ID используется для имени документа в колеекции FBS (FireBaseStorage)
class TimerTimeItem {
  int id;
  String solvingTime;
  String scramble;
  String comment;

  TimerTimeItem({@required this.id, @required this.solvingTime, this.scramble = "", this.comment = ""});

  /// Преобразуем объект в Map, для хранения в FBS
  Map<String, dynamic> toMap() => {
    'id': id,
    'solvingTime': solvingTime,
    'scramble' : scramble,
    'comment' : comment
  };

  /// Конструктор для создания из Map
  TimerTimeItem.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.solvingTime = map['solvingTime'];
    this.scramble = map['scramble'] ?? "";
    this.comment = map['comment'] ?? "";
  }

  /// Конструктор для создания из снапшота документа
  TimerTimeItem.fromDocSnapShot(DocumentSnapshot doc) {
    this.id = doc.data()['id'];
    this.solvingTime = doc.data()['solvingTime'];
    this.scramble = doc.data()['scramble'] ?? "";
    this.comment = doc.data()['comment'] ?? "";
  }

  TimerTimeItem.fromTimeNoteItem(TimeNoteItem item) {
    this.id = item.dateTime.millisecondsSinceEpoch;
    this.solvingTime = item.solvingTime;
    this.scramble = item?.scramble ?? "";
    this.comment = item?.comment ?? "";
  }

  @override
  toString() => "Id: ${DateTime.fromMillisecondsSinceEpoch(id)}, solvingTime: $solvingTime, scramble: $scramble, comment: $comment";
}
