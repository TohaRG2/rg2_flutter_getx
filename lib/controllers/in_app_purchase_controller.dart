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
import 'package:rg2/views/settings/controller/settings_controller.dart';

class InAppPurchaseController extends GetxController {
  final GlobalStorageController _storage = Get.find();
  final SettingsController _settings = Get.find();
  final InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;

  /// Доступность магазина покупок
  bool isAvailable = false;

  /// RxList в который биндим стрим изменений списка купленных товаров
  RxList<PurchaseDetails> _subscription = <PurchaseDetails>[].obs;

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

  Rx<PurchaserState> _state = PurchaserState.SIMPLE_USER.obs;
  PurchaserState get state => _state.value;
  set state(PurchaserState value) {
    logPrint("IAP state - $value");
    _state.value = value;
    switch(value) {
      case PurchaserState.SIMPLE_USER:
        _storage.setPropertyByKey(Property(key: Const.PURCHASER_STATE, value: 0));
        logPrint("IAP state - SIMPLE_USER");
        break;
      case PurchaserState.AD_OFF_USER:
        _storage.setPropertyByKey(Property(key: Const.PURCHASER_STATE, value: 1));
        _settings.isAdEnabled = false;
        logPrint("IAP state - AD_OFF_USER");
        break;
      case PurchaserState.PURCHASER:
        _storage.setPropertyByKey(Property(key: Const.PURCHASER_STATE, value: 2));
        _settings.isAdEnabled = false;
        _settings.isAllPuzzlesEnabled = true;
        logPrint("IAP state - PURCHASER");
        break;
      case PurchaserState.VIP_USER:
        _storage.setPropertyByKey(Property(key: Const.PURCHASER_STATE, value: 3));
        _settings.isAdEnabled = false;
        _settings.isAllPuzzlesEnabled = true;
        logPrint("IAP state - VIP_USER");
        break;
    }
  }
  _getPurchaserStateFromStorage() {
    int intState = _storage.getPropertyByKey(Const.PURCHASER_STATE);
    switch(intState) {
      case 0:
        _state.value = PurchaserState.SIMPLE_USER;
        break;
      case 1:
        _state.value = PurchaserState.AD_OFF_USER;
        break;
      case 2:
        _state.value = PurchaserState.PURCHASER;
        break;
      case 3:
        _state.value = PurchaserState.VIP_USER;
        break;
    }
  }

  @override
  onInit() {
    super.onInit();
    logPrint("onInit - InAppPurchaseController");
    _coins.value = _storage.getPropertyByKey(Const.CURRENT_COINS);
    _getPurchaserStateFromStorage();
    // Биндим стрим в Observable _subscription и подписываемся на его изменения
    _subscription.bindStream(_iap.purchaseUpdatedStream);
    ever(_subscription, _listenToPurchaseUpdated);
    _initStoreInfo();
  }

  /// Инициализруем покупки
  Future<void> _initStoreInfo() async {
    // Проверка подключения к базовому магазину (AppStore или PlayMarket)
    isAvailable = await _iap.isAvailable();
    // Если есть соединение, то получаем список доступных продуктов и уже купленных
    if (isAvailable) {
      await _getProducts();
      await _getPreviousPurchases();
      //verifyPurchase(myProductID);
    }

    logPrint("IAP initStoreInfo - $isAvailable");
  }

  /// Слушатель обновления в потоке покупок
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    logPrint("IAP новая покупка ${purchaseDetailsList.first?.productID}");
    purchases.addAll(purchaseDetailsList);
    purchases.forEach((PurchaseDetails purchase) async {
      logPrint("IAP _listenToPurchaseUpdated - ${purchase.productID}");
      _setStateByPurchase(purchase);
    });
    if (Get.isDialogOpen) { Get.back(); }
    //verifyPurchase(myProductID);
  }

  /// Бизнес логика для проверки покупки расходных материалов (consumable товаров)
  bool verifyPurchase(String productID) {
    PurchaseDetails purchase = _hasPurchased(productID);
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
  PurchaseDetails _hasPurchased(String productID) {
    return purchases.firstWhere(
            (purchase) => purchase.productID == productID,
        orElse: () => null);
  }

  /// Возвращаем продукт из списка доступных продуктов по его ID или null, если его там нет
  ProductDetails _getProduct(String productId) {
    return products.firstWhere(
            (product) => product.id == productId,
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
    } else {
      purchases = response.pastPurchases;
      for (PurchaseDetails purchase in purchases) {
        // Проверяем список уже купленных товаров и выставляем статус пользователя
        // Если покупал что-то в старой версии или купил кофе в новой, то VIP
        _setStateByPurchase(purchase);
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
      logPrint("IAP _getPreviousPurchases - ${purchases.map((e) => e.productID)}");
    }
  }

  void _setStateByPurchase(PurchaseDetails purchase) {
    // Проверяем список уже купленных товаров и выставляем статус пользователя
    // Если покупал что-то в старой версии или купил кофе в новой, то VIP
    if (oldRg2Products.contains(purchase.productID) || purchase.productID == G_AD_OFF_AND_OPEN_ALL_PLUS) {
      state = PurchaserState.VIP_USER;
      // Если не VIP, но куплено "без рекламы" и "разблокировку"
    } else if (purchase.productID == G_AD_OFF_AND_OPEN_ALL && state != PurchaserState.VIP_USER) {
      state = PurchaserState.PURCHASER;
      // Если простой юзер и купил только отказ от рекламы
    } else if (purchase.productID == G_AD_OFF && state == PurchaserState.SIMPLE_USER) {
      state = PurchaserState.AD_OFF_USER;
    }
    logPrint("IAP _getPreviousPurchases - PurchaserState = $state");
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
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: _getProduct(productID));
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
        // Для расходных (consumable) товаров, нужно поставить autoConsume: false
        // и обработать покупку (добавить товар в свой базе)
        // https://fireship.io/lessons/flutter-inapp-purchases/
        //_iap.buyNonConsumable(purchaseParam: purchaseParam, autoConsume: false);
        break;
      case 2:
        var productID = newRg2Products[1];
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: _getProduct(productID));
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
        break;
      case 3:
        var productID = newRg2Products[2];
        final PurchaseParam purchaseParam = PurchaseParam(productDetails: _getProduct(productID));
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
        break;

    }
  }


  onTapExpansion(int index, bool isExpanded) {
    //logPrint("onTapExpansion - $index => $isExpanded");
    // нельзя поменять сразу _listItems[index].isExpanded, т.к. в этом случае список не обновится и Obx не сработает
    var item = _listItems[index];
    item.isExpanded = !isExpanded;
    _listItems[index] = item;
  }



  //------------------- Константы (списки продуктов) ----------------------------

  /// Полный список продуктов
  static const List<String> allRG2Products = [
    SMALL_DONATION,
    MEDIUM_DONATION,
    BIG_DONATION,
    VERY_BIG_DONATION,
    G_AD_OFF,
    G_AD_OFF_AND_OPEN_ALL,
    G_AD_OFF_AND_OPEN_ALL_PLUS,
  ];

  /// Список продуктов для старого андроид приложения (котлин версии)
  static const List<String> oldRg2Products = [
    SMALL_DONATION,
    MEDIUM_DONATION,
    BIG_DONATION,
    VERY_BIG_DONATION,
  ];

  /// Список продуктов доступных для покупки во флаттер версии RG2
  static const List<String> newRg2Products = [
    G_AD_OFF,
    G_AD_OFF_AND_OPEN_ALL,
    G_AD_OFF_AND_OPEN_ALL_PLUS,
  ];

  static const SMALL_DONATION = 'small_donation';
  static const MEDIUM_DONATION = 'medium_donation';
  static const BIG_DONATION = 'big_donation';
  static const VERY_BIG_DONATION = 'very_big_donation';
  static const G_AD_OFF = 'g_ad_off';
  static const G_AD_OFF_AND_OPEN_ALL = 'g_ad_off_and_open_all';
  static const G_AD_OFF_AND_OPEN_ALL_PLUS = 'g_ad_off_and_open_all_plus_coffee';
}