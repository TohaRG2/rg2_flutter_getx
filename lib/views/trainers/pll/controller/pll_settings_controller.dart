import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2_flutter_getx/controllers/repository.dart';
import 'package:rg2_flutter_getx/database/entitys/pll_trainer_item.dart';
import 'package:rg2_flutter_getx/res/constants.dart';
import 'package:rg2_flutter_getx/views/trainers/pll/model/quiz_variant.dart';

class PllSettingsController extends GetxController {
  final Repository _repository = Get.find();

  @override
  void onInit() async {
    print("PllSettingsController init");
    _randomFrontSide.value = GetStorage().read(Const.RANDOM_FRONT_SIDE) ?? false;
    _twoSideRecognition.value = GetStorage().read(Const.TWO_SIDE_RECOGNITION) ?? false;
    _isTimerEnabled.value = GetStorage().read(Const.IS_PLL_TIMER_ENABLED) ?? false;
    _timeForAnswer.value = GetStorage().read(Const.PLL_TIME_FOR_ANSWER) ?? 6;
    _showAllVariants.value = GetStorage().read(Const.PLL_SHOW_ALL_VARIANTS) ?? true;
    _variantsCount.value = GetStorage().read(Const.PLL_VARIANTS_COUNT) ?? 6;
    pllTrainerItems = await _repository.getAllPllTrainer();
    super.onInit();
  }

  final RxList<PllTrainerItem> _pllTrainerItems = List<PllTrainerItem>().obs;
  List<PllTrainerItem> get pllTrainerItems => _pllTrainerItems;
  set pllTrainerItems(value) {
    _pllTrainerItems.assignAll(value);
  }

  List<QuizVariant> get quizVariants => pllTrainerItems.map((pllTrainerItem) =>
      QuizVariant(pllTrainerItem.id, pllTrainerItem.customName, pllTrainerItem.isChecked)
  ).toList();


  final _randomFrontSide = false.obs;
  bool get randomFrontSide => _randomFrontSide.value;
  set randomFrontSide(value) {
    _randomFrontSide.value = value;
    GetStorage().write(Const.RANDOM_FRONT_SIDE, value);
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
  int get timeForAnswer => _timeForAnswer.value;
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



}