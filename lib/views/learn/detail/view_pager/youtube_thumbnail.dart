import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/view_pager/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeThumbnail extends StatelessWidget {
  final String videoID;
  const YoutubeThumbnail({this.videoID});

  @override
  Widget build(BuildContext context) {
    return ytPlayer(videoID);
  }

  //TODO убрать контекст, вызывать через Get.dialog
  Widget ytPlayer(videoID) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _showDialog(videoID);
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (kIsWeb && constraints.maxWidth > 800) {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            YoutubePlayer.getThumbnail(
                                videoId: videoID,
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            YoutubePlayer.getThumbnail(
                                videoId: videoID,
                                quality: ThumbnailQuality.max,
                                webp: false),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Icon(
              Icons.play_circle_fill_rounded,
              color: Colors.black87,
              size: 55.0,
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(videoID) {
    Get.dialog(YoutubePlayerDialog(videoID: videoID));
  }

}
