import 'package:flutter/material.dart';
import 'package:rg2/res/constants.dart';

/// Map c дефолтными значениями для глобальных параметров программы
Map<String, dynamic> defaultSettings = {
  // основной цвет - оранжевый
  Const.PRIMARY_COLOR : Colors.orange[600].value,
  // цвет акцента - зеленый
  Const.ACCENT_COLOR : Colors.green[600].value,
  // темная тема вкл.
  Const.IS_THEME_DARK : true,
  // относительный размер шрифта
  Const.SCALE_FACTOR : 1.0,
  // свайпы во viewPager
  Const.IS_SWIPE_ENABLED : true,
  // включено ли отображение подсказок при старте программы
  Const.IS_START_HELP_ENABLED : true,
  // режим использования интернета
  Const.INTERNET_USAGE: 0,
  // умолчательная страница в нижнем меню (0 - обучалки)
  Const.BOTTOM_ITEM : 0,
  // умолчательная страница в обучалках
  Const.CURRENT_PAGE_NUMBER : 1,
  // умолчательная страница в информации о программе
  Const.CURRENT_INFO_PAGE_NUMBER : 0,
  // Режим разработчика
  Const.GOD_MODE : false,

  /// Настройки генератора скрамблов
  // без переплавки буфера ребер
  Const.IS_EDGE_ENABLED : true,
  // без переплавки буфера углов
  Const.IS_CORNER_ENABLED : true,
  // длина генерируемого скрамбла
  Const.SCRAMBLE_LENGTH : 14,
  // текущий скрамбл
  Const.CURRENT_SCRAMBLE : "R F L B U2 L B' R F' D B R L F D R' D L",
  // отображать результат решения блайнда
  Const.SHOW_DECISION : true,

  /// Настройки азбуки блайндов
  // Текущая азбука
  Const.CURRENT_AZBUKA : "",
  // сохраненная азбука
  Const.CUSTOM_AZBUKA : "",
  // цвета (расположение кубика) для текущей азбуки
  Const.CURRENT_AZBUKA_COLORS : "",
  // цвета (расположение кубика) для сохраненной азбуки
  Const.CUSTOM_AZBUKA_COLORS : "",

  /// Настройки для таймера
  // управление таймером одной рукой
  Const.IS_ONE_HANDED : false,
  // цветные ли иконки сохранения результата
  Const.IS_ICONS_COLORED : true,
  // задержка при запуске таймера
  Const.IS_DELAYED_START : true,
  // включен ли метроном
  Const.IS_METRONOM_ENABLED : true,
  // частота метронома (ударов в минуту)
  Const.METRONOM_FREQUENCY : 60,
  // отображение скрамбла
  Const.SHOW_SCRAMBLE : true,
  // размер шрифта для скрамбла
  Const.SCRAMBLE_TEXT_RATIO : 1.0,
  // порядок сортировки результатов сборки
  Const.RESULT_ORDER_BY : "solvingTime",

  /// Настройки для PLL тренажера
  // случайная передняя сторона
  Const.RANDOM_FRONT_SIDE : false,
  // случайный доворот верхей грани
  Const.RANDOM_AUF : false,
  // распознавание по двум сторонам
  Const.TWO_SIDE_RECOGNITION : false,
  // тренировка на время
  Const.IS_PLL_TIMER_ENABLED : true,
  // время на ответ
  Const.PLL_TIME_FOR_ANSWER : 7,
  // все 21 кнопка или несколько вариантов
  Const.PLL_SHOW_ALL_VARIANTS : true,
  // количество вариантов (2,4,6,8)
  Const.PLL_VARIANTS_COUNT : 6,
  // задержка после удачной попытки (сек)
  Const.PLL_GOOD_ANSWER_WAITING : 1,
  // задержка после неудачной попытки (сек)
  Const.PLL_BAD_ANSWER_WAITING : 5,

  /// Настройки для тренажера азбуки блайндов
  // загадывание углов
  Const.IS_AZBUKA_CORNER_ENABLED : true,
  // загадывание ребер
  Const.IS_AZBUKA_EDGE_ENABLED : true,
  // тренировка на время
  Const.IS_AZBUKA_TIMER_ENABLED : true,
  //время на ответ
  Const.AZBUKA_TIME_FOR_ANSWER : 7,
  // задержка после удачной попытки (сек)
  Const.AZBUKA_GOOD_ANSWER_WAITING : 1,
  // задержка после неудачной попытки (сек)
  Const.AZBUKA_BAD_ANSWER_WAITING : 5,

  /// Настройки для ютубплеера
  Const.YOU_TUBE_PLAYER_SPEED : 1.0,

  /// Настройки для покупок
  // Текущее количество монеток
  Const.CURRENT_COINS : 15,
  // Количество монеток при первом входе и покупке при 0
  Const.INITIAL_COINS : 15,
  // Трятятся ли монетки на просмотр обучалок
  Const.IS_AD_DISABLED : false,
  // Куплены ли доп.головоломки (разрешен их просмотр)
  Const.IS_ALL_PUZZLES_ENABLED : false,
  // Уровень покупателя 0 - ничего не куплено ... 3 - ВИП
  Const.PURCHASER_STATE : 0,

};