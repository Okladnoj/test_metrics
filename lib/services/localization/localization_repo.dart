import 'dart:async';

import '../settings.dart';

import 'app_localization.dart';
import 'local_storage.dart';

class LocaleRepository {
  final _streamController = StreamController<String>.broadcast();

  LocaleRepository._internal();

  LocalStorage? _storage;

  String? _locale;

  Stream<String> observeLocale() {
    loadLocale().then((v) => _streamController.add(v)).catchError((e) => _streamController.addError(e as Object));
    return _streamController.stream;
  }

  Future<String> loadLocale() async {
    final storage = await _getStorage();
    _locale = _locale ?? storage.read(_fieldLocale) ?? LocalStorage.defaultLocale;
    return _locale ?? LocalStorage.defaultLocale;
  }

  Future<void> saveLocale(String languageCode) async {
    final storage = await _getStorage();
    await storage.write(_fieldLocale, languageCode);
    await Strings.loadFromLocal(Locale(languageCode));
    _locale = languageCode;
    _streamController.add(_locale ?? LocalStorage.defaultLocale);
  }

  Future<LocalStorage> _getStorage() async {
    _storage = _storage ?? await LocalStorage.getStorage();
    return _storage ?? await LocalStorage.getStorage();
  }

  static const String _fieldLocale = 'locale';

  static final LocaleRepository _singleton = LocaleRepository._internal();

  static LocaleRepository get instance => _singleton;
}
