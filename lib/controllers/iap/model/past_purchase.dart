import 'package:flutter/widgets.dart';

enum PurchaseType {
  subscriptionPurchase,
  nonSubscriptionPurchase,
}

enum Store {
  googlePlay,
  appStore,
}

enum Status {
  pending,
  completed,
  active,
  expired,
}

@immutable
class PastPurchase {
  final PurchaseType type;
  final Store store;
  final String orderId;
  final String productId;
  final DateTime purchaseDate;
  final DateTime expiryDate;
  final Status status;

  String get title {
    switch (productId) {
    // case 'storeKeyConsumable':
    // Если productId относится к расходным материалам, возвращаем просто Consumable
    //   return 'Consumable';
    // case 'storeKeySubscription':
    // Если productId относится к подпискам, возвращаем просто Subscription
    //   return 'Subscription';
      default:
        return productId;
    }
  }

  PastPurchase.fromJson(Map<String, dynamic> json)
      : type = _typeFromString(json['type']),
        store = _storeFromString(json['iapSource']),
        orderId = json['orderId'],
        productId = json['productId'],
        purchaseDate = DateTime.now(),
        expiryDate = null,
        status = _statusFromString(json['status']);
}

PurchaseType _typeFromString(String type) {
  switch (type) {
    case 'NON_SUBSCRIPTION':
      return PurchaseType.subscriptionPurchase;
    case 'SUBSCRIPTION':
      return PurchaseType.nonSubscriptionPurchase;
    default:
      throw ArgumentError.value(type, '$type is not a supported type');
  }
}

Store _storeFromString(String store) {
  switch (store) {
    case 'google_play':
      return Store.googlePlay;
    case 'app_store':
      return Store.appStore;
    default:
      throw ArgumentError.value(store, '$store is not a supported store');
  }
}

Status _statusFromString(String status) {
  switch (status) {
    case 'PENDING':
      return Status.pending;
    case 'COMPLETED':
      return Status.completed;
    case 'ACTIVE':
      return Status.active;
    case 'EXPIRED':
      return Status.expired;
    default:
      throw ArgumentError.value(status, '$status is not a supported status');
  }
}
