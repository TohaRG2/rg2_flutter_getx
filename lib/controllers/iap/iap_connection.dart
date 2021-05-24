// Singleton https://codelabs.developers.google.com/codelabs/flutter-in-app-purchases#1
import 'package:in_app_purchase/in_app_purchase.dart';

class IAPConnection {
  static InAppPurchase _instance;

  static set instance(InAppPurchase value) {
    _instance = value;
  }

  static InAppPurchase get instance {
    if (_instance == null) { _instance = InAppPurchase.instance; }
    return _instance;
  }
}