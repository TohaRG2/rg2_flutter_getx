import 'package:flutter/foundation.dart';

/// Выводим сообщение в лог, только если приложение работает в debug режиме
/// к сообщению добавляется метка (задана жестко в коде)
logPrint(dynamic string){
  var tag = "FAPP";
  if (kReleaseMode) { // is Release Mode ??
    //print('release mode');
  } else {
    print("$tag $string");
  }
}