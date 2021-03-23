import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/youtube_player/controller/youtube_controller.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:intl/intl.dart';

class YouTubeView extends StatelessWidget {
  final String _id = Get.arguments["id"];
  final String _time = Get.arguments["time"];
  final String _alg = Get.arguments["alg"];

  @override
  Widget build(BuildContext context) {
    print("arg = $_id, $_time, $_alg");
    YoutubePlayerController _youTubeController = YoutubePlayerController(
      initialVideoId: _id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        startAt: _tryParseTime(_time),
        mute: false,
        hideThumbnail: true,
        controlsVisibleAtStart: false,
        enableCaption: true,

      ),
    );
    var _playerState = PlayerState.unknown;
    MyYouTubeController _controller = Get.find();
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_alg,
                          style: Get.textTheme.headline5.copyWith(color: Get.theme.accentColor),
                        ),
                      ),
                    ),
                    YoutubePlayer(
                      controller: _youTubeController,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(isExpanded: true),
                        PlaybackSpeedButton()
                      ],
                      onReady: () {
                        //print("Player Ready");
                        _youTubeController.addListener(() {
                          if (_youTubeController.value.playerState != _playerState) {
                            _playerState = _youTubeController.value.playerState;
                            if ((_playerState == PlayerState.playing) || (_playerState == PlayerState.cued)) {
                              _youTubeController.setPlaybackRate(_controller.playbackRate);
                              if (_controller.playbackRate < 0.75) {
                                _youTubeController.mute();
                              } else {
                                _youTubeController.unMute();
                              }
                            }
                            _controller.setPlayerState(_playerState.index);
                          }
                          //print("${_youTubeController.value.position.inSeconds}");
                        });
                      },
                    ),
                  ],
                ),
              ),
            )),
            Material(
              child: Obx(
                () => Slider(
                  value: _controller.playbackRate,
                  activeColor: Get.theme.primaryColor,
                  min: 0.25,
                  max: 1.75,
                  divisions: 6,
                  label: _controller.playbackRate.toString(),
                  onChanged: (value) {
                    _youTubeController.setPlaybackRate(value);
                    _controller.playbackRate = value;
                    if (value < 0.75) {
                      _youTubeController.mute();
                    } else {
                      _youTubeController.unMute();
                    }
                  }
                ),
              ),
            ),
            playerNavigation(_youTubeController, _controller),
          ],
        ),
      ),
    );
  }

  Center playerNavigation(YoutubePlayerController _youTubeController, MyYouTubeController _controller) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          SizedBox(width: 4,),
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.skip_previous_rounded),
              onPressed: () {
                _youTubeController.seekTo(Duration(seconds: _tryParseTime(_time)));
              },
            ),
          ),
          SizedBox(width: 4,),
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.fast_rewind_rounded),
              onPressed: () {
                var backTo = _youTubeController.value.position.inSeconds - 10;
                _youTubeController.seekTo(Duration(seconds: backTo));
              },
            ),
          ),
          SizedBox(width: 4,),
          Obx(
            () => Flexible(
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: (_controller.getPlayerState() == 4) ? Icon(Icons.play_arrow_rounded) : Icon(Icons.pause_rounded),
                onPressed: () {
                  if (_controller.getPlayerState() == PlayerState.paused.index) {
                    _youTubeController.play();
                  } else {
                    _youTubeController.pause();
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 4,),
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.fast_forward_rounded),
              onPressed: () {
                var forwardTo = _youTubeController.value.position.inSeconds + 10;
                _youTubeController.seekTo(Duration(seconds: forwardTo));
              },
            ),
          ),
        ],
      ),
    );
  }

  //преобразовываем строку вида 1:34 в секунды (94)
  int _tryParseTime(String stTime) {
    DateTime dt;
    var format = DateFormat('m:s');
    try {
      dt = format.parse(stTime);
    } catch (e) {
      //если ошибка преобразования времени, то считаем, что начинаем видео с начала
      print("Ошибка при преобразовании даты $stTime. Ошибка $e");
      return 0;
    }
    var seconds = dt.second;
    var minutes = dt.minute;
    return (minutes * 60 + seconds);
  }
}
