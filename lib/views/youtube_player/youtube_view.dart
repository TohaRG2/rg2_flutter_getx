import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/shared/ui_helpers.dart';
import 'package:rg2/views/youtube_player/controller/youtube_controller.dart';
import 'package:rg2/views/shared/buttons_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rg2/utils/theme_compat.dart';

// GetView + Get.put = один и тот же контроллер
// GetView + Get.create = разные контроллеры
// GetWidget + Get.create = один и тот же контроллер

class YouTubeView extends GetView<MyYouTubeController> {
  // Аргументы навигации
  final String _id = Get.arguments["id"];
  final String _time = Get.arguments["time"];
  final String _alg = Get.arguments["alg"];

  @override
  Widget build(BuildContext context) {
    logPrint("arg = $_id, $_time, $_alg");

    // т.к. в других местах контроллер не нужен, то инициализируем его только на время работы плеера
    Get.put(MyYouTubeController());

    // Контроллер YouTube-плеера
    YoutubePlayerController youTubeController = YoutubePlayerController(
      initialVideoId: _id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        startAt: _tryParseTime(_time),
        mute: false,
        hideThumbnail: true,
        controlsVisibleAtStart: false,
        enableCaption: false, // Отключаем субтитры
      ),
    );

    // Текущее состояние плеера (для отслеживания изменений)
    var _playerState = PlayerState.unknown;
    // Флаг готовности плеера
    final isReady = false.obs;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // Область плеера
              Expanded(
                  child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Заголовок (название алгоритма)
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _alg,
                            style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.secondary),
                          ),
                        ),
                      ),
                      // Плеер с заглушкой загрузки
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // YouTube-плеер
                          YoutubePlayer(
                            controller: youTubeController,
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(isExpanded: true),
                              // PlaybackSpeedButton()
                            ],
                            onReady: () {
                              isReady.value = true;
                              //logPrint("Player Ready");
                              // Слушатель изменений состояния плеера
                              youTubeController.addListener(() {
                                if (youTubeController.value.playerState !=
                                    _playerState) {
                                  _playerState =
                                      youTubeController.value.playerState;
                                  if ((_playerState == PlayerState.playing) ||
                                      (_playerState == PlayerState.cued)) {
                                    // Применяем скорость воспроизведения из контроллера
                                    youTubeController
                                        .setPlaybackRate(controller.playbackRate);
                                    // Глушим звук при скорости < 0.75
                                    if (controller.playbackRate < 0.75) {
                                      youTubeController.mute();
                                    } else {
                                      youTubeController.unMute();
                                    }
                                  }
                                  controller.setPlayerState(_playerState.index);
                                }
                                //logPrint("${_youTubeController.value.position.inSeconds}");
                              });
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
                    ],
                  ),
                ),
              )),
              // Подписи делений скорости
              Container(
                margin: EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0.25'),
                    Text('0.5'),
                    Text('0.75'),
                    Text('1'),
                    Text('1.25'),
                    Text('1.5'),
                    Text('1.75'),
                  ],
                ),
              ),
              // Слайдер скорости воспроизведения
              Obx(
                () => Slider(
                    value: controller.playbackRate,
                    activeColor: Get.theme.primaryColor,
                    min: 0.25,
                    max: 1.75,
                    divisions: 6,
                    label: controller.playbackRate.toString(),
                    onChanged: (value) {
                      youTubeController.setPlaybackRate(value);
                      controller.playbackRate = value;
                      if (value < 0.75) {
                        youTubeController.mute();
                      } else {
                        youTubeController.unMute();
                      }
                    }),
              ),
              // Кнопки управления воспроизведением
              playerNavigation(youTubeController),
            ],
          ),
        ),
      ),
    );
  }

  Center playerNavigation(YoutubePlayerController youTubeController) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Назад (закрыть экран)
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          SizedBox(width: 4),
          // В начало (к стартовому времени)
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.skip_previous_rounded),
              onPressed: () {
                youTubeController
                    .seekTo(Duration(seconds: _tryParseTime(_time)));
              },
            ),
          ),
          SizedBox(width: 4),
          // Перемотка назад на 10 сек
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.fast_rewind_rounded),
              onPressed: () {
                var backTo = youTubeController.value.position.inSeconds - 10;
                youTubeController.seekTo(Duration(seconds: backTo));
              },
            ),
          ),
          SizedBox(width: 4),
          // Пауза / Воспроизведение
          Obx(
            () => Flexible(
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: (controller.getPlayerState() == 4)
                    ? Icon(Icons.play_arrow_rounded)
                    : Icon(Icons.pause_rounded),
                onPressed: () {
                  if (controller.getPlayerState() == PlayerState.paused.index) {
                    youTubeController.play();
                  } else {
                    youTubeController.pause();
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 4),
          // Перемотка вперёд на 10 сек
          Flexible(
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Icon(Icons.fast_forward_rounded),
              onPressed: () {
                var forwardTo = youTubeController.value.position.inSeconds + 10;
                youTubeController.seekTo(Duration(seconds: forwardTo));
              },
            ),
          ),
        ],
      ),
    );
  }

  // Преобразовываем строку вида 1:34 в секунды (94)
  int _tryParseTime(String stTime) {
    DateTime dt;
    var format = DateFormat('m:s');
    try {
      dt = format.parse(stTime);
    } catch (e) {
      // Если ошибка преобразования — начинаем видео с начала
      logPrint("Ошибка при преобразовании даты $stTime. Ошибка $e");
      return 0;
    }
    var seconds = dt.second;
    var minutes = dt.minute;
    return (minutes * 60 + seconds);
  }
}
