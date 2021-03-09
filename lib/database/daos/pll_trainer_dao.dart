import 'package:floor/floor.dart';
import 'package:rg2/database/daos/abstract_dao.dart';
import 'package:rg2/database/entitys/pll_trainer_item.dart';

@dao
abstract class PllTrainerDao extends AbstractDao<PllTrainerItem> {
  @Query('SELECT * FROM PLL_TRAINER')
  Future<List<PllTrainerItem>> getAllItems();

  @Query('DELETE FROM PLL_TRAINER')
  Future<void> clearTable();
}