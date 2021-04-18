import 'package:rg2/views/dialogs/get_money/model/get_money_item.dart';

final getAllMoneyItems = <GetMoneyItem>[
  getFreeMoney,
  adOff,
  adOffAndOpenAll,
  adOffAndOpenAllPlus,
];

final getMoneyItemsWithoutAdOff = <GetMoneyItem>[
  getFreeMoney,
  adOffAndOpenAll,
  adOffAndOpenAllPlus,
];

final getFreeMoney = GetMoneyItem(
    id: getFreeMoneyID,
    title: getFreeMoneyTitle,
    price: getFreeMoneyPrice,
    help: getFreeMoneyHelp
);
final adOff = GetMoneyItem(
    id: adOffID,
    title: adOffTitle,
    price: adOffPrice,
    help: adOffHelp
);
final adOffAndOpenAll = GetMoneyItem(
    id: adOffAndOpenAllID,
    title: adOffAndOpenAllTitle,
    price: adOffAndOpenAllPrice,
    help: adOffAndOpenAllHelp
);
final adOffAndOpenAllPlus = GetMoneyItem(
    id: adOffAndOpenAllPlusID,
    title: adOffAndOpenAllPlusTitle,
    price: adOffAndOpenAllPlusPrice,
    help: adOffAndOpenAllPlusHelp
);

const getFreeMoneyID = 0;
const getFreeMoneyTitle = "Получить бесплатные монетки";
const getFreeMoneyPrice = "0\$";
const getFreeMoneyHelp = "Получите монетки за просмотр рекламы";

const adOffID = 1;
const adOffTitle = "Отключить рекламу";
const adOffPrice = "1\$";
const adOffHelp = "Монетки не будут тратиться на просмотр обучалок, но чтобы открыть все обучалки, придется посмотреть реклмные ролики";

const adOffAndOpenAllID = 2;
const adOffAndOpenAllTitle = "Отключить рекламу +";
const adOffAndOpenAllPrice = "2\$";
const adOffAndOpenAllHelp = "Монетки больше не расходуются и все обучалки становятся доступны";

const adOffAndOpenAllPlusID = 3;
const adOffAndOpenAllPlusTitle = "Отключить рекламу ++";
const adOffAndOpenAllPlusPrice = "4\$";
const adOffAndOpenAllPlusHelp = "Монетки больше не расходуются, все обучалки становятся доступны + кофе автору программы";