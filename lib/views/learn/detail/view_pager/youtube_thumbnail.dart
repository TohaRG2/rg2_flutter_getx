import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/view_pager/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeThumbnail extends StatelessWidget {
  final String videoID;

  const YoutubeThumbnail({Key? key, required this.videoID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ytPlayer(videoID);
  }

  //TODO убрать контекст, вызывать через Get.dialog
  Widget ytPlayer(String videoID) {
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
                        padding: const EdgeInsets.all(5),
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
                        padding: const EdgeInsets.all(5),
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
            const Icon(
              Icons.play_circle_fill_rounded,
              color: Colors.black87,
              size: 55.0,
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(String videoID) {
    if (Get.isDialogOpen == true) return; // Защита от дублирования
    Get.dialog(
      YoutubePlayerDialog(videoID: videoID),
      barrierDismissible: true, // можно закрыть по тапу вне диалога
    );
  }
}
