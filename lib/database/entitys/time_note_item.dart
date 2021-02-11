
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity (tableName: 'times')
class TimeNoteItem {
  @PrimaryKey(autoGenerate: true)
  final int uuid;
  @required String solvingTime = "00:03.47";
  @required DateTime dateTime;
  String scramble = "";
  String comment = "";

  TimeNoteItem(this.solvingTime, this.dateTime, this.scramble, this.comment, {this.uuid});

  @override
  String toString() => "uuid = $uuid, solvingTime = $solvingTime, dateTime = $dateTime, scramble = $scramble, comment = $comment\n";

}