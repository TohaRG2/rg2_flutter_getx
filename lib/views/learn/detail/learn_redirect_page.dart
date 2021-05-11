import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/learn/detail/controller/learn_redirect_controller.dart';

class LearnRedirectPage extends StatelessWidget {
  final LearnRedirectController controller = Get.put(LearnRedirectController());
  final String phase;
  final int id;

  LearnRedirectPage(this.phase, this.id);

  @override
  Widget build(BuildContext context) {
    controller.phase = phase;
    controller.id = id;
    logPrint("LearnRedirectPage build - ");
    return Container(
      color: Colors.black54,
      child: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}
