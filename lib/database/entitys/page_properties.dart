import 'dart:core';

import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';

/// Класс для БД, для ххранения свойств страницы ViewPager
@Entity()
class PageProperties {
  @PrimaryKey(autoGenerate: false)
  int number;
  String title;
  String rootPhase;
  String currentPhase;
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
