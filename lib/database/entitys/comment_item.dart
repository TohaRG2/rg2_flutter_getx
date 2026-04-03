import 'package:rg2/database/entitys/main_db_item.dart';

/// Модель данных для представления комментария к этапу изучения.
/// Используется для отображения и хранения пользовательских заметок,
/// связанных с определенными фазами решения кубика.
///
/// Пример использования:
/// ```dart
/// final comment = CommentItem(
///   id: 1,
///   phase: 'f2l',
///   comment: 'Важно следить за ориентацией углов'
/// );
/// ```
class CommentItem {
  /// Уникальный идентификатор комментария
  final int id;

  /// Название фазы/этапа, к которому относится комментарий
  /// (например, 'cross', 'f2l', 'oll', 'pll')
  final String phase;

  /// Текст комментария или заметки
  final String comment;

  /// Создает новый экземпляр [CommentItem].
  ///
  /// Параметры:
  /// - [id]: Уникальный идентификатор
  /// - [phase]: Название фазы
  /// - [comment]: Текст комментария
  const CommentItem({required this.id, required this.phase, required this.comment});

  /// Преобразует объект в Map для сохранения в базе данных или передачи.
  ///
  /// Возвращает Map с ключами: 'id', 'phase', 'comment'
  Map<String, dynamic> toMap() => {
    'id': id,
    'phase': phase,
    'comment' : comment,
  };

  /// Создает экземпляр [CommentItem] из Map (десериализация).
  ///
  /// Параметр [map] должен содержать ключи: 'id', 'phase', 'comment'
  factory CommentItem.fromMap(Map<String, dynamic> map) =>
      CommentItem(id: map['id'] as int, phase: map['phase'] as String, comment: map['comment'] as String);

  /// Создает экземпляр [CommentItem] из [MainDBItem].
  /// Удобно для преобразования элемента базы данных в модель комментария.
  factory CommentItem.fromMainDbItem(MainDBItem item) =>
      CommentItem(id: item.id, phase: item.phase, comment: item.comment);

  @override
  String toString() => "id: $id, phase: $phase, comment: $comment";
}
