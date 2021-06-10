import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/fire_entitys/comment_item.dart';
import 'package:rg2/database/fire_entitys/fav_item.dart';
import 'package:rg2/database/main_database.dart';
import 'package:rg2/models/phases.dart';
import 'package:rg2/res/azbuka/basic_3x3.dart';
import 'package:rg2/res/azbuka/basic_4x4.dart';
import 'package:rg2/res/azbuka/basic_5x5.dart';
import 'package:rg2/res/azbuka/basic_clover.dart';
import 'package:rg2/res/azbuka/basic_container.dart';
import 'package:rg2/res/azbuka/basic_ivy.dart';
import 'package:rg2/res/azbuka/basic_pyraminx.dart';
import 'package:rg2/res/azbuka/basic_pyraminx_4x4.dart';
import 'package:rg2/res/azbuka/basic_redi.dart';
import 'package:rg2/res/azbuka/basic_skewb.dart';
import 'package:rg2/res/azbuka/basic_square.dart';
import 'package:rg2/res/comments/initial_comments.dart';
import 'package:rg2/res/cubeTypes.dart';
import 'package:rg2/res/favourites/initial_favourites.dart';
import 'package:rg2/res/mainMenu/main2x2/advanced2x2.dart';
import 'package:rg2/res/mainMenu/main2x2/begin2x2.dart';
import 'package:rg2/res/mainMenu/main2x2/cll.dart';
import 'package:rg2/res/mainMenu/main2x2/ortega.dart';
import 'package:rg2/res/mainMenu/main_2x2.dart';
import 'package:rg2/res/mainMenu/main_3x3.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/accel.dart';
import 'package:rg2/res/mainMenu/main3x3/blind.dart';
import 'package:rg2/res/mainMenu/main3x3/chechnev.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/coll.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/f2l/adv_f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/cross.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/f2l/f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/f2l/int_f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/main_f2l.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/oll.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/pll.dart';
import 'package:rg2/res/mainMenu/main3x3/g2f/roux.dart';
import 'package:rg2/res/mainMenu/main3x3/patterns.dart';
import 'package:rg2/res/mainMenu/main3x3/rozov.dart';
import 'package:rg2/res/mainMenu/main_big.dart';
import 'package:rg2/res/mainMenu/main_big/begin_4x4.dart';
import 'package:rg2/res/mainMenu/main_big/begin_5x5.dart';
import 'package:rg2/res/mainMenu/main_big/big_cubes.dart';
import 'package:rg2/res/mainMenu/main_big/blind_4x4.dart';
import 'package:rg2/res/mainMenu/main_big/yau_4x4.dart';
import 'package:rg2/res/mainMenu/main_other.dart';
import 'package:rg2/res/mainMenu/main_other/cuboid2x2x3.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx/keyhole.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx/pyraminx.dart';
import 'package:rg2/res/mainMenu/main_other/main_pyraminx/pyraminx_4x4.dart';
import 'package:rg2/res/mainMenu/main_other/megaminx.dart';
import 'package:rg2/res/mainMenu/main_other/pentacle.dart';
import 'package:rg2/res/mainMenu/main_other/square.dart';
import 'package:rg2/res/mainMenu/main_other/square_star.dart';
import 'package:rg2/res/mainMenu/main_other3x3.dart';
import 'package:rg2/res/mainMenu/main_other3x3/axis.dart';
import 'package:rg2/res/mainMenu/main_other3x3/brick_cube.dart';
import 'package:rg2/res/mainMenu/main_other3x3/cuboid3x3x2.dart';
import 'package:rg2/res/mainMenu/main_other3x3/cylinder.dart';
import 'package:rg2/res/mainMenu/main_other3x3/fisher.dart';
import 'package:rg2/res/mainMenu/main_other3x3/gear.dart';
import 'package:rg2/res/mainMenu/main_other3x3/ghost.dart';
import 'package:rg2/res/mainMenu/main_other3x3/mirror.dart';
import 'package:rg2/res/mainMenu/main_other3x3/penrose.dart';
import 'package:rg2/res/mainMenu/main_other3x3/prisma.dart';
import 'package:rg2/res/mainMenu/main_other3x3/pyramorphix.dart';
import 'package:rg2/res/mainMenu/main_other3x3/sudoku.dart';
import 'package:rg2/res/mainMenu/main_other3x3/twistyCube.dart';
import 'package:rg2/res/mainMenu/main_other3x3/windmill.dart';
import 'package:rg2/res/mainMenu/main_skewb.dart';
import 'package:rg2/res/mainMenu/main_skewb/clover.dart';
import 'package:rg2/res/mainMenu/main_skewb/container.dart';
import 'package:rg2/res/mainMenu/main_skewb/ivy.dart';
import 'package:rg2/res/mainMenu/main_skewb/redi_cube.dart';
import 'package:rg2/res/mainMenu/main_skewb/skewb.dart';
import 'package:rg2/res/mainMenu/main_skewb/twisty_skewb.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/scramble_gen/model/moves.dart';

import '../views/trainers/pll/resources/pll_trainer_variants.dart';

class DBController extends GetxController {
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
      logPrint("Не первый запуск, инициализация не нужна");
      // await _initCubeTypes();
      // await _initPhases();
      //logPrint("fillDB complete");
    }

    return _mainBase;
  }

  /// Список фаз для инициализации базы
  var phasesToInit = <Phase>[
    //--- Основные пункты меню
    BigMain(), Cross(), G2f(), Main2x2(), Main3x3(), MainF2l(),
    MainOther(), MainOther3x3(), MainPyraminx(), MainSkewb(),
    //--- сами головоломки
    Accel(), AdvF2L(), Advanced2x2(), Axis(),
    Begin(), Begin2x2(), Begin4x4(), Begin5x5(), BigCubes(), Blind(), Blind4x4(), BrickCube(),
    Clover(), Cll(), Coll(), ContainerCube(), Cuboid2x2x3(), Cuboid3x3x2(), Cylinder(), F2l(), Fisher(),
    Gear(), Ghost(), IntF2l(), Ivy(), Keyhole(), Megaminx(), Mirror(), Oll(), Ortega(),
    Patterns(), Pentacle(), Penrose(), Pll(), Prisma(), Pyramorphix(), Pyraminx(), Pyraminx4x4(),
    RediCube(), Rozov(), Roux(), Skewb(), Square(), SquareStar(), Sudoku(),
    TwistyCube(), TwistySkewb(), Windmill(), Yau4x4()
  ];

  /// Список фаз с основными движениями головоломок
  var movesToInit = <Moves> [
    Basic3x3(), Basic4x4(), Basic5x5(), BasicClover(), BasicContainer(), BasicIvy(),
    BasicPyraminx(), BasicPyraminx4x4(), BasicRedi(), BasicSkewb(), BasicSquare(),
  ];

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
      await _mainBase.mainDao.insertItem(item);
    }
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
}