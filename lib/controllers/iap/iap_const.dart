//------------------- Константы (списки продуктов) ----------------------------

/// Полный список продуктов (используем объединение через ...) https://stackoverflow.com/questions/21826342/how-do-i-combine-two-lists-in-dart
const Set<String> allRg2Products = {
  ...oldRg2Products,
  ...newRg2Products
};

/// Список продуктов для старого андроид приложения (котлин версии)
const Set<String> oldRg2Products = {
  SMALL_DONATION,
  MEDIUM_DONATION,
  BIG_DONATION,
  VERY_BIG_DONATION,
};

/// Список продуктов доступных для покупки во флаттер версии RG2
const Set<String> newRg2Products = {
  ...adsRemoveProducts,
  ...openAllProducts
};

const Set<String> adsRemoveProducts = {
  G_AD_OFF,
  IOS_AD_OFF,
};

const Set<String> openAllProducts = {
  G_OPEN_ALL,
  IOS_OPEN_ALL,
};

const SMALL_DONATION = 'small_donation';
const MEDIUM_DONATION = 'medium_donation';
const BIG_DONATION = 'big_donation';
const VERY_BIG_DONATION = 'very_big_donation';

const G_AD_OFF = 'g_ads_remove';
const G_OPEN_ALL = 'g_open_all_puzzles';
const IOS_AD_OFF = 'ios_ads_remove';
const IOS_OPEN_ALL = 'ios_open_all_puzzles2';

const G_AD_OFF_AND_OPEN_ALL = 'g_ad_off_and_open_all';
const G_AD_OFF_AND_OPEN_ALL_PLUS = 'g_ad_off_and_open_all_plus_coffee';