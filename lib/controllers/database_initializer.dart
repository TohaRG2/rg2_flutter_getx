import 'package:rg2/controllers/init_phases.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/database/entitys/comment_item.dart';
import 'package:rg2/database/entitys/fav_item.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/main_database.dart';
import 'package:rg2/models/phases.dart';
import 'package:rg2/res/comments/initial_comments.dart';
import 'package:rg2/res/cubeTypes.dart';
import 'package:rg2/res/favourites/initial_favourites.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/trainers/pll/resources/pll_trainer_variants.dart';
import 'package:rg2/views/trainers/scramble_gen/model/moves.dart';

class DatabaseInitializer {
  final MainDatabase mainBase;

  DatabaseInitializer(this.mainBase);

  Future<void> fullInit() async {
    logPrint("Инициализируем базу данных");
    await initCubeTypes();
    await initPhases();
    await PllTrainerVariants.initDb(mainBase.pllTrainerDao);
    await initFavourites();
    await initComments();
  }

  Future<void> initPhases() async {
    logPrint("InitCubes");
    await mainBase.mainDao.clearTable();
    for (var phase in phasesToInit) {
      await _initPhase(phase);
    }

    await mainBase.movesDao.clearTable();
    for (var moves in movesToInit) {
      await _initBasicMoves(moves);
    }
  }

  Future<void> _initPhase(Phase phase) async {
    List<MainDBItem> phaseList = [];
    for (var i = 0; i < phase.count; i++) {
      phaseList.add(MainDBItem(
        phase: phase.phase,
        id: i,
        title: phase.titles()[i],
        icon: phase.icons()[i],
        description: phase.descriptions()[i],
        url: phase.urls()[i],
        comment: phase.comments()[i],
        isFavourite: false,
        favComment: "",
        subId: 0,
      ));
    }
    await mainBase.mainDao.insertItems(phaseList);
  }

  Future<void> _initBasicMoves(Moves moves) async {
    List<BasicMove> moveList = [];
    for (var i = 0; i < moves.count; i++) {
      moveList.add(BasicMove(
          eType: moves.eType,
          id: i,
          move: moves.moves()[i],
          icon: moves.icons()[i],
          toast: moves.toasts()[i]));
    }
    await mainBase.movesDao.insertItems(moveList);
  }

  Future<void> initCubeTypes() async {
    var list = CubeTypes().list();
    for (var item in list) {
      await mainBase.pagePropertiesDao.insertOrReplace(item);
    }
  }

  Future<void> initFavourites() async {
    logPrint("_initialFavourites");
    List<FavItem> favItems = InitialFavourites.favItems;
    List<MainDBItem> itemsToUpdate = [];

    for (var favItem in favItems) {
      var item = await mainBase.mainDao.getItem(favItem.phase, favItem.id);
      if (item != null) {
        item.isFavourite = true;
        item.subId = favItem.subId;
        itemsToUpdate.add(item);
      }
    }
    await mainBase.mainDao.updateItems(itemsToUpdate);
  }

  Future<List<MainDBItem>> initComments() async {
    logPrint("_initialComments");
    List<CommentItem> commentItems = InitialComments.commentItems;
    List<MainDBItem> itemsToUpdate = [];

    for (var commentItem in commentItems) {
      var item =
          await mainBase.mainDao.getItem(commentItem.phase, commentItem.id);
      if (item != null) {
        item.comment = commentItem.comment;
        itemsToUpdate.add(item);
      }
    }
    await mainBase.mainDao.updateItems(itemsToUpdate);
    return itemsToUpdate;
  }
}
