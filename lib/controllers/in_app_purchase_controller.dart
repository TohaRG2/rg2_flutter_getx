import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:meta/meta.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/database/fire_entitys/property.dart';
import 'package:rg2/res/constants.dart';
import 'package:rg2/res/get_money/get_money.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';
import 'package:rg2/views/dialogs/get_money/model/purchaserState.dart';

class InAppPurchaseController extends GetxController {
  final GlobalStorageController _storage = Get.find();
  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;

  /// Доступность магазина покупок
  bool isAvailable = false;

  /// RxList в который биндим стрим изменений списка купленных товаров
  RxList<PurchaseDetails> _subscription = <PurchaseDetails>[].obs;

  //TODO непонятный продукт, надо убрать
  final String myProductID = 'medium_donation';

  /// Список купленных продуктов
  RxList<PurchaseDetails> _purchases = <PurchaseDetails>[].obs;
  List<PurchaseDetails> get purchases => _purchases;
  set purchases(List<PurchaseDetails> value) {
    _purchases.assignAll(value);
  }

  /// Список продуктов доступных для покупки
  RxList<ProductDetails> _products = <ProductDetails>[].obs;
  List<ProductDetails> get products => _products;
  set products(List<ProductDetails> value) {
    _products.assignAll(value);
  }

  // RxBool _isPurchased = false.obs;
  // bool get isPurchased => _isPurchased.value;
  // set isPurchased(value) {
  //   _isPurchased.value = value;
  // }

  RxInt _coins = 0.obs;
  get coins => _coins.value;
  set coins(int value) {
    _coins.value = value;
    _storage.setPropertyByKey(Property(key: Const.CURRENT_COINS, value: value));
  }
  String getCoins() {
    if (_coins.value >= 0) {
      return _coins.value.toString();
    } else {
      return "∞";
    }
  }

  final RxList<GetMoneyItem> _listItems = getMoneyItems.obs;
  List<GetMoneyItem> get listItems => _listItems;

  PurchaserState _state = PurchaserState.SIMPLE_USER;

  @override
  onInit() {
    super.onInit();
    logPrint("onInit - InAppPurchaseController");
    _coins.value = _storage.getPropertyByKey(Const.CURRENT_COINS);
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
    logPrint("IAP новая покупка ${purchaseDetailsList.first?.productID}");
    purchases.addAll(purchaseDetailsList);
    purchases.forEach((PurchaseDetails purchaseDetails) async {
      logPrint("IAP _listenToPurchaseUpdated - ${purchaseDetails.productID}");
    });
    verifyPurchase(myProductID);
  }

  /// Бизнес логика для проверки покупки расходных материалов (consumable товаров)
  bool verifyPurchase(String productID) {
    PurchaseDetails purchase = hasPurchased(productID);
    logPrint("IAP verifyPurchase - $productID, $purchase");
    var result = false;
    if (purchase?.status == PurchaseStatus.purchased) {

      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
        result = true;
      }
    }
    logPrint("IAP verifyPurchase - $result");
    return result;
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
    logPrint("IAP _getPreviousPurchases - ${purchases.map((e) => e.productID)}");
  }

  /// Выполняем покупку пользователем, который еще не покупал ничего
  onTapBySimpleUser(GetMoneyItem item) {
    logPrint("onTapBySimpleUser - $item");
    switch (item.id) {
      case 0:
        coins++;
        break;
      case 1:
        var productID = newRg2Products[0];
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: getProduct(productID));
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
        break;
      case 2:
        var productID = newRg2Products[1];
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: getProduct(productID));
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
        break;
      case 3:
        var productID = newRg2Products[2];
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: getProduct(productID));
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
        break;

    }
  }

  ProductDetails getProduct(String productId) {
    return products.firstWhere(
            (product) => product.id == productId,
        orElse: () => null);
  }

  onTapExpansion(int index, bool isExpanded) {
    logPrint("onTapExpansion - $index => $isExpanded");
    // нельзя поменять сразу _listItems[index].isExpanded, т.к. в этом случае список не обновится и Obx не сработает
    var item = _listItems[index];
    item.isExpanded = !isExpanded;
    _listItems[index] = item;
  }



  //------------------- Константы (списки продуктов) ----------------------------

  /// Полный список продуктов
  static const List<String> allRG2Products = [
    'small_donation',
    'medium_donation',
    'big_donation',
    'very_big_donation',
    'g_ad_off',
    'g_ad_off_and_open_all',
    'g_ad_off_and_open_all_plus_coffee'
  ];

  /// Список продуктов для старого андроид приложения (котлин версии)
  static const List<String> oldRg2Products = [
    'small_donation',
    'medium_donation',
    'big_donation',
    'very_big_donation',
  ];

  /// Список продуктов доступных для покупки во флаттер версии RG2
  static const List<String> newRg2Products = [
    'g_ad_off',
    'g_ad_off_and_open_all',
    'g_ad_off_and_open_all_plus_coffee'
  ];

}