import 'package:flutter/material.dart';

extension ThemeDataM2Compat on ThemeData {
  Color get accentColor => colorScheme.secondary;
  Color get backgroundColor => colorScheme.background;
}

extension TextThemeM2Compat on TextTheme {
  TextStyle get headline4 => headlineMedium ?? titleLarge ?? const TextStyle(fontSize: 28);
  TextStyle get headline5 => headlineSmall ?? titleLarge ?? const TextStyle(fontSize: 24);
  TextStyle get headline6 => titleLarge ?? headlineSmall ?? const TextStyle(fontSize: 20);
  TextStyle get headline3 => displaySmall ?? headlineLarge ?? const TextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  TextStyle get subtitle1 => titleMedium ?? bodyLarge ?? const TextStyle(fontSize: 16);
  TextStyle get subtitle2 => titleSmall ?? bodyMedium ?? const TextStyle(fontSize: 14);
  TextStyle get bodyText1 => bodyLarge ?? const TextStyle(fontSize: 16);
  TextStyle get bodyText2 => bodyMedium ?? const TextStyle(fontSize: 14);
  TextStyle get button => labelLarge ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
}
