import 'dart:core';

import 'package:floor/floor.dart';

/// Класс для одной записи для хранения состояния RecycleView (номера последней позиции)

@Entity(tableName: "phasePositions")

class PhasePositionItem{
  @PrimaryKey(autoGenerate: false)
  String phase;
  double position;

  PhasePositionItem(this.phase, this.position);
}