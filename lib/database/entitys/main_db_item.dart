
import 'package:floor/floor.dart';

/// Основная модель данных для хранения информации об элементах (этапах/алгоритмах)
/// в локальной базе данных. Представляет собой центральный элемент системы обучения,
/// содержащий всю необходимую информацию для отображения и работы с алгоритмами.
///
/// Пример использования:
/// ```dart
/// final item = MainDBItem(
///   id: 1,
///   phase: 'f2l',
///   title: 'Первый алгоритм F2L',
///   icon: 'f2l_1',
///   description: 'Описание алгоритма',
///   url: 'https://example.com/video',
///   comment: 'Пользовательский комментарий',
///   isFavourite: true,
///   favComment: 'Заметка для избранного',
///   subId: 1
/// );
/// ```
@Entity(tableName: 'main', primaryKeys: ['id', 'phase'])
class MainDBItem {
  /// Уникальный идентификатор элемента в рамках фазы
  final int id;

  /// Название фазы/этапа решения (например, 'cross', 'f2l', 'oll', 'pll')
  /// Используется как часть составного первичного ключа
  final String phase;

  /// Заголовок/название элемента (алгоритма)
  String title;

  /// Имя иконки или путь к изображению для визуального представления
  String icon;

  /// Подробное описание элемента или алгоритма
  String description;

  /// URL-адрес связанного ресурса (например, видео с алгоритмом)
  String url;

  /// Пользовательский комментарий к элементу
  String comment;

  /// Флаг, указывающий, добавлен ли элемент в избранное
  bool isFavourite;

  /// Комментарий, связанный с избранным элементом
  String favComment;

  /// Подидентификатор элемента внутри фазы.
  /// Используется для различия нескольких вариантов одного алгоритма.
  int subId;

  /// Статический словарь для хранения иерархии фаз.
  /// Сопоставляет дочерние фазы их родительским фазам.
  ///
  /// Пример: backFrom['G2F'] = 'MAIN3X3' означает, что фаза 'G2F'
  /// является дочерней для 'MAIN3X3' и при возврате нужно перейти в 'MAIN3X3'.
  /// Для корневых (основных) фаз значение будет null.
  ///
  /// Помечено как @ignore, так как не сохраняется в базе данных.
  @ignore
  static var backFrom = <String, String>{};

  /// Создает новый экземпляр [MainDBItem].
  ///
  /// Параметры:
  /// - [id]: Уникальный идентификатор элемента
  /// - [phase]: Название фазы
  /// - [title]: Заголовок элемента (по умолчанию пустая строка)
  /// - [icon]: Имя иконки (по умолчанию пустая строка)
  /// - [description]: Описание элемента (по умолчанию пустая строка)
  /// - [url]: URL-адрес ресурса (по умолчанию пустая строка)
  /// - [comment]: Пользовательский комментарий (по умолчанию пустая строка)
  /// - [isFavourite]: Флаг избранного (по умолчанию false)
  /// - [favComment]: Комментарий для избранного (по умолчанию пустая строка)
  /// - [subId]: Подидентификатор (по умолчанию 0)
  MainDBItem({
    required this.id,
    required this.phase,
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
  String toString() => "title = $title, subId = $subId, isFav = $isFavourite, comm = $comment";

  /// Возвращает полный путь к файлу иконки элемента в ассетах.
  ///
  /// Если в названии иконки указано расширение (.svg или .png),
  /// то оно используется как полный путь. В противном случае путь
  /// строится на основе фазы и названия иконки.
  ///
  /// Примеры:
  /// - "icon.png" -> "icon.png"
  /// - "f2l_icon" (для фазы 'f2l') -> "assets/images/f2l/f2l_icon.png"
  String getAssetFilePath() {
    String path = "";
    var iconName = icon.replaceAll(".xml", "");
    if (iconName.endsWith(".svg") || iconName.endsWith(".png")) {
      // Если есть расширение, считаем, что путь указан полностью
      path = iconName;
    } else {
      var subDir = getAssetPath();
      path = "assets/images/$subDir/$iconName.png";
    }
    return path;
  }

  /// Возвращает относительный путь к директории с иконками для текущей фазы.
  ///
  /// Учитывает иерархию фаз: если текущая фаза является дочерней,
  /// то путь строится как "root_phase/current_phase".
  ///
  /// Примеры:
  /// - Для фазы 'f2l' -> "f2l"
  /// - Для дочерней фазы 'g2f' (родитель 'main3x3') -> "main3x3/g2f"
  String getAssetPath() {
    var rootPhase = getRootPhaseFor(phase);

    var subDir = phase.toLowerCase();
    if (rootPhase != phase) {
      subDir = "${rootPhase.toLowerCase()}/$subDir";
    }
    return subDir;
  }

  /// Статический метод для получения корневой (основной) фазы для любой фазы.
  ///
  /// Рекурсивно поднимается по иерархии фаз, пока не найдет корневую фазу,
  /// у которой нет родителя в словаре [backFrom].
  ///
  /// Параметр [phase] - название фазы, для которой нужно найти корень.
  ///
  /// Пример:
  /// - getRootPhaseFor('g2f') -> 'main3x3' (если backFrom['g2f'] = 'main3x3')
  static String getRootPhaseFor(String phase) {
    String rootPhase = phase;
    while (backFrom[rootPhase] != null) {
      rootPhase = backFrom[rootPhase]!;
    }
    return rootPhase;
  }
}

