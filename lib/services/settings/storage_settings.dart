import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<SharedPreferences> get _p => SharedPreferences.getInstance();

  static Future<bool?> getBool(AppPreferencesBool key) async {
    final value = (await _p).getBool(key.toString());
    return value;
  }

  static Future<bool> setBool(AppPreferencesBool key, bool value) async {
    return (await _p).setBool(key.toString(), value);
  }

  static Future<int?> getInt(AppPreferencesInt key) async {
    final value = (await _p).getInt(key.toString());
    return value;
  }

  static Future<bool> setInt(AppPreferencesInt key, int value) async {
    return (await _p).setInt(key.toString(), value);
  }

  static Future<double?> getDouble(AppPreferencesDouble key) async {
    final value = (await _p).getDouble(key.toString());
    return value;
  }

  static Future<bool> setDouble(AppPreferencesDouble key, double value) async {
    return (await _p).setDouble(key.toString(), value);
  }

  static Future<String?> getString(AppPreferencesString key) async {
    final value = (await _p).getString(key.toString());
    return value;
  }

  static Future<bool> setString(AppPreferencesString key, String value) async {
    return (await _p).setString(key.toString(), value);
  }
}

enum AppPreferencesBool {
  isLogin,
}

enum AppPreferencesInt {
  indexOfOpenTab,
}

enum AppPreferencesDouble {
  offsetScrollAllStationsList,
  offsetScrollAllStationsGrid,
}

enum AppPreferencesString {
  someString,
  theme,
  token,
  user,
}
