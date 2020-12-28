import 'package:floor/floor.dart';
import 'package:rg2_flutter_getx/database/daos/abstract_dao.dart';
import 'package:rg2_flutter_getx/database/entitys/phase_position_item.dart';


@dao
abstract class PhasePositionDao extends AbstractDao<PhasePositionItem> {
  @Query('select * from phasePositions')
  Future<List<PhasePositionItem>> getAllItems();

  @Query('DELETE FROM phasePositions')
  Future<void> clearTable();
}
