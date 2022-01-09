import 'dart:async';
import 'dart:convert';

import '../../../services/settings.dart';
import '../../modules/login/s_login.dart';
import 'domain/login_api.dart';
import 'models/user_mode_iu.dart';
import 'models/user_model.dart';
import 'p_login.dart';

class LoginInteractor with BaseInteractor<UserModelUI> {
  late final LoginPState _state;
  late final LoginApi _api;
  UserModel _model = const UserModel();

  LoginInteractor(this._state) {
    _init();
  }
  Future<void> _init() async {
    _api = LoginApi();
    _updateUI();
  }

  void setEmail(String value) {
    _model = _model.copyWith(email: value);
    _updateUI();
  }

  void setName(String value) {
    _model = _model.copyWith(name: value);
    _updateUI();
  }

  Future<void> signInWithEmail() async {
    sinkLoading.add(true);

    try {
      if (_model.email != null) {
        AppPreference.token = 'token';
        AppPreference.user = _model;

        final _sUser = jsonEncode(AppPreference.user.toJson());
        await AppPreferences.setString(AppPreferencesString.token, AppPreference.token);
        await AppPreferences.setString(AppPreferencesString.user, _sUser);
        await AppPreferences.setBool(AppPreferencesBool.isLogin, true);
        _deps?.onLoginConfirm();
      } else {
        _state.showErrorMessage('_model.email != null'.toString());
      }
      _updateUI();
    } catch (e) {
      _state.showError(e);
    }
    sinkLoading.add(false);
  }

  void _updateUI() {
    sink.add(_mapToUI());
  }

  UserModelUI _mapToUI() {
    return _model.toUI();
  }

  LoginListener? get _deps => _state.context.findAncestorStateOfType<LoginListener>();
}
