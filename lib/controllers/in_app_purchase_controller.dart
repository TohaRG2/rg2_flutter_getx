import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:meta/meta.dart';
import 'package:rg2/utils/my_logger.dart';

class InAppPurchaseController extends GetxController {

  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  bool isAvailable = false;
  RxList<PurchaseDetails> _subscription = <PurchaseDetails>[].obs;
  final String myProductID = 'medium_donation';
  List<String> googleProducts = ['small_donation', 'medium_donation', 'big_donation', 'very_big_donation'];

  RxList<PurchaseDetails> _purchases = <PurchaseDetails>[].obs;
  List<PurchaseDetails> get purchases => _purchases;
  set purchases(List<PurchaseDetails> value) {
    _purchases.assignAll(value);
  }


  RxList<ProductDetails> _products = <ProductDetails>[].obs;
  List<ProductDetails> get products => _products;
  set products(List<ProductDetails> value) {
    _products.assignAll(value);
  }

  RxBool _isPurchased = false.obs;
  bool get isPurchased => _isPurchased.value;
  set isPurchased(value) {
    _isPurchased.value = value;
  }

  @override
  onInit() {
    super.onInit();
    logPrint("onInit - InAppPurchaseController");
    // Биндим стрим в Observable _subscription и подписываемся на его изменения
    _subscription.bindStream(_iap.purchaseUpdatedStream);
    ever(_subscription, _listenToPurchaseUpdated);
    initStoreInfo();
  }

  /// Инициализруем покупки
  Future<void> initStoreInfo() async {
    isAvailable = await _iap.isAvailable();
    // Если нет соединения
    if (isAvailable) {
      await _getProducts();
      await _getPastPurchases();
      verifyPurchase(myProductID);
    }

    logPrint("IAP initStoreInfo - $isAvailable");
  }

  /// Слушатель обновления в потоке покупок
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    logPrint("_listenToPurchaseUpdated - ");
    purchases = purchaseDetailsList;
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      logPrint("IAP _listenToPurchaseUpdated - $purchaseDetails");
    });
    verifyPurchase(myProductID);
  }

  /// Проверяем, куплен ли уже продукт по его ID
  void verifyPurchase(String productID) {
    PurchaseDetails purchase = hasPurchased(productID);
    logPrint("IAP verifyPurchase - $productID, $purchase");
    if (purchase?.status == PurchaseStatus.purchased) {

      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
        isPurchased = true;
      }

    }
    logPrint("IAP verifyPurchase - $isPurchased");
  }

  /// Проверяем, есть ли в списке [purchases] продукт с [productID]
  /// возвращаем его или null если продукта в списке нет
  PurchaseDetails hasPurchased(String productID) {
    return purchases.firstWhere(
            (purchase) => purchase.productID == productID,
        orElse: () => null);
  }

  /// Получаем список доступных для покупок продуктов
  Future<void> _getProducts() async {
    Set<String> ids = Set.from([myProductID]);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    products = response.productDetails;
    logPrint("IAP _getProducts - $products");
  }

  /// Получаем список покупок
  Future<void> _getPastPurchases() async {
    QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases();
    for (PurchaseDetails purchase in response.pastPurchases) {
      if (Platform.isIOS) {
        _iap.consumePurchase(purchase);
      }
    }
    purchases = response.pastPurchases;
    logPrint("IAP _getPastPurchases - $purchases");
  }

}