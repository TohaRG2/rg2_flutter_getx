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

  /// Список названий PLL алгоритмов и их настроек (может ли быть загадан)
  final RxList<PllTrainerItem> _pllTrainerItems = List<PllTrainerItem>().obs;
  List<PllTrainerItem> get pllTrainerItems => _pllTrainerItems;
  set pllTrainerItems(value) {
    _pllTrainerItems.assignAll(value);
  }

  /// Случайны цвет передней грани. Если false, то передняя грань всегда красная
  final _randomFrontSide = false.obs;
  bool get randomFrontSide => _randomFrontSide.value;
  set randomFrontSide(value) {
    _randomFrontSide.value = value;
    GetStorage().write(Const.RANDOM_FRONT_SIDE, value);
  }

  /// Случайная сторона PLL ситуации. Если false, то ситуации будет показана с "хорошей" стороны
  final _randomAUF = false.obs;
  bool get randomAUF => _randomAUF.value;
  set randomAUF(value) {
    _randomAUF.value = value;
    GetStorage().write(Const.RANDOM_AUF, value);
  }

  /// Определение ситуации по двум сторонам = true или по трем = false
  final _twoSideRecognition = false.obs;
  bool get twoSideRecognition => _twoSideRecognition.value;
  set twoSideRecognition(value) {
    _twoSideRecognition.value = value;
    GetStorage().write(Const.TWO_SIDE_RECOGNITION, value);
  }

  /// Будет ли ограничено время для ответа или нет
  final _isTimerEnabled = true.obs;
  bool get isTimerEnabled => _isTimerEnabled.value;
  set isTimerEnabled(value) {
    _isTimerEnabled.value = value;
    GetStorage().write(Const.IS_PLL_TIMER_ENABLED, value);
  }

  /// Время для ответа на вопрос (если включена _isTimerEnabled)
  final _timeForAnswer = 6.obs;
  int get timeForAnswer => isTimerEnabled ? _timeForAnswer.value : 0;
  set timeForAnswer(value) {
    _timeForAnswer.value = value;
    GetStorage().write(Const.PLL_TIME_FOR_ANSWER, value);
  }

  /// Показываем все варианты (21 кнопку) или ограниченное количество с кастомными ответами
  final _showAllVariants = true.obs;
  bool get showAllVariants => _showAllVariants.value;
  set showAllVariants(value) {
    _showAllVariants.value = value;
    GetStorage().write(Const.PLL_SHOW_ALL_VARIANTS, value);
  }

  /// Количество вариантов для ответа, если выбран режим "отображать не 21 кнопку"
  final _variantsCount = 6.obs;
  int get variantsCount => _variantsCount.value;
  set variantsCount(value) {
    _variantsCount.value = value;
    GetStorage().write(Const.PLL_VARIANTS_COUNT, value);
  }


  /// Время автонажатия кнопки далее при успешном ответе
  final _goodAnswerWaiting = 1.obs;
  int get goodAnswerWaiting => _goodAnswerWaiting.value;
  set goodAnswerWaiting(value) {
    _goodAnswerWaiting.value = value;
    GetStorage().write(Const.AZBUKA_GOOD_ANSWER_WAITING, value);
  }

  /// Время автонажатия кнопки далее при неуспешном ответе
  final _badAnswerWaiting = 5.obs;
  int get badAnswerWaiting => _badAnswerWaiting.value;
  set badAnswerWaiting(value) {
    _badAnswerWaiting.value = value;
    GetStorage().write(Const.AZBUKA_BAD_ANSWER_WAITING, value);
  }


  /// Методы

  /// Уменьшить время ожидания ответа
  decreaseTimerTime() {
    if (timeForAnswer > 1) {
      timeForAnswer--;
    }
  }

  /// Увеличить время ожидания ответа
  increaseTimerTime() {
    if (timeForAnswer < 30) {
      timeForAnswer++;
    }
  }

  /// Установить время ожидания ответа по-умолчанию
  resetTimerTime() {
    timeForAnswer = 6;
  }

  /// Увеличить количество кастомных вариантов ответа
  increaseVariantsCount() {
    if (variantsCount < 8) {
      variantsCount += 2;
    }
  }

  /// Уменьшить количество кастомных вариантов ответа
  decreaseVariantsCount() {
    if (variantsCount > 2) {
      variantsCount -= 2;
    }
  }


  ///Уменьшаем время автонажатия кнопки далее при успешном ответе
  decreaseGoodAnswerWaiting() {
    if (goodAnswerWaiting > 0) {
      goodAnswerWaiting--;
    }
  }

  ///Увеличиваем время автонажатия кнопки далее при успешном ответе
  increaseGoodAnswerWaiting() {
    if (goodAnswerWaiting < 11) {
      goodAnswerWaiting++;
    }
  }

  ///Сбрасываем время автонажатия кнопки далее при успешном ответе на 2 сек
  resetGoodAnswerWaiting() {
    goodAnswerWaiting = 1;
  }


  ///Уменьшаем время автонажатия кнопки далее при неуспешном ответе
  decreaseBadAnswerWaiting() {
    if (badAnswerWaiting > 0) {
      badAnswerWaiting--;
    }
  }

  ///Увеличиваем время автонажатия кнопки далее при неуспешном ответе
  increaseBadAnswerWaiting() {
    if (badAnswerWaiting < 11) {
      badAnswerWaiting++;
    }
  }

  ///Сбрасываем время автонажатия кнопки далее при неуспешном ответе на 5 сек
  resetBadAnswerWaiting() {
    badAnswerWaiting = 5;
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