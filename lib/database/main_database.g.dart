// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorMainDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MainDatabaseBuilder databaseBuilder(String name) =>
      _$MainDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MainDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MainDatabaseBuilder(null);
}

class _$MainDatabaseBuilder {
  _$MainDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$MainDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MainDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MainDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$MainDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MainDatabase extends MainDatabase {
  _$MainDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MainDao _mainDaoInstance;

  PagePropertiesDao _pagePropertiesDaoInstance;

  MovesDao _movesDaoInstance;

  PhasePositionDao _phasePositionDaoInstance;

  TimesDao _timesDaoInstance;

  PllTrainerDao _pllTrainerDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `main` (`id` INTEGER, `phase` TEXT, `title` TEXT, `icon` TEXT, `description` TEXT, `url` TEXT, `comment` TEXT, `isFavourite` INTEGER, `favComment` TEXT, `subId` INTEGER, PRIMARY KEY (`id`, `phase`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PageProperties` (`number` INTEGER, `title` TEXT, `rootPhase` TEXT, `currentPhase` TEXT, `backTo` TEXT, PRIMARY KEY (`number`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `basic_moves` (`id` INTEGER, `eType` TEXT, `move` TEXT, `icon` TEXT, `toast` TEXT, PRIMARY KEY (`id`, `eType`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `phasePositions` (`phase` TEXT, `position` REAL, PRIMARY KEY (`phase`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `times` (`uuid` INTEGER PRIMARY KEY AUTOINCREMENT, `solvingTime` TEXT, `dateTime` INTEGER, `scramble` TEXT, `comment` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pll_trainer` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `internationalName` TEXT, `maximName` TEXT, `customName` TEXT, `currentName` TEXT, `imagePath` TEXT, `isChecked` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MainDao get mainDao {
    return _mainDaoInstance ??= _$MainDao(database, changeListener);
  }

  @override
  PagePropertiesDao get pagePropertiesDao {
    return _pagePropertiesDaoInstance ??=
        _$PagePropertiesDao(database, changeListener);
  }

  @override
  MovesDao get movesDao {
    return _movesDaoInstance ??= _$MovesDao(database, changeListener);
  }

  @override
  PhasePositionDao get phasePositionDao {
    return _phasePositionDaoInstance ??=
        _$PhasePositionDao(database, changeListener);
  }

  @override
  TimesDao get timesDao {
    return _timesDaoInstance ??= _$TimesDao(database, changeListener);
  }

  @override
  PllTrainerDao get pllTrainerDao {
    return _pllTrainerDaoInstance ??= _$PllTrainerDao(database, changeListener);
  }
}

class _$MainDao extends MainDao {
  _$MainDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _mainDBItemInsertionAdapter = InsertionAdapter(
            database,
            'main',
            (MainDBItem item) => <String, dynamic>{
                  'id': item.id,
                  'phase': item.phase,
                  'title': item.title,
                  'icon': item.icon,
                  'description': item.description,
                  'url': item.url,
                  'comment': item.comment,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0),
                  'favComment': item.favComment,
                  'subId': item.subId
                }),
        _mainDBItemUpdateAdapter = UpdateAdapter(
            database,
            'main',
            ['id', 'phase'],
            (MainDBItem item) => <String, dynamic>{
                  'id': item.id,
                  'phase': item.phase,
                  'title': item.title,
                  'icon': item.icon,
                  'description': item.description,
                  'url': item.url,
                  'comment': item.comment,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0),
                  'favComment': item.favComment,
                  'subId': item.subId
                }),
        _mainDBItemDeletionAdapter = DeletionAdapter(
            database,
            'main',
            ['id', 'phase'],
            (MainDBItem item) => <String, dynamic>{
                  'id': item.id,
                  'phase': item.phase,
                  'title': item.title,
                  'icon': item.icon,
                  'description': item.description,
                  'url': item.url,
                  'comment': item.comment,
                  'isFavourite': item.isFavourite == null
                      ? null
                      : (item.isFavourite ? 1 : 0),
                  'favComment': item.favComment,
                  'subId': item.subId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MainDBItem> _mainDBItemInsertionAdapter;

  final UpdateAdapter<MainDBItem> _mainDBItemUpdateAdapter;

  final DeletionAdapter<MainDBItem> _mainDBItemDeletionAdapter;

  @override
  Future<List<MainDBItem>> getAllItems() async {
    return _queryAdapter.queryList('select * from main',
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<List<MainDBItem>> getPhase(String phase) async {
    return _queryAdapter.queryList(
        'SELECT * FROM main WHERE phase = ? ORDER BY id',
        arguments: <dynamic>[phase],
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<List<MainDBItem>> getPhasePages(String phase, String submenu) async {
    return _queryAdapter.queryList(
        'SELECT * FROM main WHERE phase = ? and url <> ? ORDER BY ID',
        arguments: <dynamic>[phase, submenu],
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<List<MainDBItem>> getSubMenuList(String submenu) async {
    return _queryAdapter.queryList(
        'SELECT distinct * FROM main WHERE url = ? ORDER BY ID',
        arguments: <dynamic>[submenu],
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<List<MainDBItem>> getFavourites() async {
    return _queryAdapter.queryList(
        'SELECT * FROM main WHERE isFavourite = 1 ORDER BY subId',
        mapper: (Map<String, dynamic> row) => MainDBItem(
            id: row['id'] as int,
            phase: row['phase'] as String,
            title: row['title'] as String,
            icon: row['icon'] as String,
            description: row['description'] as String,
            url: row['url'] as String,
            comment: row['comment'] as String,
            isFavourite: row['isFavourite'] == null
                ? null
                : (row['isFavourite'] as int) != 0,
            favComment: row['favComment'] as String,
            subId: row['subId'] as int));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM main');
  }

  @override
  Future<int> insertItem(MainDBItem item) {
    return _mainDBItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertItems(List<MainDBItem> items) {
    return _mainDBItemInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertOrReplace(MainDBItem item) {
    return _mainDBItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(MainDBItem item) {
    return _mainDBItemUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<MainDBItem> items) {
    return _mainDBItemUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(MainDBItem item) {
    return _mainDBItemDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<MainDBItem> items) {
    return _mainDBItemDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}

class _$PagePropertiesDao extends PagePropertiesDao {
  _$PagePropertiesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _pagePropertiesInsertionAdapter = InsertionAdapter(
            database,
            'PageProperties',
            (PageProperties item) => <String, dynamic>{
                  'number': item.number,
                  'title': item.title,
                  'rootPhase': item.rootPhase,
                  'currentPhase': item.currentPhase,
                  'backTo': item.backTo
                }),
        _pagePropertiesUpdateAdapter = UpdateAdapter(
            database,
            'PageProperties',
            ['number'],
            (PageProperties item) => <String, dynamic>{
                  'number': item.number,
                  'title': item.title,
                  'rootPhase': item.rootPhase,
                  'currentPhase': item.currentPhase,
                  'backTo': item.backTo
                }),
        _pagePropertiesDeletionAdapter = DeletionAdapter(
            database,
            'PageProperties',
            ['number'],
            (PageProperties item) => <String, dynamic>{
                  'number': item.number,
                  'title': item.title,
                  'rootPhase': item.rootPhase,
                  'currentPhase': item.currentPhase,
                  'backTo': item.backTo
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PageProperties> _pagePropertiesInsertionAdapter;

  final UpdateAdapter<PageProperties> _pagePropertiesUpdateAdapter;

  final DeletionAdapter<PageProperties> _pagePropertiesDeletionAdapter;

  @override
  Future<List<PageProperties>> getAllItems() async {
    return _queryAdapter.queryList('select * from pageProperties',
        mapper: (Map<String, dynamic> row) => PageProperties(
            row['number'] as int,
            row['title'] as String,
            row['rootPhase'] as String,
            row['currentPhase'] as String,
            backTo: row['backTo'] as String));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM pageProperties');
  }

  @override
  Future<int> insertItem(PageProperties item) {
    return _pagePropertiesInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertItems(List<PageProperties> items) {
    return _pagePropertiesInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertOrReplace(PageProperties item) {
    return _pagePropertiesInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(PageProperties item) {
    return _pagePropertiesUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<PageProperties> items) {
    return _pagePropertiesUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(PageProperties item) {
    return _pagePropertiesDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<PageProperties> items) {
    return _pagePropertiesDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}

class _$MovesDao extends MovesDao {
  _$MovesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _basicMoveInsertionAdapter = InsertionAdapter(
            database,
            'basic_moves',
            (BasicMove item) => <String, dynamic>{
                  'id': item.id,
                  'eType': item.eType,
                  'move': item.move,
                  'icon': item.icon,
                  'toast': item.toast
                }),
        _basicMoveUpdateAdapter = UpdateAdapter(
            database,
            'basic_moves',
            ['id', 'eType'],
            (BasicMove item) => <String, dynamic>{
                  'id': item.id,
                  'eType': item.eType,
                  'move': item.move,
                  'icon': item.icon,
                  'toast': item.toast
                }),
        _basicMoveDeletionAdapter = DeletionAdapter(
            database,
            'basic_moves',
            ['id', 'eType'],
            (BasicMove item) => <String, dynamic>{
                  'id': item.id,
                  'eType': item.eType,
                  'move': item.move,
                  'icon': item.icon,
                  'toast': item.toast
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BasicMove> _basicMoveInsertionAdapter;

  final UpdateAdapter<BasicMove> _basicMoveUpdateAdapter;

  final DeletionAdapter<BasicMove> _basicMoveDeletionAdapter;

  @override
  Future<List<BasicMove>> getAllItems() async {
    return _queryAdapter.queryList('select * from basic_moves',
        mapper: (Map<String, dynamic> row) => BasicMove(
            id: row['id'] as int,
            eType: row['eType'] as String,
            move: row['move'] as String,
            icon: row['icon'] as String,
            toast: row['toast'] as String));
  }

  @override
  Future<List<BasicMove>> getTypeItems(String eType) async {
    return _queryAdapter.queryList(
        'SELECT * FROM basic_moves WHERE eType = ? ORDER BY id',
        arguments: <dynamic>[eType],
        mapper: (Map<String, dynamic> row) => BasicMove(
            id: row['id'] as int,
            eType: row['eType'] as String,
            move: row['move'] as String,
            icon: row['icon'] as String,
            toast: row['toast'] as String));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM basic_moves');
  }

  @override
  Future<int> insertItem(BasicMove item) {
    return _basicMoveInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertItems(List<BasicMove> items) {
    return _basicMoveInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertOrReplace(BasicMove item) {
    return _basicMoveInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(BasicMove item) {
    return _basicMoveUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<BasicMove> items) {
    return _basicMoveUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(BasicMove item) {
    return _basicMoveDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<BasicMove> items) {
    return _basicMoveDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}

class _$PhasePositionDao extends PhasePositionDao {
  _$PhasePositionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _phasePositionItemInsertionAdapter = InsertionAdapter(
            database,
            'phasePositions',
            (PhasePositionItem item) => <String, dynamic>{
                  'phase': item.phase,
                  'position': item.position
                }),
        _phasePositionItemUpdateAdapter = UpdateAdapter(
            database,
            'phasePositions',
            ['phase'],
            (PhasePositionItem item) => <String, dynamic>{
                  'phase': item.phase,
                  'position': item.position
                }),
        _phasePositionItemDeletionAdapter = DeletionAdapter(
            database,
            'phasePositions',
            ['phase'],
            (PhasePositionItem item) => <String, dynamic>{
                  'phase': item.phase,
                  'position': item.position
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PhasePositionItem> _phasePositionItemInsertionAdapter;

  final UpdateAdapter<PhasePositionItem> _phasePositionItemUpdateAdapter;

  final DeletionAdapter<PhasePositionItem> _phasePositionItemDeletionAdapter;

  @override
  Future<List<PhasePositionItem>> getAllItems() async {
    return _queryAdapter.queryList('select * from phasePositions',
        mapper: (Map<String, dynamic> row) => PhasePositionItem(
            row['phase'] as String, row['position'] as double));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM phasePositions');
  }

  @override
  Future<int> insertItem(PhasePositionItem item) {
    return _phasePositionItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertItems(List<PhasePositionItem> items) {
    return _phasePositionItemInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertOrReplace(PhasePositionItem item) {
    return _phasePositionItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(PhasePositionItem item) {
    return _phasePositionItemUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<PhasePositionItem> items) {
    return _phasePositionItemUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(PhasePositionItem item) {
    return _phasePositionItemDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<PhasePositionItem> items) {
    return _phasePositionItemDeletionAdapter
        .deleteListAndReturnChangedRows(items);
  }
}

class _$TimesDao extends TimesDao {
  _$TimesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _timeNoteItemInsertionAdapter = InsertionAdapter(
            database,
            'times',
            (TimeNoteItem item) => <String, dynamic>{
                  'uuid': item.uuid,
                  'solvingTime': item.solvingTime,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'scramble': item.scramble,
                  'comment': item.comment
                }),
        _timeNoteItemUpdateAdapter = UpdateAdapter(
            database,
            'times',
            ['uuid'],
            (TimeNoteItem item) => <String, dynamic>{
                  'uuid': item.uuid,
                  'solvingTime': item.solvingTime,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'scramble': item.scramble,
                  'comment': item.comment
                }),
        _timeNoteItemDeletionAdapter = DeletionAdapter(
            database,
            'times',
            ['uuid'],
            (TimeNoteItem item) => <String, dynamic>{
                  'uuid': item.uuid,
                  'solvingTime': item.solvingTime,
                  'dateTime': _dateTimeConverter.encode(item.dateTime),
                  'scramble': item.scramble,
                  'comment': item.comment
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TimeNoteItem> _timeNoteItemInsertionAdapter;

  final UpdateAdapter<TimeNoteItem> _timeNoteItemUpdateAdapter;

  final DeletionAdapter<TimeNoteItem> _timeNoteItemDeletionAdapter;

  @override
  Future<List<TimeNoteItem>> getAllItems() async {
    return _queryAdapter.queryList('select * from times',
        mapper: (Map<String, dynamic> row) => TimeNoteItem(
            row['solvingTime'] as String,
            _dateTimeConverter.decode(row['dateTime'] as int),
            row['scramble'] as String,
            row['comment'] as String,
            uuid: row['uuid'] as int));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM times');
  }

  @override
  Future<int> insertItem(TimeNoteItem item) {
    return _timeNoteItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertItems(List<TimeNoteItem> items) {
    return _timeNoteItemInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertOrReplace(TimeNoteItem item) {
    return _timeNoteItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(TimeNoteItem item) {
    return _timeNoteItemUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<TimeNoteItem> items) {
    return _timeNoteItemUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(TimeNoteItem item) {
    return _timeNoteItemDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<TimeNoteItem> items) {
    return _timeNoteItemDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}

class _$PllTrainerDao extends PllTrainerDao {
  _$PllTrainerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _pllTrainerItemInsertionAdapter = InsertionAdapter(
            database,
            'pll_trainer',
            (PllTrainerItem item) => <String, dynamic>{
                  'id': item.id,
                  'internationalName': item.internationalName,
                  'maximName': item.maximName,
                  'customName': item.customName,
                  'currentName': item.currentName,
                  'imagePath': item.imagePath,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                }),
        _pllTrainerItemUpdateAdapter = UpdateAdapter(
            database,
            'pll_trainer',
            ['id'],
            (PllTrainerItem item) => <String, dynamic>{
                  'id': item.id,
                  'internationalName': item.internationalName,
                  'maximName': item.maximName,
                  'customName': item.customName,
                  'currentName': item.currentName,
                  'imagePath': item.imagePath,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                }),
        _pllTrainerItemDeletionAdapter = DeletionAdapter(
            database,
            'pll_trainer',
            ['id'],
            (PllTrainerItem item) => <String, dynamic>{
                  'id': item.id,
                  'internationalName': item.internationalName,
                  'maximName': item.maximName,
                  'customName': item.customName,
                  'currentName': item.currentName,
                  'imagePath': item.imagePath,
                  'isChecked':
                      item.isChecked == null ? null : (item.isChecked ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PllTrainerItem> _pllTrainerItemInsertionAdapter;

  final UpdateAdapter<PllTrainerItem> _pllTrainerItemUpdateAdapter;

  final DeletionAdapter<PllTrainerItem> _pllTrainerItemDeletionAdapter;

  @override
  Future<List<PllTrainerItem>> getAllItems() async {
    return _queryAdapter.queryList('SELECT * FROM PLL_TRAINER',
        mapper: (Map<String, dynamic> row) => PllTrainerItem(
            row['internationalName'] as String,
            row['maximName'] as String,
            row['customName'] as String,
            row['currentName'] as String,
            row['imagePath'] as String,
            row['isChecked'] == null ? null : (row['isChecked'] as int) != 0,
            id: row['id'] as int));
  }

  @override
  Future<void> clearTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PLL_TRAINER');
  }

  @override
  Future<int> insertItem(PllTrainerItem item) {
    return _pllTrainerItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertItems(List<PllTrainerItem> items) {
    return _pllTrainerItemInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertOrReplace(PllTrainerItem item) {
    return _pllTrainerItemInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateItem(PllTrainerItem item) {
    return _pllTrainerItemUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItems(List<PllTrainerItem> items) {
    return _pllTrainerItemUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(PllTrainerItem item) {
    return _pllTrainerItemDeletionAdapter.deleteAndReturnChangedRows(item);
  }

  @override
  Future<int> deleteItems(List<PllTrainerItem> items) {
    return _pllTrainerItemDeletionAdapter.deleteListAndReturnChangedRows(items);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
