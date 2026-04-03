
/// Модель данных для хранения произвольных свойств/настроек приложения.
/// Используется как универсальный контейнер для ключ-значение пар с меткой времени.
///
/// Пример использования:
/// ```dart
/// final themeProperty = Property(
///   key: 'theme_mode',
///   value: 'dark',
///   changeDate: DateTime.now()
/// );
/// ```
class Property {
  /// Ключ свойства (уникальный идентификатор настройки).
  /// Например: 'theme_mode', 'language', 'timer_settings'
  final String key;

  /// Значение свойства. Может быть любого типа (dynamic).
  /// Например: строка, число, булево значение или сложный объект.
  final dynamic value;

  /// Дата и время последнего изменения свойства.
  /// Используется для отслеживания истории изменений.
  final DateTime changeDate;

  /// Создает новый экземпляр [Property].
  ///
  /// Параметры:
  /// - [key]: Ключ свойства
  /// - [value]: Значение свойства
  /// - [changeDate]: Дата изменения (по умолчанию текущее время)
  Property({required this.key, required this.value, DateTime? changeDate})
      : changeDate = changeDate ?? DateTime.now();

  /// Преобразует объект в Map для сохранения в базе данных или передачи.
  ///
  /// Возвращает Map с ключами: 'key', 'value', 'changeDate'
  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
        'changeDate': changeDate,
      };

  /// Создает экземпляр [Property] из Map (десериализация).
  /// Обрабатывает возможные исключения при преобразовании даты.
  ///
  /// Параметр [map] должен содержать ключи: 'key', 'value', 'changeDate'
  factory Property.fromMap(Map<String, dynamic> map) {
    final dynamic ch = map['changeDate'];
    DateTime? dt;
    try {
      dt = ch?.toDate();
    } catch (_) {
      dt = ch is DateTime ? ch : null;
    }
    return Property(
      key: map['key'],
      value: map['value'],
      changeDate: dt,
    );
  }

  @override
  String toString() => "key: $key, value: $value, chDate: $changeDate";
}
