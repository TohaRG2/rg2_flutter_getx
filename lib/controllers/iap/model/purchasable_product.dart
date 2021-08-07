import 'package:in_app_purchase/in_app_purchase.dart';

enum ProductStatus {
  purchasable,
  purchased,
  pending,
}

/// Продукт, который может быть куплен в GooglePlay или AppStore
class PurchasableProduct {
  String get id => productDetails.id;
  String get title => productDetails.title;
  String get description => productDetails.description;
  String get price => productDetails.price;
  ProductStatus status;
  ProductDetails productDetails;

  PurchasableProduct(this.productDetails) : status = ProductStatus.purchasable;

  @override
  String toString() {
    return "id = $id, status = $status";
  }
}