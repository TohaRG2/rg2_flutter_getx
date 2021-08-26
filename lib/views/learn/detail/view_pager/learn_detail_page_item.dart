import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rg2/controllers/ads/ad_show_controller.dart';
import 'package:rg2/controllers/connection_controller.dart';
import 'package:rg2/database/entitys/main_db_item.dart';
import 'package:rg2/res/string_values.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/view_pager/my_html_view.dart';
import 'package:get/get.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/views/learn/detail/view_pager/youtube_thumbnail.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';
import 'package:rg2/views/shared/ui_helpers.dart';

import 'header.dart';

class LearnDetailPage extends StatelessWidget {
  final int _curPageNumber;

  const LearnDetailPage(this._curPageNumber);

  @override
  Widget build(BuildContext context) {
    final LearnDetailController _controller = Get.find();
    final SettingsController _settingsController = Get.find();
    final ConnectionController _connectionController = Get.find();

    final mainDBItem = _controller.currentItems[_curPageNumber];
    bool showYouTubeVideo = (mainDBItem.url != "") &&
        (_settingsController.internetUsage != 3) &&
        _connectionController.connection != ConnectivityResult.none;

    // Скролконтроллер, чтобы можно было сделать bottomBar уезжающим при скроле
    // ScrollController _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   final isScrollDirectionReverse = _scrollController.position.userScrollDirection == ScrollDirection.forward;
    //   if (_controller.isBottomBarShowing != isScrollDirectionReverse) {
    //     _controller.isBottomBarShowing = isScrollDirectionReverse;
    //   }
    // });

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: UIHelper.SpaceSmall),
            child: SingleChildScrollView(
              // controller: _scrollController,
              child: Column(
                children: [
                  Header(curPageNumber: _curPageNumber),
                  const Divider(),
                  _commentWidget(mainDBItem),
                  MyHtmlView(curPageNumber: _curPageNumber),
                  Visibility(
                    visible: showYouTubeVideo,
                    child: YoutubeThumbnail(videoID: mainDBItem.url),
                  ),
                  const SizedBox(height: 150,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _commentWidget(MainDBItem mainDBItem) {
    return Visibility(
        visible: mainDBItem.comment != "",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StrRes.commentPager,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              mainDBItem.comment,
              style: TextStyle(color: Get.theme.primaryColor, fontSize: 16),
            ),
            const Divider()
          ],
        ));
  }

}

