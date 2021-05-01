import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerDialog extends StatelessWidget {
  final String videoID;

  YoutubePlayerDialog({this.videoID});

  @override
  Widget build(BuildContext context) {
    var _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );

    return AlertDialog(
        insetPadding: EdgeInsets.all(10),
        backgroundColor: Colors.black,
        content: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            logPrint("build - Player is ready.");
          },
        ),
        contentPadding: EdgeInsets.all(0),
        actions: <Widget>[
          TextButton(
            child: new Text(StrRes.backButtonText),
            onPressed: () {
              Get.back();
            },
          )
        ]);
  }
}
