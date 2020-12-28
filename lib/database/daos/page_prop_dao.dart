import 'package:floor/floor.dart';
import 'package:rg2_flutter_getx/database/daos/abstract_dao.dart';
import 'package:rg2_flutter_getx/database/entitys/page_properties.dart';


@dao
abstract class PagePropertiesDao extends AbstractDao<PageProperties> {
  @Query('select * from pageProperties')
  Future<List<PageProperties>> getAllItems();

  @Query('DELETE FROM pageProperties')
  Future<void> clearTable();
}
