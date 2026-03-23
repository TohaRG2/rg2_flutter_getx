
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity(tableName: 'times')
class TimeNoteItem {
  @PrimaryKey(autoGenerate: true)
  final int? uuid;
  final String solvingTime;
  final DateTime dateTime;
  final String scramble;
  final String comment;

  TimeNoteItem(this.solvingTime, this.dateTime, this.scramble, this.comment, {this.uuid});

  @override
  String toString() => "uuid = $uuid, solvingTime = $solvingTime, dateTime = $dateTime, scramble = $scramble, comment = $comment\n";
}
