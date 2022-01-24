import 'package:test_metrics/services/settings.dart';

import 'domain/screen_one_api.dart';
import 'models/screen_one_model.dart';
import 'models/screen_one_model_ui.dart';
import 'p_screen_one.dart';
import 's_screen_one.dart';

class ScreenOneInteractor with BaseInteractor<ScreenOneModelUI> {
  late final ScreenOnePState _state;
  late final ScreenOneApi _api = ScreenOneApi();
  ScreenOneModelResponse _model = const ScreenOneModelResponse();

  ScreenOneInteractor(this._state) {
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    // await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.getScreenOne();
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

  ScreenOneModelUI _mapToUI() => ScreenOneModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  ScreenOneListener? get _deps => _state.context.findAncestorStateOfType<ScreenOneListener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
