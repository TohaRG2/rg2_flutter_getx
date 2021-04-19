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
const adOffTitle = "Отключить расход монеток";
const adOffPrice = "1\$";
const adOffHelp = "Монетки не будут тратиться на просмотр обучалок, но чтобы открыть все обучалки, придется их поднакопить и посмотреть рекламные ролики";

const adOffAndOpenAllID = 2;
const adOffAndOpenAllTitle = "Отключить рекламу +";
const adOffAndOpenAllPrice = "2\$";
const adOffAndOpenAllHelp = "Неограниченный запас монеток и все обучалки становятся доступны";

const adOffAndOpenAllPlusID = 3;
const adOffAndOpenAllPlusTitle = "Отключить рекламу ++";
const adOffAndOpenAllPlusPrice = "4\$";
const adOffAndOpenAllPlusHelp = "Неограниченный запас монеток, все обучалки становятся доступны + кофе автору программы";