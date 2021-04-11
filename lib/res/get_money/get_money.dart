import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';

final getMoneyItems = <GetMoneyItem>[
  getFreeMoney,
  adOff,
  adOffAndOpenAll,
  adOffAndOpenAllPlus,
];

final getFreeMoney = GetMoneyItem(title: getFreeMoneyTitle, price: getFreeMoneyPrice, help: getFreeMoneyHelp);
final adOff = GetMoneyItem(title: adOffTitle, price: adOffPrice, help: adOffHelp);
final adOffAndOpenAll = GetMoneyItem(title: adOffAndOpenAllTitle, price: adOffAndOpenAllPrice, help: adOffAndOpenAllHelp);
final adOffAndOpenAllPlus = GetMoneyItem(title: adOffAndOpenAllPlusTitle, price: adOffAndOpenAllPlusPrice, help: adOffAndOpenAllPlusHelp);

const getFreeMoneyTitle = "Получить бесплатные монетки";
const getFreeMoneyPrice = "0\$";
const getFreeMoneyHelp = "Получите монетки за просмотр рекламы";

const adOffTitle = "Отключить рекламу";
const adOffPrice = "1\$";
const adOffHelp = "Монетки не будут тратиться на просмотр обучалок. Но чтобы открыть новые обучалки придется их заработать";

const adOffAndOpenAllTitle = "Отключить рекламу и открыть все обучалки";
const adOffAndOpenAllPrice = "2\$";
const adOffAndOpenAllHelp = "Монетки больше не расходуются, все обучалки становятся доступны";

const adOffAndOpenAllPlusTitle = "Отключить рекламу, открыть все обучалки + кофе автору";
const adOffAndOpenAllPlusPrice = "4\$";
const adOffAndOpenAllPlusHelp = "Монетки не расходуются, все обучалки доступны + отдельное спасибо автору программы";