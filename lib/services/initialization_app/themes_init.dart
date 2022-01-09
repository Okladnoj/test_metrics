import '../settings.dart';

class ThemesInit {
  static late AppTheme type;
  static Future<void> init() async {
    final themeString = await AppPreferences.getString(AppPreferencesString.theme);
    if (themeString != null) {
      type = AppTheme.values.firstWhere((e) => '$e' == themeString);
    } else {
      type = AppTheme.dark;
      AppPreferences.setString(AppPreferencesString.theme, type.toString());
    }
  }
}

enum AppTheme {
  dark,
  light,
}
