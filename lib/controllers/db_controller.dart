import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/database/entitys/basic_move.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';
import 'package:rg2_flutter_getx/database/main_database.dart';
import 'package:rg2_flutter_getx/models/phases.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_3x3.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_4x4.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_5x5.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_clover.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_container.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_ivy.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_pyraminx.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_pyraminx_4x4.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_redi.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_skewb.dart';
import 'package:rg2_flutter_getx/res/azbuka/basic_square.dart';
import 'package:rg2_flutter_getx/res/cubeTypes.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main2x2/advanced2x2.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main2x2/begin2x2.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main2x2/cll.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main2x2/ortega.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_2x2.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_3x3.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/accel.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/blind.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/chechnev.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/coll.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/f2l/adv_f2l.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/cross.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/f2l/f2l.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/f2l/int_f2l.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/main_f2l.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/oll.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/pll.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/g2f/roux.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/patterns.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main3x3/rozov.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_big.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_big/begin_4x4.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_big/begin_5x5.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_big/big_cubes.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_big/blind_4x4.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_big/yau_4x4.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/cuboid2x2x3.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/main_pyraminx.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/main_pyraminx/keyhole.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/main_pyraminx/pyraminx.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/main_pyraminx/pyraminx_4x4.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/megaminx.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/pentacle.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/square.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other/square_star.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/axis.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/brick_cube.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/cuboid3x3x2.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/cylinder.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/fisher.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/gear.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/ghost.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/mirror.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/penrose.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/prisma.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/pyramorphix.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/sudoku.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/twistyCube.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_other3x3/windmill.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb/clover.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb/container.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb/ivy.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb/redi_cube.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb/skewb.dart';
import 'package:rg2_flutter_getx/res/mainMenu/main_skewb/twisty_skewb.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/moves.dart';

import '../views/trainers/pll/resources/pll_trainer_variants.dart';

class DBController extends GetxController {
  bool needInit = false;
  MainDatabase _mainBase;

  Callback callback() => Callback(
      onCreate: (database, version) async {
        print("CreateDataBase callback called");
        needInit = true;
      },
      onOpen: (database) {
        print("OpenDatabase callback called");
      }
  );

  Future<MainDatabase> fillDB() async {
    _mainBase = await $FloorMainDatabase
        .databaseBuilder('main.db')
        .addCallback(callback())
        .build();
    if (needInit) {
      await _initCubeTypes();
      await _initPhases();
      await PllTrainerVariants.initDb(_mainBase.pllTrainerDao);
      //print("Init DB with db.dao");
      needInit = false;
    } else {
      //print("not first start, db.init don't need");
      //TODO Пока на время написания программы, будем пересоздавать базу каждый раз
      await _initCubeTypes();
      await _initPhases();
      print("fillDB complete");
    }

    return _mainBase;
  }

  Future _initPhases() async {
    // print("initPhasePositions");
    // await _mainBase.phasePositionDao.clearTable();
    // await _loadSomePositions();
    print("InitCubes");
    await _mainBase.mainDao.clearTable();
    await _initPhase(BigMain());
    await _initPhase(Cross());
    await _initPhase(G2f());
    await _initPhase(Main2x2());
    await _initPhase(Main3x3());
    await _initPhase(MainF2l());
    await _initPhase(MainOther());
    await _initPhase(MainOther3x3());
    await _initPhase(MainPyraminx());
    await _initPhase(MainSkewb());

    //------------------------------
    await _initPhase(Accel());
    await _initPhase(AdvF2L());
    await _initPhase(Advanced2x2());
    await _initPhase(Axis());
    await _initPhase(Begin());
    await _initPhase(Begin2x2());
    await _initPhase(Begin4x4());
    await _initPhase(Begin5x5());
    await _initPhase(BigCubes());
    await _initPhase(Blind());
    await _initPhase(Blind4x4());
    await _initPhase(BrickCube());
    await _initPhase(Clover());
    await _initPhase(Cll());
    await _initPhase(Coll());
    await _initPhase(ContainerCube());
    await _initPhase(Cuboid2x2x3());
    await _initPhase(Cuboid3x3x2());
    await _initPhase(Cylinder());
    await _initPhase(F2l());
    await _initPhase(Fisher());
    await _initPhase(Gear());
    await _initPhase(Ghost());
    await _initPhase(IntF2l());
    await _initPhase(Ivy());
    await _initPhase(Keyhole());
    await _initPhase(Megaminx());
    await _initPhase(Oll());
    await _initPhase(Ortega());
    await _initPhase(Mirror());
    await _initPhase(Patterns());
    await _initPhase(Pentacle());
    await _initPhase(Penrose());
    await _initPhase(Pll());
    await _initPhase(Prisma());
    await _initPhase(Pyramorphix());
    await _initPhase(Pyraminx());
    await _initPhase(Pyraminx4x4());
    await _initPhase(RediCube());
    await _initPhase(Rozov());
    await _initPhase(Roux());
    await _initPhase(Skewb());
    await _initPhase(Square());
    await _initPhase(SquareStar());
    await _initPhase(Sudoku());
    await _initPhase(TwistyCube());
    await _initPhase(TwistySkewb());
    await _initPhase(Windmill());
    await _initPhase(Yau4x4());

    //-----------------------------
    await _mainBase.movesDao.clearTable();
    await _initBasicMoves(Basic3x3());
    await _initBasicMoves(Basic4x4());
    await _initBasicMoves(Basic5x5());
    await _initBasicMoves(BasicClover());
    await _initBasicMoves(BasicContainer());
    await _initBasicMoves(BasicIvy());
    await _initBasicMoves(BasicPyraminx());
    await _initBasicMoves(BasicPyraminx4x4());
    await _initBasicMoves(BasicRedi());
    await _initBasicMoves(BasicSkewb());
    await _initBasicMoves(BasicSquare());
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
      _mainBase.mainDao.insertItem(item);
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
      _mainBase.movesDao.insertItem(item);
    }
  }
  
  Future _initCubeTypes() async {
    var list = CubeTypes().list();
    list.forEach((item) => _mainBase.pagePropertiesDao.insertOrReplace(item));
  }

}