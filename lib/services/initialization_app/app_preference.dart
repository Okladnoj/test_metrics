import 'dart:convert';

import 'package:test_metrics/modules/login/models/user_model.dart';

import '../settings.dart';

class AppPreference {
  static bool isIntoApp = false;
  static String token = '';
  static UserModel user = const UserModel();
  static const baseUrl = 'https://google.com/api/';
  static const shakeClientID = 'HZbVu8jnBgStR4GXqO7BuzU532tYqlfjFQqSjnjH';
  static const shakeClientSecret = 'vp7tL3mAF6fALczVcXroyGzIWA7oUTOX83bGw9Qd2N1eP75f857HM9P';
  static Future<void> init() async {
    await _getLoginStatus();
    await _getUser();
    await _getToken();
  }

  static Future<void> _getLoginStatus() async {
    final themeString = await AppPreferences.getBool(AppPreferencesBool.isLogin);
    if (themeString != null) {
      isIntoApp = themeString;
    } else {
      isIntoApp = false;
      AppPreferences.setBool(AppPreferencesBool.isLogin, isIntoApp);
    }
  }

  static Future<void> _getToken() async {
    final themeString = await AppPreferences.getString(AppPreferencesString.token);
    if (themeString != null) {
      token = themeString;
    } else {
      isIntoApp = false;
      AppPreferences.setBool(AppPreferencesBool.isLogin, isIntoApp);
    }
  }

  static Future<void> _getUser() async {
    if (isIntoApp) {
      final _sUser = await AppPreferences.getString(AppPreferencesString.user) ?? '{}';
      final json = jsonDecode(_sUser) as Map<String, dynamic>;
      user = UserModel.fromJson(json);
    }
  }

  static Future<void> logout() async {
    isIntoApp = false;
    AppPreferences.setBool(AppPreferencesBool.isLogin, isIntoApp);
  }
}
