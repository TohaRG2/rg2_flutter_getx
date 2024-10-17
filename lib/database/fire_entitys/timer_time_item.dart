import 'package:flutter/material.dart';
import 'package:rg2/database/entitys/time_note_item.dart';


/// Датакласс для хранения в firebase данных по сборкам пользователя (время сборки в таймере)
/// в качестве ID используем время в милисекундах, когда создана запись в локальной БД
/// этот же ID используется для имени документа в колеекции FBS (FireBaseStorage)
class TimerTimeItem {
  DateTime date;
  String solvingTime;
  String scramble;
  String comment;

  TimerTimeItem({@required this.date, @required this.solvingTime, this.scramble = "", this.comment = ""});

  /// Преобразуем объект в Map, для хранения в FBS
  Map<String, dynamic> toMap() => {
    'date': date,
    'solvingTime': solvingTime,
    'scramble' : scramble,
    'comment' : comment
  };

  /// Конструктор для создания из Map
  TimerTimeItem.fromMap(Map<String, dynamic> map) {
    this.date = map['date'].toDate();
    this.solvingTime = map['solvingTime'];
    this.scramble = map['scramble'] ?? "";
    this.comment = map['comment'] ?? "";
  }

  TimerTimeItem.fromTimeNoteItem(TimeNoteItem item) {
    this.date = item.dateTime;
    this.solvingTime = item.solvingTime;
    this.scramble = item?.scramble ?? "";
    this.comment = item?.comment ?? "";
  }

  @override
  toString() => "date: $date, solvingTime: $solvingTime, scramble: $scramble, comment: $comment";
}
