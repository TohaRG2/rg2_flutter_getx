import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:rg2/controllers/iap/iap_const.dart';
import 'package:rg2/controllers/iap/iap_helper.dart';
import 'package:rg2/controllers/iap/model/purchasable_product.dart';
import 'package:rg2/controllers/iap/model/store_state.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/settings/controller/settings_controller.dart';

class IAPController extends GetxController {

  final _iapConnection = InAppPurchase.instance;
  final SettingsController _settings = Get.find();

  /// Состояние доступности магазина покупок
  Rx<StoreState> _storeState = StoreState.loading.obs;
    StoreState get storeState => _storeState.value;
    String get storeStateText {
      var text = "";
      switch (storeState) {
        case StoreState.loading:
          text =  "Магазин загружается";
          break;
        case StoreState.available:
          text =  "Магазин доступен";
          break;
        case StoreState.notAvailable:
          text =  "Магазин покупок временно недоступен. Проверьте ваше интернет подключение";
          break;
      }
      return text;
    }

  /// RxList в который биндим стрим изменений списка купленных товаров
  RxList<PurchaseDetails> _subscription = <PurchaseDetails>[].obs;

  /// Список товаров, которые можно купить
  RxList<PurchasableProduct> _products = <PurchasableProduct>[].obs;
    List<PurchasableProduct> get products => _products;

  @override
  void onInit() {
    super.onInit();
    logPrint("IAP onInit - start");
    _loadPurchases();
    // Биндим стрим в Observable _subscription и подписываемся на его изменения
    _subscription.bindStream(_iapConnection.purchaseStream);
    ever(_subscription, _listenToPurchaseUpdated);
  }

  /// Подгружаем список купленных товаров
  Future<void> _loadPurchases() async {
    // Проверяем, доступен ли магазин приложений, если НЕдоступен, то меняем статус и выходим
    final available = await _iapConnection.isAvailable();
    logPrint("IAP loadPurchases is available $available");
    if (!available) {
      _storeState.value = StoreState.notAvailable;
      return;
    }
    // если доступен, то пробуем получить состояние покупок для списка всех product_id
    const ids = allRg2Products;
    logPrint("IAP loadPurchases - пробуем получить состояние для $ids");

    ProductDetailsResponse response = await _iapConnection.queryProductDetails(ids);
    // Продукты из списка, недоступные для покупки
    // response.notFoundIDs.forEach((element) {
    //   logPrint('IAP Purchase $element не найден');
    // });

    // Выбираем только те продукты, которые доступны для покупки
    List<PurchasableProduct> items = response.productDetails.map(
            (prodDetails) => PurchasableProduct(prodDetails)
    ).toList();
    logPrint("IAP - из $ids можно купить $items");
    _products.value = items;
    _storeState.value = StoreState.available;

  }


  /// Слушатель обновления в потоке покупок
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach(_handlePurchase);
  }

  /// Обработчик новой покупки
  void _handlePurchase(PurchaseDetails purchaseDetails) {
    logPrint("IAP новая покупка ${purchaseDetails.productID} статус ${purchaseDetails.status}");
    if (purchaseDetails.status == PurchaseStatus.purchased || purchaseDetails.status == PurchaseStatus.restored) {
      if (purchaseDetails.productID == IAPHelper.adsRemoveId) {
        logPrint("IAP - Купили отказ от рекламы");
        _settings.purchaserState |= 1;
        _settings.isAdDisabled = true;
      }
      else if (purchaseDetails.productID == IAPHelper.openAllPuzzlesId) {
        logPrint("IAP - Купили открыть все головоломки");
        _settings.purchaserState |= 2;
        _settings.isAllPuzzlesEnabled = true;
      }
      else if (oldRg2Products.contains(purchaseDetails.productID)) {
        logPrint("IAP - покупка из старой версии. Меняем статус на VIP");
        _settings.purchaserState |= 7;
        _settings.isAllPuzzlesEnabled = true;
        _settings.isAdDisabled = true;
      } else {
        logPrintErr("IAP - Купили что-то странное. ${purchaseDetails.productID}");
      }
    }
    else if (purchaseDetails.status == PurchaseStatus.error) {
      // если ошибка при покупке, то пробуем восстановить все покупки
      logPrintErr("IAP - ошибка покупки");
      if (Get.isSnackbarOpen) { Get.back(); }
      Get.snackbar("Ошибка", "Что-то пошло не так, попробуйте обновить список товаров",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        duration: Duration(seconds: 8),
        mainButton: TextButton(
            onPressed: (){
              Get.back();
              restorePurchases();
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Обновить"))
        ),
      );
    }
    // Подтверждаем, что товар доставлен (обработан программой)
    if (purchaseDetails.pendingCompletePurchase) {
      _iapConnection.completePurchase(purchaseDetails);
    }
  }

  /// Запрос на восстановление выполненных покупок. Покупки приходят в purchaseStream со статусом PurchaseStatus.restored
  restorePurchases() {
    InAppPurchase.instance.restorePurchases();
  }

  /// Запрос покупки товара по его ID, с проверкой доступности его покупки. Если недоступен, то получим ошибку Invalid argument
  Future<void> buy(String productId) async {
    ProductDetails productDetails;
    products.forEach((purchasableProduct) {
      if (purchasableProduct.productDetails.id == productId) {
        productDetails = purchasableProduct.productDetails;
      }
    });
    // Пример поиска, есть ли в спсиске элемент соответствующий определенному условию
    // hasUpgrade = purchases.any(
    //       (element) => element.productId == storeKeyUpgrade,
    // );

    if (productDetails != null) {
      final purchaseParam = PurchaseParam(productDetails: productDetails);
      await _iapConnection.buyNonConsumable(purchaseParam: purchaseParam);
    } else {
      //throw ArgumentError.value(productId, '$productId is not a known product');
      Get.snackbar("Ошибка", "К сожалению, этот товар сейчас недоступен для покупок",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black54,
        duration: Duration(seconds: 6)
      );
      logPrintErr("К сожалению, $productId сейчас недоступен для покупок");
    }
  }



}
