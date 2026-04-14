import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rg2/controllers/init_phases.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/database/main_database.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/controllers/database_initializer.dart';

class DBController extends GetxController {
  final _sp = GetStorage();
  bool needInit = false;
  late MainDatabase _mainBase;

  Callback callback() => Callback(onCreate: (database, version) async {
        logPrint("CreateDataBase callback called");
        needInit = true;
      }, onOpen: (database) {
        logPrint("OpenDatabase callback called");
      });

  /// Создаем базу данных, при необходимости заполняем содержимым
  Future<MainDatabase> fillDB() async {
    _mainBase = await $FloorMainDatabase
        .databaseBuilder('main.db')
        .addCallback(callback())
        .build();

    if (needInit) {
      await DatabaseInitializer(_mainBase).fullInit();
      needInit = false;
    } else {
      logPrint("Не первый запуск, инициализация не нужна, но проверяем версию");
    }

    await _checkBaseResourcesVersion();

    return _mainBase;
  }

  /// Сохраненный локально номер версии приложения. Если его еще не сохраняли (нет в сторадже), то 0
  String? get buildNumber => _sp.read(Const.BUILD_NUMBER);
  set buildNumber(String? value) {
    _sp.write(Const.BUILD_NUMBER, value);
  }

  String? get version => _sp.read(Const.VERSION);
  set version(String? value) {
    _sp.write(Const.VERSION, value);
  }

  Future<void> _checkBaseResourcesVersion() async {
    final build = buildNumber;
    final _version = version;
    logPrint(
        "checkBaseResourcesVersion - проверка версии ресурсов в базе, была версия: $_version - $build");

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String curVersion = packageInfo.version;
    String curBuild = packageInfo.buildNumber;

    logPrint(
        "checkBaseResourcesVersion - текущая версия $curVersion - $curBuild");

    if (_version != null && _version != curVersion) {
      await _updateMainBaseFromLocal();
      _updateResourcesVersion(curVersion, curBuild);
    } else if (_version == null) {
      _updateResourcesVersion(curVersion, curBuild);
    }
  }

  void _updateResourcesVersion(String curVersion, String curBuild) {
    version = curVersion;
    buildNumber = curBuild;
  }

  /// Прокси для инициализации комментариев (нужно для MainRepository)
  Future<List<MainDBItem>> initComments() async {
    return await DatabaseInitializer(_mainBase).initComments();
  }

  Future<bool> _updateMainBaseFromLocal() async {
    logPrint("updateMainBaseFunction - start");
    for (var phase in phasesToInit) {
      logPrint("updateMainBaseFromLocal - ${phase.phase}");
      List<MainDBItem> itemsFromBase =
          await _mainBase.mainDao.getPhase(phase.phase);
      List<MainDBItem> itemsForUpdate = [];
      for (var i = 0; i < phase.count; i++) {
        final matches = itemsFromBase.where((mainDBItem) => mainDBItem.id == i);
        var itemFromBase = matches.isNotEmpty ? matches.first : null;

        itemsForUpdate.add(MainDBItem(
            phase: phase.phase,
            id: i,
            title: phase.titles()[i],
            icon: phase.icons()[i],
            description: phase.descriptions()[i],
            url: phase.urls()[i],
            comment: itemFromBase?.comment ?? "",
            isFavourite: itemFromBase?.isFavourite ?? false,
            favComment: itemFromBase?.favComment ?? "",
            subId: itemFromBase?.subId ?? 0));
      }
      await _mainBase.mainDao.updateItems(itemsForUpdate);
    }

    logPrint("updateMainBaseFunction - end");
    return true;
  }
}
