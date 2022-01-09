import 'package:test_metrics/services/settings.dart';

import 'domain/screen_for_api.dart';
import 'models/screen_for_model.dart';
import 'models/screen_for_model_ui.dart';
import 'p_screen_for.dart';
import 's_screen_for.dart';

class ScreenForInteractor with BaseInteractor<ScreenForModelUI> {
  late final ScreenForPState _state;
  late final ScreenForApi _api = ScreenForApi();
  ScreenForModelResponse _model = const ScreenForModelResponse();

  ScreenForInteractor(this._state) {
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.getScreenFor();
    if (result != null) {
      _model = result;
    }
  }

  Future<void> onSomeMethod() async {
    await _deps?.onSomeMethod();
  }

  void _updateUI() {
    sink.add(_mapToUI());
  }

  ScreenForModelUI _mapToUI() => ScreenForModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  ScreenForListener? get _deps => _state.context.findAncestorStateOfType<ScreenForListener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
