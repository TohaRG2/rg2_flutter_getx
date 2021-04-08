import 'dart:async';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:meta/meta.dart';
import 'package:rg2/utils/my_logger.dart';

class InAppPurchaseController extends GetxController {

  Rx<List<PurchaseDetails>> _subscription;
  final InAppPurchaseConnection _connection = InAppPurchaseConnection.instance;

  List<String> _notFoundIds = [];
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  List<String> _consumables = [];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String _queryProductError;

  @override
  onInit() {
    logPrint("onInit - InAppPurchaseController");
    super.onInit();
    // Биндим стрим в Observable _subscription и подписываемся на его изменения
    _subscription.bindStream(_connection.purchaseUpdatedStream);
    ever(_subscription, _listenToPurchaseUpdated);

  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _connection.isAvailable();
    // Если нет соединения
    if (!isAvailable) {
      _isAvailable = isAvailable;
      _products = [];
      _purchases = [];
      _notFoundIds = [];
      _consumables = [];
      _purchasePending = false;
      _loading = false;
      return;
    }

    logPrint("initStoreInfo - connection.Available");
  }


  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      logPrint("_listenToPurchaseUpdated - $purchaseDetails");

    });
  }

}