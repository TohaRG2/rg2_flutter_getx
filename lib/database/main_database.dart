
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:rg2_flutter_getx/database/converters/date_time_converter.dart';
import 'package:rg2_flutter_getx/database/daos/moves_dao.dart';
import 'package:rg2_flutter_getx/database/daos/page_prop_dao.dart';
import 'package:rg2_flutter_getx/database/daos/phase_position_dao.dart';
import 'package:rg2_flutter_getx/database/daos/times.dao.dart';
import 'package:rg2_flutter_getx/database/entitys/page_properties.dart';
import 'package:rg2_flutter_getx/database/entitys/phase_position_item.dart';
import 'package:rg2_flutter_getx/database/entitys/time_note_item.dart';
import 'package:rg2_flutter_getx/views/trainers/scramble_gen/model/moves.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/main_dao.dart';
import 'entitys/basic_move.dart';
import 'entitys/main_db_item.dart';

part 'main_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [MainDBItem, PageProperties, BasicMove, PhasePositionItem, TimeNoteItem])
abstract class MainDatabase extends FloorDatabase{
  MainDao get mainDao;
  PagePropertiesDao get pagePropertiesDao;
  MovesDao get movesDao;
  PhasePositionDao get phasePositionDao;
  TimesDao get timesDao;
}