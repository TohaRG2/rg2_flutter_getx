import 'package:flutter/material.dart';
import 'package:rg2_flutter_getx/controllers/settingsController.dart';
import 'package:rg2_flutter_getx/res/string_values.dart';
import 'package:rg2_flutter_getx/views/learn/detail/view_pager/my_html_view.dart';
import 'package:get/get.dart';
import 'package:rg2_flutter_getx/controllers/learn_detail_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'header.dart';

class LearnDetailPage extends StatelessWidget {
  final int _curPageNumber;
  final LearnDetailController _controller = Get.find();
  final SettingsController _settingsController = Get.find();

  LearnDetailPage(this._curPageNumber);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _youTubeController = YoutubePlayerController(
      initialVideoId: _controller.currentItems[_curPageNumber].url,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    bool showYouTubeVideo =
        (_controller.currentItems[_curPageNumber].url != "") &&
            (_settingsController.internetUsage.value != 3);
    return SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Header(curPageNumber: _curPageNumber),
                        Divider(color: Theme.of(context).primaryColor,),
                        Visibility(
                            visible: (_controller.currentItems[_curPageNumber].comment == "") ? false : true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(R.commentPager,
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                                Text(_controller.currentItems[_curPageNumber].comment,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16
                                  ),
                                ),
                                Divider(color: Theme.of(context).primaryColor,)
                              ],
                            )
                        ),
                        MyHtmlView(curPageNumber: _curPageNumber),
                        Visibility(
                          //visible: false,
                          visible: (showYouTubeVideo) ? true : false,
                          child: YoutubePlayer(
                            controller: _youTubeController,
                          ),
                        ),
                        SizedBox(height: 150,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
