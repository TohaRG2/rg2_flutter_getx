import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:rg2/utils/my_logger.dart';

class ConnectionController extends GetxController {

  final Rx<ConnectivityResult> _connection = ConnectivityResult.none.obs;
  ConnectivityResult get connection => _connection.value;
  set connection(ConnectivityResult value) => _connection.value = value;


  @override
  void onInit() async {
    super.onInit();
    connection = await Connectivity().checkConnectivity();
    Connectivity().onConnectivityChanged
        .listen((event) {
          logPrint("onConnectivityChanged - $event");
          connection = event;
        });
  }
}
