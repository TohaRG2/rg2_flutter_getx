import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:rg2/controllers/init_phases.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/fire_entitys/comment_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/database/main_database.dart';
import 'package:rg2/models/phases.dart';
import 'package:rg2/res/comments/initial_comments.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/res/cubeTypes.dart';
import 'package:rg2/res/favourites/initial_favourites.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/scramble_gen/model/moves.dart';

import '../views/trainers/pll/resources/pll_trainer_variants.dart';

class DBController extends GetxController {
  final _sp = GetStorage();
  bool needInit = false;
  MainDatabase _mainBase;

  Callback callback() => Callback(
      onCreate: (database, version) async {
        logPrint("CreateDataBase callback called");
        needInit = true;
      },
      onOpen: (database) {
        logPrint("OpenDatabase callback called");
        // поменять на true, если надо пересоздать уже существующую базу
        //needInit = false;
      }
  );

  /// Создаем базу данных, при необходимости заполняем содержимым
  Future<MainDatabase> fillDB() async {
    _mainBase = await $FloorMainDatabase
        .databaseBuilder('main.db')
        .addCallback(callback())
        .build();

    if (needInit) {
      logPrint("Инициализируем базу данных");
      await _initCubeTypes();
      await _initPhases();
      await PllTrainerVariants.initDb(_mainBase.pllTrainerDao);
      await _initFavourites();
      await initComments();
      needInit = false;
    } else {
      logPrint("Не первый запуск, инициализация не нужна, но проверяем версию");
    }

    await _checkBaseResourcesVersion();

    return _mainBase;
  }

  /// Заполняем данными основную базу с текстовками обучалок/ссылками на видео/комментами
  Future _initPhases() async {
    // logPrint("initPhasePositions");
    // await _mainBase.phasePositionDao.clearTable();
    logPrint("InitCubes");
    await _mainBase.mainDao.clearTable();
    await Future.forEach(phasesToInit,(Phase phase) async {
      await _initPhase(phase);
    });

    //-----------------------------
    await _mainBase.movesDao.clearTable();
    await Future.forEach(movesToInit, (Moves moves) async {
      await _initBasicMoves(moves);
    });
  }

  Future _initPhase(Phase phase) async {
    List<MainDBItem> phaseList = [];
    for (var i = 0; i < phase.count; i++) {
      var item = MainDBItem(
          phase: phase.phase,
          id: i,
          title: phase.titles()[i],
          icon: phase.icons()[i],
          description: phase.descriptions()[i],
          url: phase.urls()[i],
          comment: phase.comments()[i],
          isFavourite: false,
          favComment: "",
          subId: 0);
      phaseList.add(item);
    }
    await _mainBase.mainDao.insertItems(phaseList);
  }

  Future _initBasicMoves(Moves moves) async {
    for (var i = 0; i < moves.count; i++) {
      var item = BasicMove(
          eType: moves.eType,
          id: i,
          move: moves.moves()[i],
          icon: moves.icons()[i],
          toast: moves.toasts()[i]);
      await _mainBase.movesDao.insertItem(item);
    }
  }

  /// Инициализируем основные фазы (страницы для viewPager)
  Future _initCubeTypes() async {
    var list = CubeTypes().list();
    list.forEach((item) => _mainBase.pagePropertiesDao.insertOrReplace(item));
  }

  /// Задаем начальные значения для Избранного
  _initFavourites() async {
    logPrint("_initialFavourites");
    List<FavItem> favItems = InitialFavourites.favItems;
    List<MainDBItem> mainDBItems = [];
    // асинхронный цикл для всех записей в favItems, с ожиданием выполнения операции над каждым элементом
    await Future.forEach(favItems,(FavItem favItem) async {
      var mainDBItem = await _mainBase.mainDao.getItem(favItem.phase, favItem.id);
      mainDBItem.isFavourite = true;
      mainDBItem.subId = favItem.subId;
      mainDBItems.add(mainDBItem);
    });
    // обновляем записи для которых указали избранное
    _mainBase.mainDao.updateItems(mainDBItems);
  }


  /// Задаем начальные комментарии для некоторых этапов
  Future<List<MainDBItem>> initComments() async {
    logPrint("_initialComments");
    List<CommentItem> commentItems = InitialComments.commentItems;
    List<MainDBItem> mainDBItems = [];
    // асинхронный цикл для всех записей в commentItem, с ожиданием выполнения операции над каждым элементом
    await Future.forEach(commentItems,(CommentItem commentItem) async {
      var mainDBItem = await _mainBase.mainDao.getItem(commentItem.phase, commentItem.id);
      mainDBItem.comment = commentItem.comment;
      mainDBItems.add(mainDBItem);
    });
    // обновляем записи для которых указали комменты
    // logPrint("_initComments - $mainDBItems");
    _mainBase.mainDao.updateItems(mainDBItems);
    return mainDBItems;
  }

  /// Сохраненный локально номер версии приложения. Если его еще не сохраняли (нет в сторадже), то 0
  String get buildNumber => _sp.read(Const.BUILD_NUMBER);
  set buildNumber(String value) {
    _sp.write(Const.BUILD_NUMBER, value);
  }

  String get version => _sp.read(Const.VERSION);
  set version(String value) {
    _sp.write(Const.VERSION, value);
  }

  Future<void> _checkBaseResourcesVersion() async {
    var _build = buildNumber;
    var _version = version;
    logPrint("checkBaseResourcesVersion - проверка версии ресурсов в базе, была версия: $_version - $_build");

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String curVersion = packageInfo.version;
    String curBuild = packageInfo.buildNumber;

    logPrint("checkBaseResourcesVersion - текущая версия $curVersion - $curBuild");

    if (_version != null && _version != curVersion) {
      await _updateMainBaseFromLocal();
      _updateResourcesVersion(curVersion, curBuild);
    } else if (_version == null) {
      _updateResourcesVersion(curVersion, curBuild);
    }
  }

  void _updateResourcesVersion(String curVersion, String curBuild) {
    version = curVersion;
    buildNumber = curBuild;
  }

  Future<bool> _updateMainBaseFromLocal() async {

    logPrint("updateMainBaseFunction - start");
    await Future.forEach(phasesToInit, (Phase phase) async {
      logPrint("updateMainBaseFromLocal - ${phase.phase}");
      List<MainDBItem> itemsFromBase = await _mainBase.mainDao.getPhase(phase.phase);
      List<MainDBItem> itemsForUpdate = [];
      for (var i = 0; i < phase.count; i++) {
        var itemFromBase = itemsFromBase.firstWhere(
              (mainDBItem) => mainDBItem.id == i,
          orElse: () => null,
        );
        var baseComment = itemFromBase?.comment ?? "";
        var baseIsFavourite = itemFromBase?.isFavourite ?? false;
        var baseSubId = itemFromBase?.subId ?? 0;
        var baseFavComment = itemFromBase?.favComment ?? "";
        // logPrint("updateMainBaseFromLocal - ${phase.phase}, $i, ${phase.titles()[i]}, ${phase.icons()[i]}, $baseComment, $baseIsFavourite, $baseFavComment, $baseSubId ");
        MainDBItem itemForUpdate = MainDBItem(
            phase: phase.phase,
            id: i,
            title: phase.titles()[i],
            icon: phase.icons()[i],
            description: phase.descriptions()[i],
            url: phase.urls()[i],
            comment: baseComment,
            isFavourite: baseIsFavourite,
            favComment: baseFavComment,
            subId: baseSubId
        );
        itemsForUpdate.add(itemForUpdate);
      }
      logPrint("updateMainBaseFromLocal - update item $itemsForUpdate");
      _mainBase.mainDao.updateItems(itemsForUpdate);
    });

    logPrint("updateMainBaseFunction - end");
    return true;

  }

}