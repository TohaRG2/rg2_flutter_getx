
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity (tableName: 'times')
class TimeNoteItem {
  /// Уникальный ID в локальной базе, автоинкрементный
  @PrimaryKey(autoGenerate: true)
  final int uuid;
  /// Время сборки в текстовом виде (готово для отображения)
  @required String solvingTime = "00:03.47";
  /// Дата/время создания записи в базе
  @required DateTime dateTime;
  /// Скрамбл по которому был разобран кубик (опционально)
  String scramble = "";
  /// Комментарий к сборке (опционально)
  String comment = "";

  TimeNoteItem(this.solvingTime, this.dateTime, this.scramble, this.comment, {this.uuid});

  @override
  String toString() => "uuid = $uuid, solvingTime = $solvingTime, dateTime = $dateTime, scramble = $scramble, comment = $comment\n";

}