import 'package:get/get.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/utils/my_logger.dart';

class MyYouTubeController extends GetxController {
  final GlobalStorageController _storage = Get.find();
  final _playerState = 0.obs;

  @override
  onInit() {
    super.onInit();
    logPrint("onInit - MyYouTubeController");
    _playbackRate.value = _storage.getPropertyByKey(Const.YOU_TUBE_PLAYER_SPEED);
  }

  setPlayerState(int value) {
    _playerState.value = value;
  }

  int getPlayerState() => _playerState.value;

  RxDouble _playbackRate = RxDouble(1.0);
  double get playbackRate => _playbackRate.value;
  set playbackRate(double value) {
    var rounded = (value * 100).round() / 100;
    _playbackRate.value = rounded;
    var property = Property(key: Const.YOU_TUBE_PLAYER_SPEED, value: rounded);
    _storage.setProperty(property);
  }

}