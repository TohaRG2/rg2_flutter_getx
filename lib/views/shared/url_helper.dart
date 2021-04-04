import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';
import 'package:rg2/views/trainers/scramble_gen/view/main_scramble_gen_view.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {

  //"rg2://scrmbl?scram=D2_F\'_R_L_U_R\'_D\'_B2_R\'_F2_R2_U2_R2_U\'"
  //"rg2://ytplay?time=2:36&link=rzGqTZKG74o"
  //rg2://pager?phase=BEGIN&item=1
  static onUrlTap(String url) {
    logPrint("Opening url - $url");
    var uri = Uri.parse(url);
    if (uri.scheme == "rg2") {
      _launchRG2url(uri);
    } else {
      _launchExternalURL(url);
    }
  }

  /// Переходы к нужному окну программы в зависимости от типа ссылки
  static _launchRG2url(Uri uri) {
    logPrint("URI.parameters - ${uri.queryParameters}");
    // окно просмотра видео для "ytplay" или "ytplay"
    if (uri.host.toLowerCase() == "ytplay" || uri.host.toLowerCase() == "ytplay") {
      var _id = uri.queryParameters["link"] ?? "u1CA_35lRAI";
      var _time = uri.queryParameters["time"] ?? "0:00";
      var _alg = uri.queryParameters["alg"] ?? "";
      _alg = _alg.replaceAll("_", " ").replaceAll("\\", "");
      //Get.to(() => YouTubeView(id: _id, time: _time, alg: _alg,));
      Get.toNamed("/youtube", arguments: {"id" : _id, "time": _time, "alg": _alg});
    } else {

      // окно генератора скрамблов для "scrmbl" или "scramble"
      if (uri.host.toLowerCase() == "scrmbl" ||
          uri.host.toLowerCase() == "scramble") {
        var scramble = uri.queryParameters["scram"] ?? "R_R\'";
        //TODO uncomment when ScrambleGenerator will be completed
        //Get.to(() => ScrambleGenView(scramble));
      }

      // окно детальной информации для ссылок типа "pager"
      //rg2://pager?phase=BEGIN&item=1
      if (uri.host.toLowerCase() == "pager") {
        var phase = uri.queryParameters["phase"] ?? "BEGIN";
        var id = int.tryParse(uri.queryParameters["item"]) ?? 1;
        //Поскольку мы и так в LearnDetailScreen, то переходим не через Get.off()
        Get.back();
        Get.to(() => LearnDetailScreen(phase, id), transition: Transition.fadeIn);
      }
    }
  }

  /// Запуск ссылки во внешнем приложении
  static _launchExternalURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// нормализуем текст для отображения в html, заменяем пути к картинкам и центруем их отображение
  static getNormalHtmlTextFromDescription(String description, String assetPath){
    var htmlText = description;
    htmlText = htmlText.replaceAll('<img src=', '<img apath="$assetPath" src=');
    int n = 0;
    while (htmlText.indexOf('<p style="text-align:center">', n) != -1) {
      n = htmlText.indexOf('<p style="text-align:center">', n);
      htmlText = htmlText.replaceFirst("</p>","</h5>",n);
      n = htmlText.indexOf("/h5",n);
    }
    htmlText = htmlText.replaceAll('<p style="text-align:center">','<h5>');
    return htmlText;
  }

}