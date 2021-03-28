import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rg2/database/entitys/main_db_item.dart';

class CommentItem {
  int id;
  String phase;
  String comment;

  CommentItem({@required this.id, @required this.phase, @required this.comment});

  Map<String, dynamic> toMap() => {
    'id': id,
    'phase': phase,
    'comment' : comment,
  };

  CommentItem.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.phase = map['phase'];
    this.comment = map['comment'];
  }

  CommentItem.fromDocSnapShot(DocumentSnapshot doc) {
    this.id = doc.data()['id'];
    this.phase = doc.data()['phase'];
    this.comment = doc.data()['comment'];
  }

  CommentItem.fromMainDbItem(MainDBItem item) {
    this.id = item.id;
    this.phase = item.phase;
    this.comment = item.comment;
  }


  @override
  toString() => "id: $id, phase: $phase, comment: $comment";
}