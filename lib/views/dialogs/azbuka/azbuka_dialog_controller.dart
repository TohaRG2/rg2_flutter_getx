import 'package:get/get.dart';
import 'package:rg2/controllers/repository/repository.dart';
import 'package:rg2/database/entitys/basic_move.dart';
import 'package:rg2/res/azbuka/phase_types.dart';
import 'package:rg2/utils/my_logger.dart';

class AzbukaDialogController extends GetxController {
  Repository _repo = Get.find();
  String _currentType = "";

  RxList<BasicMove> _movesItems = <BasicMove>[].obs;
  get movesItems => _movesItems.toList();

  Future<void> loadMoves(String phase) async {
    var phaseType = phaseTypes[phase] ?? "BASIC_3X3";
    logPrint("loadMoves - $_currentType .... $phaseType");
    if (_currentType != phaseType) {
      _currentType = phaseType;
      var list = await _repo.getAzbukaForType(phaseType);
      _movesItems.assignAll(list);
    }

  }

  String getAssetAzbukaFilePathPng(String iconName, String eType) {
    return _getAssetAzbukaFilePath(iconName, eType, "png");
  }
  
  String getAssetAzbukaFilePathSvg(String iconName, String eType) {
    return _getAssetAzbukaFilePath(iconName, eType, "svg");
  }
  
  String _getAssetAzbukaFilePath(String iconName, String eType, String extension) {
    String path;
    iconName = iconName.replaceAll(".xml", "");
    if (iconName.endsWith(".svg") || iconName.endsWith(".png")) {      //Если есть расширение, то считаем, что путь указан полностью
      path = iconName;
    } else {
      var subDir = eType.toLowerCase();
      path = "assets/images/azbuka/$subDir/$iconName.$extension";
    }
    return path;
  }

}