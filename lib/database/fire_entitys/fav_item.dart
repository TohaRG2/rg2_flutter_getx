import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavItem {
  int id;
  String phase;
  int subId;

  FavItem({@required this.id, @required this.phase, @required this.subId});

  Map<String, dynamic> toMap() => {
    'id': id,
    'phase': phase,
    'subId' : subId,
  };

  FavItem.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.phase = map['phase'];
    this.subId = map['subId'];
  }

  FavItem.fromDocSnapShot(DocumentSnapshot<Map<String, dynamic>> doc) {
    this.id = doc.data()['id'];
    this.phase = doc.data()['phase'];
    this.subId = doc.data()['subId'];
  }

  @override
  toString() => "id: $id, phase: $phase, subId: $subId";
}