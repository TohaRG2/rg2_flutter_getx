import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/controller/learn_controller.dart';
import 'package:rg2/views/learn/detail/learn_detail_screen.dart';

class LearnRedirectController extends GetxController {
  final LearnController _learnController = Get.find();

  String phase = "";
  int id = 0;

  @override
  // Контроллер привязан к view, как только view отрисуется, сработает данный метод
  void onReady() async {
    logPrint("LearnRedirectController onReady");
    super.onReady();
    // ждем по 100мс пока удалятся все хвосты от старого DetailView, обычно 200-300мс
    while (_learnController.hasDetailController) {
      await Future.delayed(Duration(milliseconds: 100));
    }
    redirectToDetail();
  }

  redirectToDetail() {
    Get.off(() => LearnDetailScreen(phase, id), transition: Transition.cupertino);
  }

}