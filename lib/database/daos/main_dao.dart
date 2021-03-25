import 'package:floor/floor.dart';
import 'package:rg2_flutter_getx/database/daos/abstract_dao.dart';
import 'package:rg2_flutter_getx/database/entitys/main_db_item.dart';


@dao
abstract class MainDao extends AbstractDao<MainDBItem> {

  @Query('select * from main')
  Future<List<MainDBItem>> getAllItems();

  @Query('SELECT * FROM main WHERE phase = :phase and id = :id ORDER BY id')
  Future<MainDBItem> getItem(String phase, int id);

  @Query('SELECT * FROM main WHERE phase = :phase ORDER BY id')
  Future<List<MainDBItem>> getPhase(String phase);

  @Query("SELECT * FROM main WHERE phase = :phase and url <> :submenu ORDER BY ID")
  Future<List<MainDBItem>> getPhasePages(String phase, String submenu);

  @Query("SELECT distinct * FROM main WHERE url = :submenu ORDER BY ID")
  Future<List<MainDBItem>> getSubMenuList(String submenu);

  @Query("SELECT * FROM main WHERE isFavourite = 1 ORDER BY subId")
  Future<List<MainDBItem>> getFavourites();

  @Query('DELETE FROM main')
  Future<void> clearTable();
}
