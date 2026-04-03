
/// Модель данных для представления избранного элемента (алгоритма/этапа).
/// Используется для хранения информации об избранных элементах в локальной базе данных.
///
/// Пример использования:
/// ```dart
/// final favItem = FavItem(
///   id: 1,
///   phase: 'pll',
///   subId: 5
/// );
/// ```
class FavItem {
  /// Уникальный идентификатор элемента
  final int id;

  /// Название фазы/этапа, к которому относится избранный элемент
  /// (например, 'cross', 'f2l', 'oll', 'pll')
  final String phase;

  /// Подидентификатор элемента внутри фазы.
  /// Используется для различения нескольких элементов в одной фазе.
  final int subId;

  /// Создает новый экземпляр [FavItem].
  ///
  /// Параметры:
  /// - [id]: Уникальный идентификатор элемента
  /// - [phase]: Название фазы
  /// - [subId]: Подидентификатор элемента
  const FavItem({required this.id, required this.phase, required this.subId});

  /// Преобразует объект в Map для сохранения в базе данных.
  ///
  /// Возвращает Map с ключами: 'id', 'phase', 'subId'
  Map<String, dynamic> toMap() => {
    'id': id,
    'phase': phase,
    'subId' : subId,
  };

  /// Создает экземпляр [FavItem] из Map (десериализация).
  ///
  /// Параметр [map] должен содержать ключи: 'id', 'phase', 'subId'
  factory FavItem.fromMap(Map<String, dynamic> map) =>
      FavItem(id: map['id'] as int, phase: map['phase'] as String, subId: map['subId'] as int);

  @override
  String toString() => "id: $id, phase: $phase, subId: $subId";
}
