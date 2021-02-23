
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity (tableName: 'pll_trainer')
class PllTrainerItem {
  @PrimaryKey(autoGenerate: true)
  final int id;
  String internationalName = "";
  String maximName = "";
  String customName = "";
  String currentName = "";
  String imagePath = "";
  bool isChecked = true;

  /// Запись PLL алгоритма в базе для PLL тренера.
  /// [internationalName] - международное название алгоритма,
  /// [maximName] - название от Максима Чечнева,
  /// [customName] - сохраненное пользовательское название,
  /// [currentName] - текущее название алгоритма (отображаемое),
  /// [imagePath] - путь к картинке с ситуацией в ассетах,
  /// [isChecked] - может ли алгоритм быть загадан
  PllTrainerItem(
      this.internationalName,
      this.maximName,
      this.customName,
      this.currentName,
      this.imagePath,
      this.isChecked,
      {this.id}
  );

  @override
  String toString() => "id = $id, internationalName = $internationalName, "
      "currentName = $currentName, isChecked = $isChecked, imagePath = $imagePath\n";

}