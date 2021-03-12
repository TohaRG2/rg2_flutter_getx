import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rg2/controllers/azbuka_dialog_controller.dart';
import 'package:rg2/controllers/learn_detail_controller.dart';
import 'package:rg2/controllers/trainers_controller.dart';
import 'package:rg2/controllers/youtube_controller.dart';
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
import 'controllers/info_controller.dart';
import 'controllers/learn_controller.dart';
import 'controllers/repository.dart';
import 'controllers/settings_controller.dart';
import 'package:rg2/views/trainers/timer/controller/timer_controller.dart';
import 'database/main_database.dart';
import 'views/main_view.dart';
import 'views/youtube_player/youtube_view.dart';
import 'package:flutter/services.dart' ;


void main() async {
  await GetStorage.init();
  runApp(RG2App());
}

// https://github.com/afterlogic/aurora-files-app-flutter.git - moor + getX
// https://github.com/Psunu/HabitCalendar.git - moor + getX obs
// https://github.com/Rubywai/flutter_floor_example.git - floor + get
// https://github.com/Junaidhassan99/todo_app.git

class RG2App extends StatelessWidget {
  final dbFuture = Get.put(DBController()).fillDB();
  final SettingsController _settings = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    // Зафиксируем ориентацию экрана в портретном режиме
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    return GetMaterialApp(
        title: 'RG2',
        theme: _getCurrentTheme(),
        getPages: [
          GetPage(name: '/', page: () => MainViewWithBottomBar()),
          GetPage(name: '/youtube', page: () => YouTubeView()),
          GetPage(name: '/favourite', page: () => FavouriteDialog()),
        ],
        debugShowCheckedModeBanner: false,
        // home: SettingsScreen(),
        home: FutureBuilder<MainDatabase>(
            future: dbFuture,
            builder: (context, data) {
              print("FutureBuilder rebuild");
              if (data.hasData) {
                print("DBController.fillDB отработал");
                putDAOs(data.data);
                return MainViewWithBottomBar();
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
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: _settings.textScaleFactor.value),
            ),
          );
        });
  }

  ThemeData _getCurrentTheme() {
    bool isDark = _settings.isDarkThemeSelect.value;
    Color primaryColor = _settings.primaryThemeColor;
    Color accentColor = _settings.accentThemeColor.value;

    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      accentColor: accentColor,
      toggleableActiveColor: accentColor,
      textTheme: TextTheme().copyWith(
        headline4: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), //DefaultText для Text("")
      ),
    );
  }

  void putDAOs(MainDatabase db) {
    print("putDAOs & put controllers");
    Get.put(db.mainDao);
    Get.put(db.pagePropertiesDao);
    Get.put(db.movesDao);
    Get.put(db.phasePositionDao);
    Get.put(db.timesDao);
    Get.put(db.pllTrainerDao);
    Get.put(Repository());
    Get.put(FavouriteController());
    Get.put(LearnController());
    Get.put(InfoController());
    Get.put(LearnDetailController());
    Get.put(MyYouTubeController());
    Get.put(AzbukaDialogController());
    Get.put(TrainersController());
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
