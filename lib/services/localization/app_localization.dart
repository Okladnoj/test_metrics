import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../settings.dart';
import 'local_storage.dart';

class Strings {
  static Locale locale = Locale(LocalStorage.defaultLocale);

  Strings();

  static Strings text = Strings();

  String get inputEmail => _getText('inputEmail');
  String get input => _getText('input');
  String get singInGoogle => _getText('singInGoogle');
  String get login => _getText('login');
  String get settings => _getText('settings');
  String get english => _getText('english');
  String get russian => _getText('russian');
  String get nA => _getText('nA');
  String get notPhone => _getText('notPhone');
  String get notEmail => _getText('notEmail');
  String get homePage => _getText('homePage');
  String get workout => _getText('workout');
  String get gravityEarth => _getText('gravityEarth');
  String get gravityPhone => _getText('gravityPhone');
  String get stopSpeed => _getText('stopSpeed');
  String get walkSpeed => _getText('walkSpeed');
  String get runSpeed => _getText('runSpeed');
  String get flySpeed => _getText('flySpeed');
  String get age => _getText('age');
  String get m => _getText('m');
  String get sm => _getText('sm');
  String get mm => _getText('mm');
  String get mShort => _getText('mShort');
  String get smShort => _getText('smShort');
  String get mmShort => _getText('mmShort');
  String get kg => _getText('kg');
  String get gr => _getText('gr');
  String get kgShort => _getText('kgShort');
  String get grShort => _getText('grShort');
  String get phoneTitle => _getText('phoneTitle');
  String get phoneHint => _getText('phoneHint');
  String get nameTitle => _getText('nameTitle');
  String get avatarTitle => _getText('avatarTitle');
  String get nameHint => _getText('nameHint');
  String get updateProfile => _getText('updateProfile');
  String get weightTitle => _getText('weightTitle');
  String get heightTitle => _getText('heightTitle');
  String get profileSetting => _getText('profileSetting');
  String get people => _getText('people');
  String get peopleRequest => _getText('peopleRequest');
  String get all => _getText('all');
  String get friend => _getText('friend');
  String get subscribe => _getText('subscribe');
  String get blackList => _getText('blackList');
  String get peopleEmpty => _getText('peopleEmpty');
  String get emptyList => _getText('emptyList');
  String get privateAll => _getText('privateAll');
  String get privateFriend => _getText('privateFriend');
  String get privateSubscribe => _getText('privateSubscribe');
  String get privateNone => _getText('privateNone');
  String get administration => _getText('administration');
  String get emailTitle => _getText('emailTitle');

  String get emptyString => _getText('emptyString');

  String _getText(String code) => _dictionary[code] ?? ':$code:';

  static Map<String, String?> _dictionary = {};

  static Set<LangModel> languages = {
    LangModel('English', 'en'),
    LangModel('Русский', 'ru'),
  };

  static Future<void> loadFromLocal(Locale l) async {
    try {
      locale = l;
      final String string = await rootBundle.loadString("lib/services/localization/langs/${locale.languageCode}.json");
      _dictionary = (json.decode(string) as Map<String, dynamic>).cast();
    } catch (e) {
      print(e);
    }
  }
}

class LangModel {
  final String name;
  final String code;

  LangModel(
    this.name,
    this.code,
  );
  @override
  bool operator ==(dynamic other) => other is LangModel && other.code == code;

  @override
  int get hashCode => code.hashCode;
}
