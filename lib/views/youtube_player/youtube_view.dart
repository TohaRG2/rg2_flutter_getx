import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/youtube_controller.dart';
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_alg,
                          style: Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).accentColor),),
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
            Row(
              children: [
                Flexible(
                  child: RaisedButton(
                    child: Text("0.25x"),
                    onPressed: () {
                      _youTubeController.setPlaybackRate(0.25);
                      _youTubeController.mute();
                    },
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Text("0.5x"),
                    onPressed: () {
                      _youTubeController.setPlaybackRate(0.5);
                      _youTubeController.mute();
                    },
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Text("0.75x"),
                    onPressed: () {
                      _youTubeController.setPlaybackRate(0.75);
                      _youTubeController.unMute();
                    },
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Text("1x"),
                    onPressed: () {
                      _youTubeController.setPlaybackRate(1.0);
                      _youTubeController.unMute();
                    },
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Text("1.5x"),
                    onPressed: () {
                      _youTubeController.setPlaybackRate(1.5);
                      _youTubeController.unMute();
                    },
                  ),
                ),

              ],
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
              children: [
                Flexible(
                  child: RaisedButton(
                    child: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Icon(Icons.skip_previous_rounded),
                    onPressed: () {
                      _youTubeController
                          .seekTo(Duration(seconds: _tryParseTime(_time)));
                    },
                  ),
                ),
                Flexible(
                  child: RaisedButton(
                    child: Icon(Icons.fast_rewind_rounded),
                    onPressed: () {
                      var backTo =
                          _youTubeController.value.position.inSeconds - 10;
                      _youTubeController.seekTo(Duration(seconds: backTo));
                    },
                  ),
                ),
                 Obx(
                    () => Flexible(
                      child: RaisedButton(
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
                Flexible(
                  child: RaisedButton(
                    child: Icon(Icons.fast_forward_rounded),
                    onPressed: () {
                      var forwardTo =
                          _youTubeController.value.position.inSeconds + 10;
                      _youTubeController.seekTo(Duration(seconds: forwardTo));
                    },
                  ),
                ),
              ],
            ),
          );
  }

  //преобразовываем строку вида 1:34 в секунды
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
