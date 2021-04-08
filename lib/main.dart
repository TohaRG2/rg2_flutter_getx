import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:rg2/controllers/repository/main_repository.dart';
import 'package:rg2/controllers/storage/global_storage_controller.dart';
import 'package:rg2/controllers/repository/timer_repository.dart';
import 'package:rg2/utils/my_logger.dart';
import 'package:rg2/views/dialogs/azbuka/azbuka_dialog_controller.dart';
import 'package:rg2/controllers/helpers/binding_controllers.dart';
import 'package:rg2/views/learn/detail/controller/learn_detail_controller.dart';
import 'package:rg2/views/trainers/controller/trainers_controller.dart';
import 'package:rg2/views/youtube_player/controller/youtube_controller.dart';
import 'package:rg2/views/auth/main_auth_view.dart';
import 'package:rg2/views/favourites/controller/favourite_controller.dart';
import 'package:rg2/views/favourites/dialog/favourite_dialog.dart';
import 'package:rg2/views/trainers/azbuka_trainer/controller/azbuka_settings_controller.dart';
import 'package:rg2/views/trainers/azbuka_trainer/controller/azbuka_trainer_controller.dart';
import 'package:rg2/views/trainers/pll/controller/pll_settings_controller.dart';
import 'package:rg2/views/trainers/pll/controller/pll_trainer_controller.dart';
import 'package:rg2/views/trainers/scramble_gen/controller/trainers_scramble_gen_controller.dart';
import 'package:rg2/views/trainers/timer/controller/result_view_controller.dart';
import 'package:rg2/views/trainers/timer/controller/timer_settings_controller.dart';
import 'controllers/db_controller.dart';
import 'views/info/controller/info_controller.dart';
import 'views/learn/controller/learn_controller.dart';
import 'controllers/repository/repository.dart';
import 'views/settings/controller/settings_controller.dart';
import 'package:rg2/views/trainers/timer/controller/timer_controller.dart';
import 'database/main_database.dart';
import 'views/main_view.dart';
import 'views/youtube_player/youtube_view.dart';
import 'package:flutter/services.dart' ;
import 'package:firebase_core/firebase_core.dart';


void main() async {
  // Для работы байндинга
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализируем FireBase, нужен import 'package:firebase_core/firebase_core.dart';
  await Firebase.initializeApp();
  // Инициализируем SharedPreferences
  await GetStorage.init();
  // Инициализируем внутренние покупки
  InAppPurchaseConnection.enablePendingPurchases();
  runApp(RG2App());
}

// https://github.com/afterlogic/aurora-files-app-flutter.git - moor + getX
// https://github.com/Psunu/HabitCalendar.git - moor + getX obs
// https://github.com/Rubywai/flutter_floor_example.git - floor + get
// https://github.com/Junaidhassan99/todo_app.git

class RG2App extends StatelessWidget {
  final dbFuture = Get.put(DBController()).fillDB();
  final GlobalStorageController _storageController = Get.put(GlobalStorageController());
  final SettingsController _settings = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    // Зафиксируем ориентацию экрана в портретном режиме
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    return GetMaterialApp(
        title: 'RG2',
        theme: _settings.getCurrentTheme(),
        getPages: [
          GetPage(name: '/', page: () => MainView(), transition: Transition.leftToRight),
          GetPage(name: '/youtube', page: () => YouTubeView(), transition: Transition.leftToRight),
          GetPage(name: '/favourite', page: () => FavouriteDialog(), transition: Transition.upToDown),
        ],
        debugShowCheckedModeBanner: false,
        // home: SettingsScreen(),
        // initialBinding: BindingControllers(),
        //TODO Перенести FutureBuilder создания базы при первом входе в фон аутентификации
        home: FutureBuilder<MainDatabase>(
            future: dbFuture,
            builder: (context, data) {
              logPrint("FutureBuilder rebuild");
              if (data.hasData) {
                logPrint("DBController.fillDB отработал");
                putDAOs(data.data);
                return MainAuthView();
              } else if (data.hasError) {
                return Center(child: Text("Can't create or open database"));
              } else
                return Center(child: CircularProgressIndicator());
            }),
        routes: {},
        builder: (context, child) {
          return Obx(
                () => MediaQuery(
              child: child,
              //TODO поменять на Get.MediaQuery
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: _settings.textScaleFactor),
            ),
          );
        });
  }

  void putDAOs(MainDatabase db) {
    logPrint("putDAOs & put controllers");
    Get.put(db.mainDao);
    Get.put(db.pagePropertiesDao);
    Get.put(db.movesDao);
    Get.put(db.phasePositionDao);
    Get.put(db.timesDao);
    Get.put(db.pllTrainerDao);
    logPrint("InitControllers in main.dart");
    Get.put(Repository());
    Get.put(MainRepository());
    Get.put(TimerRepository());
    Get.put(FavouriteController());
    Get.put(LearnController());
    Get.put(InfoController());
    Get.put(LearnDetailController());
    //Get.lazyPut(() => MyYouTubeController());
    Get.put(AzbukaDialogController());
    Get.put(TrainersController());
    
    //TODO подумать, куда перенести, или оставить тут через Lazy
    Get.put(ScrambleGenController());
    Get.put(TimerSettingsController());
    Get.put(TimerController());
    Get.put(ResultViewController());
    Get.put(PllSettingsController());
    Get.put(PllTrainerController());
    Get.put(AzbukaSettingsController());
    Get.put(AzbukaTrainerController());
  }
}

