
import 'package:floor/floor.dart';

/// Модель данных для хранения записи о времени сборки кубика в локальной базе данных.
/// Используется для сохранения статистики тренировок с таймером.
///
/// Пример использования:
/// ```dart
/// final timeNote = TimeNoteItem(
///   '12.34',
///   DateTime.now(),
///   'R U R\' U\'',
///   'Хорошая сборка',
///   uuid: 1
/// );
/// ```
@Entity(tableName: 'times')
class TimeNoteItem {
  /// Уникальный идентификатор записи (UUID).
  /// Автогенерируется базой данных при создании новой записi.
  @PrimaryKey(autoGenerate: true)
  final int? uuid;

  /// Время сборки в секундах (строковое представление).
  /// Например: '12.34', '9.87'
  final String solvingTime;

  /// Дата и время совершения записи.
  /// Используется для статистики и истории тренировок.
  final DateTime dateTime;

  /// Скэймбл (начальная раскладка), использованная при сборке.
  /// Например: 'R U R\' U\' R\' F R F\''
  final String scramble;

  /// Комментарий пользователя к данной сборке.
  /// Может содержать заметки о технике, ошибках или достижениях.
  final String comment;

  /// Создает новый экземпляр [TimeNoteItem].
  ///
  /// Параметры:
  /// - [solvingTime]: Время сборки (строка)
  /// - [dateTime]: Дата и время сборки
  /// - [scramble]: Скэймбл (начальная раскладка)
  /// - [comment]: Комментарий пользователя
  /// - [uuid]: Уникальный идентификатор (автогенерируется, если не указан)
  TimeNoteItem(this.solvingTime, this.dateTime, this.scramble, this.comment, {this.uuid});

  @override
  String toString() => "uuid = $uuid, solvingTime = $solvingTime, dateTime = $dateTime, scramble = $scramble, comment = $comment\n";
}
