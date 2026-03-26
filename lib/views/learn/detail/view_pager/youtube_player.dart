import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Вызываем этот диалог, когда нажимаем на превью видео
class YoutubePlayerDialog extends StatelessWidget {
  final String videoID;

  YoutubePlayerDialog({required this.videoID});

  @override
  Widget build(BuildContext context) {
    // Флаг готовности плеера
    final isReady = false.obs;

    // Контроллер плеера
    var controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        enableCaption: false, // Отключаем субтитры
      ),
    );

    // Диалог с плеером
    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.black,
      content: Stack(
        alignment: Alignment.center,
        children: [
          // Плеер
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
            ],
            onReady: () {
              logPrint("build - Player is ready.");
              isReady.value = true;
            },
          ),
          // Заглушка до загрузки видео
          Obx(() => !isReady.value
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Загрузка видео с Youtube',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
      contentPadding: EdgeInsets.all(0),
      // Кнопка закрытия диалога
      actions: <Widget>[
        TextButton(
          child: Text(StrRes.backButtonText),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }
}
