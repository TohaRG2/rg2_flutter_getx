import 'dart:core';

import 'package:floor/floor.dart';

/// Модель данных для сохранения позиции прокрутки списка (RecyclerView)
/// в базе данных. Позволяет восстанавливать последнюю просмотренную позицию
/// при возвращении пользователя к данной фазе.
///
/// Пример использования:
/// ```dart
/// final position = PhasePositionItem('f2l', 5.5);
/// ```
@Entity(tableName: "phasePositions")
class PhasePositionItem {
  /// Название фазы, для которой сохраняется позиция.
  /// Используется как первичный ключ (уникальный идентификатор).
  @PrimaryKey(autoGenerate: false)
  String phase;

  /// Номер позиции прокрутки (может быть дробным для плавного скролла).
  /// Представляет собой индекс элемента в списке или смещение в пикселях.
  double position;

  /// Создает новый экземпляр [PhasePositionItem].
  ///
  /// Параметры:
  /// - [phase]: Название фазы
  /// - [position]: Позиция прокрутки
  PhasePositionItem(this.phase, this.position);

  @override
  String toString() {
    return "($phase: $position)";
  }
}