import 'package:test_metrics/modules/app/item/s_item.dart';
import 'package:test_metrics/services/settings.dart';

import 'domain/screen_two_api.dart';
import 'models/screen_two_model.dart';
import 'models/screen_two_model_ui.dart';
import 'p_screen_two.dart';
import 's_screen_two.dart';

class ScreenTwoInteractor with BaseInteractor<ScreenTwoModelUI> {
  late final ScreenTwoPState _state;
  late final ScreenTwoApi _api = ScreenTwoApi();
  ScreenTwoModelResponse _model = const ScreenTwoModelResponse();

  ScreenTwoInteractor(this._state) {
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    // await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.getScreenTwo();
    if (result != null) {
      _model = result;
    }
  }

  Future<void> onSomeMethod() async {
    await _deps?.onSomeMethod();
  }

  Future<void> onOpenItem(String nameItem, Color color) async {
    await _depsItem?.onOpenItem(nameItem, color);
  }

  void _updateUI() {
    sink.add(_mapToUI());
  }

  ScreenTwoModelUI _mapToUI() => ScreenTwoModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  ScreenTwoListener? get _deps => _state.context.findAncestorStateOfType<ScreenTwoListener>();

  ItemListener? get _depsItem => _state.context.findAncestorStateOfType<ItemListener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
