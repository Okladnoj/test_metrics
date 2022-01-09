import 'package:test_metrics/services/settings.dart';

import 'domain/screen_three_api.dart';
import 'models/screen_three_model.dart';
import 'models/screen_three_model_ui.dart';
import 'p_screen_three.dart';
import 's_screen_three.dart';

class ScreenThreeInteractor with BaseInteractor<ScreenThreeModelUI> {
  late final ScreenThreePState _state;
  late final ScreenThreeApi _api = ScreenThreeApi();
  ScreenThreeModelResponse _model = const ScreenThreeModelResponse();

  ScreenThreeInteractor(this._state) {
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.getScreenThree();
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

  ScreenThreeModelUI _mapToUI() => ScreenThreeModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  ScreenThreeListener? get _deps => _state.context.findAncestorStateOfType<ScreenThreeListener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
