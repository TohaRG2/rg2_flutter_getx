import 'dart:core';

import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/main_db_item.dart';

/// Модель данных для хранения состояния страницы ViewPager в базе данных.
/// Сохраняет информацию о текущей позиции, заголовке и навигационных параметрах,
/// что позволяет восстанавливать состояние при переключении между страницами.
///
/// Пример использования:
/// ```dart
/// final pageProps = PageProperties(
///   0,
///   'Основной',
///   'main3x3',
///   'cross',
///   backTo: 'previous_phase'
/// );
/// ```
@Entity()
class PageProperties {
  /// Уникальный номер страницы (позиция в ViewPager).
  /// Используется как первичный ключ, не автогенерируется.
  @PrimaryKey(autoGenerate: false)
  int number;

  /// Заголовок страницы, отображаемый пользователю
  String title;

  /// Корневая (основная) фаза, к которой относится данная страница.
  /// Используется для определения иерархии и навигации.
  String rootPhase;

  /// Текущая активная фаза на данной странице.
  /// Может отличаться от корневой, если пользователь перешел в подраздел.
  String currentPhase;

  /// Фаза, в которую нужно вернуться при нажатии кнопки "Назад".
  /// Пустая строка, если возврат не требуется.
  String backTo;

  /// Список элементов (алгоритмов) для текущей фазы.
  /// Используется для отображения в UI и не сохраняется в базе данных.
  /// Является реактивным списком GetX для автоматического обновления UI.
  @ignore
  RxList<MainDBItem> currentList = <MainDBItem>[].obs;

  /// Создает новый экземпляр [PageProperties].
  ///
  /// Параметры:
  /// - [number]: Номер страницы (позиция в ViewPager)
  /// - [title]: Заголовок страницы
  /// - [rootPhase]: Корневая фаза
  /// - [currentPhase]: Текущая активная фаза
  /// - [backTo]: Фаза для возврата (по умолчанию пустая строка)
  PageProperties(
    this.number,
    this.title,
    this.rootPhase,
    this.currentPhase, {
    this.backTo = "",
  });

  @override
  String toString() {
    return "N = $number, Root - $rootPhase, Cur - $currentPhase";
  }
}
