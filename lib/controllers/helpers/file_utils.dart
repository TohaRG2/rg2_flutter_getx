

String getAssetFilePath(String iconName, String curPhase) {
  String path;
  if (iconName.endsWith(".svg") || iconName.endsWith(".png")) {
    path = iconName;
  } else {
    path = "assets/images/${curPhase.toLowerCase()}/$iconName.svg";
  }
  return path;
}