import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:rg2/controllers/iap/iap_connection.dart';
import 'package:rg2/controllers/iap/iap_const.dart';
import 'package:rg2/controllers/iap/model/purchasable_product.dart';
import 'package:rg2/controllers/iap/model/store_state.dart';
import 'package:rg2/utils/my_logger.dart';

class IAPController extends GetxController {

  //final iapConnection = IAPConnection.instance;
  final iapConnection = InAppPurchase.instance;

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
    _loadPurchases();
    // Биндим стрим в Observable _subscription и подписываемся на его изменения
    _subscription.bindStream(iapConnection.purchaseStream);
    ever(_subscription, _listenToPurchaseUpdated);
  }

  /// Подгружаем список купленных товаров
  Future<void> _loadPurchases() async {
    // Проверяем, доступен ли магазин приложений, если НЕдоступен, то меняем статус и выходим
    final available = await iapConnection.isAvailable();
    logPrint("IAP loadPurchases is available $available");
    if (!available) {
      _storeState.value = StoreState.notAvailable;
      return;
    }
    // если доступен, то пробуем получить состояние покупок для списка всех product_id
    const ids = newRg2Products;
    //Set<String> ids = <String>['android.test.purchased'].toSet();
    logPrint("IAP loadPurchases - пробуем получить состояние для $ids");

    try {
      ProductDetailsResponse response = await iapConnection.queryProductDetails(ids);
      logPrint("IAP loadPurchases response - $response");
      response.notFoundIDs.forEach((element) {
        logPrint('IAP Purchase $element не найден');
      });
      var items = response.productDetails.map(
              (prodDetails) => PurchasableProduct(prodDetails)
      ).toList();
      logPrint("IAP - можно купить $items");
      _products.value = items;
      _storeState.value = StoreState.available;
    } on Exception catch (e) {
      logPrintErr("IAP - $e");
    }
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
