import 'dart:core';

import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';

@Entity()
class PageProperties {
  @PrimaryKey(autoGenerate: false)
  int number;
  String title;
  String rootPhase;
  String currentPhase;

  //TODO постараться разобраться с сохранением List<String> в базе
  String backTo;
  @ignore
  RxList<MainDBItem> currentList = <MainDBItem>[].obs;

  PageProperties(
    this.number,
    this.title,
    this.rootPhase,
    this.currentPhase, {
    this.backTo = "",
    this.currentList,
  });

  String toString() {
    return "N = $number, Root - $rootPhase, Cur - $currentPhase";
  }
}
