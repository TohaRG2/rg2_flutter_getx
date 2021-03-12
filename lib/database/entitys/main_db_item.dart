
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

  ///список backFrom фаз на которые нужно возвращаться с текущей. типа backFrom['G2F'] = 'MAIN3X3'
  ///для корневых(основных) фаз backFrom будет возвращать null
  @ignore
  static var backFrom = Map<String, String>();

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
  //String toString() => "title = $title, url = $url";

  String getAssetFilePath() {
    String path = "";
    var iconName = icon.replaceAll(".xml", "");
    if (iconName.endsWith(".svg") || iconName.endsWith(".png")) {              //Если есть расширение, то считаем, что путь указан полностью
      path = iconName;
    } else {
      var subDir = getAssetPath();
      path = "assets/images/$subDir/$iconName.svg";
    }
    return path;
  }

  /// Возвращаем путь к файлу иконки фазы в ассетах
  String getAssetPath() {
    //тест получения основной фазы по текущей
    var rootPhase = getRootPhaseFor(phase);

    var subDir = phase.toLowerCase();
    if (rootPhase != phase) {
      subDir = "${rootPhase.toLowerCase()}/$subDir";
    }
    return subDir;
  }

  //Получаем название основной root фазы для любой фазы
  static getRootPhaseFor(String phase){
    var rootPhase = phase;
    while (backFrom[rootPhase] != null) {
      rootPhase = backFrom[rootPhase];
    }
    return rootPhase;
  }

}

