import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';

class LearnRedirectController extends GetxController {

  String phase = "";
  int id = 0;

  @override
  void onReady() {
    logPrint("LearnRedirectController onReady - ");
    // Контроллер привязан к view, как только view отрисуется, сработает данный метод
    super.onReady();
    redirectToDetail();
  }

  redirectToDetail() {
    Get.off(() => LearnDetailScreen(phase, id), transition: Transition.cupertino);
  }

}