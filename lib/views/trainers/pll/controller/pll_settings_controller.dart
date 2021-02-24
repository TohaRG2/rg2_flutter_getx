import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/database/entitys/pll_trainer_item.dart';
import 'package:rg2_flutter_getx/res/constants.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_variant.dart';

class PllSettingsController extends GetxController {
  final Repository _repository = Get.find();

  @override
  void onInit() {
    print("PllSettingsController init");
    _randomFrontSide.value = GetStorage().read(Const.RANDOM_FRONT_SIDE) ?? false;
    _randomAUF.value = GetStorage().read(Const.RANDOM_AUF) ?? false;
    _twoSideRecognition.value = GetStorage().read(Const.TWO_SIDE_RECOGNITION) ?? false;
    _isTimerEnabled.value = GetStorage().read(Const.IS_PLL_TIMER_ENABLED) ?? false;
    _timeForAnswer.value = GetStorage().read(Const.PLL_TIME_FOR_ANSWER) ?? 6;
    _showAllVariants.value = GetStorage().read(Const.PLL_SHOW_ALL_VARIANTS) ?? true;
    _variantsCount.value = GetStorage().read(Const.PLL_VARIANTS_COUNT) ?? 6;
    super.onInit();
  }

  final RxList<PllTrainerItem> _pllTrainerItems = List<PllTrainerItem>().obs;
  List<PllTrainerItem> get pllTrainerItems => _pllTrainerItems;
  set pllTrainerItems(value) {
    _pllTrainerItems.assignAll(value);
  }

  final _randomFrontSide = false.obs;
  bool get randomFrontSide => _randomFrontSide.value;
  set randomFrontSide(value) {
    _randomFrontSide.value = value;
    GetStorage().write(Const.RANDOM_FRONT_SIDE, value);
  }

  final _randomAUF = false.obs;
  bool get randomAUF => _randomAUF.value;
  set randomAUF(value) {
    _randomAUF.value = value;
    GetStorage().write(Const.RANDOM_AUF, value);
  }

  final _twoSideRecognition = false.obs;
  bool get twoSideRecognition => _twoSideRecognition.value;
  set twoSideRecognition(value) {
    _twoSideRecognition.value = value;
    GetStorage().write(Const.TWO_SIDE_RECOGNITION, value);
  }

  final _isTimerEnabled = true.obs;
  bool get isTimerEnabled => _isTimerEnabled.value;
  set isTimerEnabled(value) {
    _isTimerEnabled.value = value;
    GetStorage().write(Const.IS_PLL_TIMER_ENABLED, value);
  }

  final _timeForAnswer = 6.obs;
  int get timeForAnswer => isTimerEnabled ? _timeForAnswer.value : 0;
  set timeForAnswer(value) {
    _timeForAnswer.value = value;
    GetStorage().write(Const.PLL_TIME_FOR_ANSWER, value);
  }

  final _showAllVariants = true.obs;
  bool get showAllVariants => _showAllVariants.value;
  set showAllVariants(value) {
    _showAllVariants.value = value;
    GetStorage().write(Const.PLL_SHOW_ALL_VARIANTS, value);
  }

  final _variantsCount = 6.obs;
  int get variantsCount => _variantsCount.value;
  set variantsCount(value) {
    _variantsCount.value = value;
    GetStorage().write(Const.PLL_VARIANTS_COUNT, value);
  }

  /// Методы

  decreaseTimerTime() {
    if (timeForAnswer > 1) {
      timeForAnswer--;
    }
  }

  increaseTimerTime() {
    if (timeForAnswer < 30) {
      timeForAnswer++;
    }
  }

  resetTimerTime() {
    timeForAnswer = 6;
  }

  increaseVariantsCount() {
    if (variantsCount < 8) {
      variantsCount += 2;
    }
  }

  decreaseVariantsCount() {
    if (variantsCount > 2) {
      variantsCount -= 2;
    }
  }

  /// Для выбора алгоритмов

  /// Загрузка данных по алгоритмам из базы
  loadPllTrainerItems() async {
    pllTrainerItems = await _repository.getAllPllTrainer();
  }


  /// Обновляем запись алгоритма
  updatePllTrainerItem(PllTrainerItem item) {
    //если снимаем галочку выбора, то делаем проверку, чтобы осталось не менее трех активных алгоритмов
    var checkedBalance = pllTrainerItems.where((element) => element.isChecked).toList().length;
    if (item.isChecked || checkedBalance >= 3) {
      // чтобы обновить obs и перерисовался экран
      pllTrainerItems[item.id] = item;
      _repository.updatePllTrainerItem(item);
    } else {
      // т.к. item.isChecked по ссылке = pllTrainerItems[item.id].isChecked, то восстанавливаем значение на true
      pllTrainerItems[item.id].isChecked = true;
    }
  }

  /// Устанавливаем текущими только международные названия
  selectInternationalNames() {
    pllTrainerItems = pllTrainerItems.map((item) {
      item.currentName = item.internationalName;
      return item;
    }).toList();
    _repository.updatePllTrainerItems(pllTrainerItems);
  }

  /// Устанавливаем текущими только Максимкины названия
  selectMaximNames() {
    pllTrainerItems = pllTrainerItems.map((item) {
      item.currentName = item.maximName;
      return item;
    }).toList();
    _repository.updatePllTrainerItems(pllTrainerItems);
  }

  /// Устанавливаем текущими сохраненные названия
  selectCustomNames() {
    pllTrainerItems = pllTrainerItems.map((item) {
      item.currentName = item.customName;
      return item;
    }).toList();
    _repository.updatePllTrainerItems(pllTrainerItems);
  }

  /// Сохраняем текущие в кастомные
  saveCurrentNames() {
    pllTrainerItems = pllTrainerItems.map((item) {
      item.customName = item.currentName;
      return item;
    }).toList();
    _repository.updatePllTrainerItems(pllTrainerItems);
  }

  /// Обновляем текущее название для алгоритма
  updateCurrentText(PllTrainerItem item, String newText) {
    item.currentName = newText;
    pllTrainerItems[item.id] = item;
    _repository.updatePllTrainerItem(item);
  }

  /// Возвращает список текущих вариантов для игры (Номер, Текст, Возможность выбора варианта для загадывания)
  List<QuizVariant> get _quizVariants => pllTrainerItems.map((pllTrainerItem) =>
      QuizVariant(pllTrainerItem.id, pllTrainerItem.currentName, pllTrainerItem.isChecked)
  ).toList();

  /// Возвращает список международных вариантов для игры (Номер, Текст, Возможность выбора варианта для загадывания)
  List<QuizVariant> get _internationalQuizVariants => pllTrainerItems.map((pllTrainerItem) =>
      QuizVariant(pllTrainerItem.id, pllTrainerItem.internationalName, pllTrainerItem.isChecked)
  ).toList();

  /// Возвращаем список вариантов в зависимости от настройки
  List<QuizVariant> getVariants() => showAllVariants ? _internationalQuizVariants : _quizVariants;

}