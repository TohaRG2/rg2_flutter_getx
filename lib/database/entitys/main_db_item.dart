
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity (tableName: 'main', primaryKeys: ['id', 'phase'])
class MainDBItem{
  //@PrimaryKey(autoGenerate: true)
  final int id;
  final String phase;
  String title;
  String icon;
  String description;
  String url;
  String comment;
  bool isFavourite;
  String favComment;
  int subId;

  MainDBItem({
    @required this.id,
    @required this.phase,
    this.title = "",
    this.icon = "",
    this.description = "",
    this.url = "",
    this.comment = "",
    this.isFavourite = false,
    this.favComment = "",
    this.subId = 0,
  });

  @override
  //String toString() => "id = $id, phase = $phase, Fav = $isFavourite";
  //String toString() => "id = $id, phase = $phase, subId = $subId";
  String toString() => "title = $title, subId = $subId, isFav = $isFavourite";

}

