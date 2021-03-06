
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:rg2/database/converters/date_time_converter.dart';
import 'package:rg2/database/daos/moves_dao.dart';
import 'package:rg2/database/daos/page_prop_dao.dart';
import 'package:rg2/database/daos/phase_position_dao.dart';
import 'package:rg2/database/daos/pll_trainer_dao.dart';
import 'package:rg2/database/daos/times_dao.dart';
import 'package:rg2/database/entitys/page_properties.dart';
import 'package:rg2/database/entitys/phase_position_item.dart';
import 'package:rg2/database/entitys/pll_trainer_item.dart';
import 'package:rg2/database/entitys/time_note_item.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/main_dao.dart';
import 'entitys/basic_move.dart';
import 'entitys/main_db_item.dart';

part 'main_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [MainDBItem, PageProperties, BasicMove, PhasePositionItem, TimeNoteItem, PllTrainerItem])
abstract class MainDatabase extends FloorDatabase{
  MainDao get mainDao;
  PagePropertiesDao get pagePropertiesDao;
  MovesDao get movesDao;
  PhasePositionDao get phasePositionDao;
  TimesDao get timesDao;
  PllTrainerDao get pllTrainerDao;
}