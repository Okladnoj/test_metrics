import 'package:test_metrics/services/settings.dart';

import 'domain/home_api.dart';
import 'models/home_model.dart';
import 'models/home_model_ui.dart';
import 'p_home.dart';
import 's_home.dart';

class HomeInteractor with BaseInteractor<HomeModelUI> {
  late final HomePState _state;
  late final HomeApi _api = HomeApi();
  HomeModelResponse _model = const HomeModelResponse();

  HomeInteractor(this._state) {
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    // await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.getHome();
    if (result != null) {
      _model = result;
    }
  }

  Future<void> onScreenOne() async {
    await _deps?.onScreenOne();
  }

  Future<void> onScreenTwo() async {
    await _deps?.onScreenTwo();
  }

  Future<void> onScreenThree() async {
    await _deps?.onScreenThree();
  }

  Future<void> onScreenFor() async {
    await _deps?.onScreenFor();
  }

  void _updateUI() {
    sink.add(_mapToUI());
  }

  HomeModelUI _mapToUI() => HomeModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  HomeListener? get _deps => _state.context.findAncestorStateOfType<HomeListener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
