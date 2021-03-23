import 'package:get/get.dart';

class MyYouTubeController extends GetxController {

  final _playerState = 0.obs;

  setPlayerState(int value) {
    _playerState.value = value;
  }

  int getPlayerState() => _playerState.value;

  final _playbackRate = (1.0).obs;
  double get playbackRate => _playbackRate.value;
  set playbackRate(double value) {
    var rounded = (value * 100).round() / 100;
    _playbackRate.value = rounded;
  }

}