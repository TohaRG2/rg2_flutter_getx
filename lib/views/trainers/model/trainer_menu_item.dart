class TrainerMenuItem {

  final String id;
  final String title;
  final String icon;
  final String helpItem;

  const TrainerMenuItem({required this.id, required this.title, required this.icon, required this.helpItem});


  ///
  /// Если имя файла в icon начинается с assets, то считаем, что оно задано полностью
  /// иначе добавляем к нему путь и расширение
  ///
  String getAssetFilePath() {
    if (icon.startsWith("assets/")) {
      return icon;
    } else {
      return "assets/images/trainers/$icon.png";
    }
  }

  ///
  /// Путь к иконке со знаком вопроса (ic_help)
  ///
  String getIcHelpPath() => "assets/images/trainers/ic_help.png";

  ///
  /// Путь к иконке со знаком настроек (ic_settings)
  ///
  String getIcSettingsPath() => "assets/images/trainers/ic_settings.png";

  @override
  String toString() {
    return "($id, $title, $icon)";
  }

}
