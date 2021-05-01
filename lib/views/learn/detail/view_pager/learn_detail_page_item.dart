import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/views/learn/detail/view_pager/my_html_view.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/views/learn/detail/view_pager/youtube_thumbnail.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'header.dart';

class LearnDetailPage extends StatelessWidget {
  final int _curPageNumber;
  final LearnDetailController _controller = Get.find();
  final SettingsController _settingsController = Get.find();

  LearnDetailPage(this._curPageNumber);

  @override
  Widget build(BuildContext context) {

    bool showYouTubeVideo =
        (_controller.currentItems[_curPageNumber].url != "") &&
            (_settingsController.internetUsage != 3);
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      var isScrollDirectionReverse = _scrollController.position.userScrollDirection == ScrollDirection.forward;
      if (_controller.isBottomBarShowing != isScrollDirectionReverse) {
        _controller.isBottomBarShowing = isScrollDirectionReverse;
      }
    });
    //_scrollController.position.userScrollDirection
    
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Header(curPageNumber: _curPageNumber),
                  Divider(color: Theme.of(context).primaryColor,),
                  Visibility(
                      visible: (_controller.currentItems[_curPageNumber].comment == "") ? false : true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(StrRes.commentPager,
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Text(_controller.currentItems[_curPageNumber].comment,
                            style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontSize: 16
                            ),
                          ),
                          Divider(color: Get.theme.primaryColor,)
                        ],
                      )
                  ),
                  MyHtmlView(curPageNumber: _curPageNumber),
                  Visibility(
                    visible: (showYouTubeVideo) ? true : false,
                    child: YoutubeThumbnail(videoID: _controller.currentItems[_curPageNumber].url),

                  ),
                  SizedBox(height: 150,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
