import 'package:flutter/foundation.dart';

/// Выводим сообщение в лог, только если приложение работает в debug режиме
/// к сообщению добавляется метка (задана жестко в коде)
void logPrint(dynamic string){
  var tag = "FAPP";
  if (kReleaseMode) { // is Release Mode ??
    print("$tag $string");
  } else {
    print("$tag $string");
  }
}

void logPrintErr(dynamic string){
  var tag = "FAPP Error!";
  if (kReleaseMode) { // is Release Mode ??
    print("$tag $string");
  } else {
    print("$tag $string");
  }
}