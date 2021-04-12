import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:meta/meta.dart';
import 'package:rg2/res/get_money/get_money.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';

class InAppPurchaseController extends GetxController {

  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  bool isAvailable = false;
  RxList<PurchaseDetails> _subscription = <PurchaseDetails>[].obs;
  final String myProductID = 'medium_donation';
  List<String> allRG2Products = [
    'small_donation',
    'medium_donation',
    'big_donation',
    'very_big_donation',
    'g_ad_off',
    'g_ad_off_and_open_all',
    'g_ad_off_and_open_all_plus_coffee'
  ];
  List<String> newRg2Products = [
    'g_ad_off',
    'g_ad_off_and_open_all',
    'g_ad_off_and_open_all_plus_coffee'
  ];

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

  RxInt _coins = 0.obs;
  String get coins {
    if (_coins.value >= 0) {
      return _coins.value.toString();
    } else {
      return "∞";
    }
  }
  set coins(value) {
    _coins.value = value;
  }

  final List<GetMoneyItem> listItems = getMoneyItems;

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
    // Проверка подключения к базовому магазину (AppStore или PlayMarket)
    isAvailable = await _iap.isAvailable();
    // Если нет соединения
    if (isAvailable) {
      await _getProducts();
      await _getPreviousPurchases();
      verifyPurchase(myProductID);
    }

    logPrint("IAP initStoreInfo - $isAvailable");
  }

  /// Слушатель обновления в потоке покупок
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    logPrint("_listenToPurchaseUpdated - ");
    purchases = purchaseDetailsList;
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      logPrint("IAP _listenToPurchaseUpdated - ${purchaseDetails.status}");
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
    Set<String> ids = Set.from(allRG2Products);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    products = response.productDetails;
    logPrint("IAP _getProducts - ${products.length} ${products.map((e) => e.id)}");
  }

  /// Получаем список покупок
  Future<void> _getPreviousPurchases() async {
    QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases();
    if (response.error != null) {
      logPrintErr("Error getPreviousPurchases - ${response.error}");
    }
    for (PurchaseDetails purchase in response.pastPurchases) {
      //TODO verify the purchase following best practices for each underlying store.
      //   _verifyPurchase(purchase);
      //   // Deliver the purchase to the user in your app.
      //   _deliverPurchase(purchase);
      //   if (purchase.pendingCompletePurchase) {
      //     // Mark that you've delivered the purchase. This is mandatory.
      //     InAppPurchaseConnection.instance.completePurchase(purchase);
      //   }
      if (Platform.isIOS) {
        _iap.consumePurchase(purchase);
      }
    }
    purchases = response.pastPurchases;
    logPrint("IAP _getPastPurchases - $purchases");
  }

  /// Выполняем покупку пользователем, который еще не покупал ничего
  onTapBySimpleUser(int index) {

  }

}