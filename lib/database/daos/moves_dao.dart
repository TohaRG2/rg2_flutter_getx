import 'package:floor/floor.dart';
import 'package:rg2/database/daos/abstract_dao.dart';
import 'package:rg2/database/entitys/basic_move.dart';


@dao
abstract class MovesDao extends AbstractDao<BasicMove> {
  @Query('select * from basic_moves')
  Future<List<BasicMove>> getAllItems();

  @Query('SELECT * FROM basic_moves WHERE eType = :eType ORDER BY id')
  Future<List<BasicMove>> getTypeItems(String eType);

  @Query('DELETE FROM basic_moves')
  Future<void> clearTable();
}
