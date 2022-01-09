import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences _pref;
  static final defaultLocale = window.locale.languageCode;

  LocalStorage(SharedPreferences pref) : _pref = pref;

  Future<bool> write(String key, String value) {
    return _pref.setString(key, value);
  }

  String? read(String key) {
    return _pref.getString(key);
  }

  void remove(String key) {
    _pref.remove(key);
  }

  Future<bool> writeInt(String key, int value) {
    return _pref.setInt(key, value);
  }

  int? readInt(String key) {
    return _pref.getInt(key);
  }

  static Future<LocalStorage> getStorage() async {
    return LocalStorage(await SharedPreferences.getInstance());
  }
}
