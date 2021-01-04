import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyYouTubeController extends GetxController {

  final _playerState = 0.obs;

  setPlayerState(int value) {
    _playerState.value = value;
  }

  int getPlayerState() => _playerState.value;

  final _playbackRate = (1.0).obs;

  setPlaybackRate(double value) {
    _playbackRate.value = value;
  }

  double getPlaybackRate() => _playbackRate.value;


}