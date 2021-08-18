import 'package:floor/floor.dart';
import 'package:rg2/database/daos/abstract_dao.dart';
import 'package:rg2/database/entitys/time_note_item.dart';

@dao
abstract class TimesDao extends AbstractDao<TimeNoteItem> {
  @Query('select * from times')
  Future<List<TimeNoteItem>> getAllItems();

  @Query('DELETE FROM times')
  Future<void> clearTable();
}