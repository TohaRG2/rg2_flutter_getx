
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity (tableName: 'basic_moves', primaryKeys: ['eType', 'id'])
class BasicMove{
  final int id;
  final String eType;
  String move;
  String icon;
  String toast;

  BasicMove({
    @required this.id,
    @required this.eType,
    this.move = "",
    this.icon = "",
    this.toast = "",
  });

  @override
  String toString() => "id = $id, eType = $eType, move = $move";

}

