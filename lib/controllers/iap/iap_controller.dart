import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:rg2/controllers/iap/iap_const.dart';
import 'package:rg2/controllers/iap/model/purchasable_product.dart';
import 'package:rg2/controllers/iap/model/store_state.dart';
import 'package:rg2/utils/my_logger.dart';

class IAPController extends GetxController {

  final iapConnection = IAPConnection.instance;

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

  /// Список купленных товаров
  RxList<PurchasableProduct> _products = <PurchasableProduct>[].obs;
    List<PurchasableProduct> get products => _products;

  @override
  void onInit() {
    super.onInit();
    logPrint("IAP onInit - start");
    // Биндим стрим в Observable _subscription и подписываемся на его изменения
    _subscription.bindStream(iapConnection.purchaseStream);
    ever(_subscription, _listenToPurchaseUpdated);
    _loadPurchases();
  }

  /// Подгружаем список купленных товаров
  Future<void> _loadPurchases() async {
    // Проверяем, доступен ли магазин приложений, если НЕдоступен, то меняем статус и выходим
    final available = await iapConnection.isAvailable();
    if (!available) {
      _storeState.value = StoreState.notAvailable;
      return;
    }
    // если доступен, то пробуем получить состояние покупок для списка всех product_id
    const ids = allRG2Products;
    logPrint("IAP onInit - пробуем получить состояние для $ids");
    final response = await iapConnection.queryProductDetails(ids);
    response.notFoundIDs.forEach((element) {
      logPrint('IAP Purchase $element не найден');
    });
    var items =response.productDetails.map(
            (prodDetails) => PurchasableProduct(prodDetails)
    ).toList();
    _products.addAll(items);
    logPrint("IAP - куплены $items");
    _storeState.value = StoreState.available;
  }


  /// Слушатель обновления в потоке покупок
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    logPrint("IAP новая покупка ${purchaseDetailsList.first?.productID}");

    // purchases.addAll(purchaseDetailsList);
    // purchases.forEach((PurchaseDetails purchase) async {
    //   logPrint("IAP _listenToPurchaseUpdated - ${purchase.productID}");
    //   _setStateByPurchase(purchase);
    // });
    // if (Get.isDialogOpen) { Get.back(); }
    //verifyPurchase(myProductID);
  }


}

// Singleton https://codelabs.developers.google.com/codelabs/flutter-in-app-purchases#1
class IAPConnection {
  static InAppPurchase _instance;
  static set instance(InAppPurchase value) {
    _instance = value;
  }

  static InAppPurchase get instance {
    _instance ??= InAppPurchase.instance;
    return _instance;
  }
}