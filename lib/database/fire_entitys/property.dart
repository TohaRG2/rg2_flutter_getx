import 'package:flutter/material.dart';

class Property {
  String key;
  dynamic value;
  DateTime changeDate;

  Property({@required this.key, @required this.value, this.changeDate}){
    if (changeDate == null) changeDate = DateTime.now();
  }

  Map<String, dynamic> toMap() => {
    'key': key,
    'value': value,
    'changeDate' : changeDate,
  };

  Property.fromMap(Map<String, dynamic> map) {
    this.key = map['key'];
    this.value = map['value'];
    this.changeDate = map['changeDate'].toDate();
  }

  @override
  toString() => "key: $key, value: $value, chDate: $changeDate";
}