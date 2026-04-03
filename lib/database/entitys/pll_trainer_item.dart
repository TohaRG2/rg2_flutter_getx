import 'package:floor/floor.dart';

/// Модель данных для хранения информации об алгоритме PLL (Permutation of Last Layer)
/// в тренере PLL. Используется для тренировки распознавания и запоминания алгоритмов.
///
/// Пример использования:
/// ```dart
/// final pllItem = PllTrainerItem(
///   'T-Perm',
///   'Т-перм',
///   'Мой Т-перм',
///   'Т-перм',
///   'assets/images/pll/t_perm.png',
///   true,
///   id: 1
/// );
/// ```
@Entity(tableName: 'pll_trainer')
class PllTrainerItem {
  /// Уникальный идентификатор алгоритма.
  /// Автогенерируется базой данных при создании новой записи.
  @PrimaryKey(autoGenerate: true)
  final int id;

  /// Международное название алгоритма (стандартное обозначение).
  /// Например: 'T-Perm', 'Y-Perm', 'Ua-Perm'
  String internationalName;

  /// Название алгоритма от Максима Чечнева (авторская система обозначений).
  /// Используется в русскоязычном сообществе спидкуберов.
  String maximName;

  /// Пользовательское название, сохраненное пользователем.
  /// Позволяет задать собственное имя для алгоритма.
  String customName;

  /// Текущее отображаемое название алгоритма.
  /// Может быть установлено в одно из: internationalName, maximName или customName.
  String currentName;

  /// Путь к изображению ситуации PLL в ассетах приложения.
  /// Используется для визуального отображения алгоритма.
  String imagePath;

  /// Флаг, указывающий, должен ли данный алгоритм участвовать в тренировке.
  /// Если false - алгоритм не будет показываться в режиме тестирования.
  bool isChecked;

  /// Создает новый экземпляр [PllTrainerItem].
  ///
  /// Параметры:
  /// - [internationalName]: Международное название алгоритма
  /// - [maximName]: Название от Максима Чечнева
  /// - [customName]: Пользовательское название
  /// - [currentName]: Текущее отображаемое название
  /// - [imagePath]: Путь к изображению
  /// - [isChecked]: Флаг участия в тренировке
  /// - [id]: Уникальный идентификатор (автогенерируется)
  PllTrainerItem(
      this.internationalName,
      this.maximName,
      this.customName,
      this.currentName,
      this.imagePath,
      this.isChecked,
      {required this.id}
  );

  @override
  String toString() => "id = $id, internationalName = $internationalName, "
      "currentName = $currentName, isChecked = $isChecked, imagePath = $imagePath\n";
}