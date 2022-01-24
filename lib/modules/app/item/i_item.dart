import 'package:test_metrics/services/settings.dart';

import 'domain/item_api.dart';
import 'models/item_model.dart';
import 'models/item_model_ui.dart';
import 'p_item.dart';
import 's_item.dart';

class ItemInteractor with BaseInteractor<ItemModelUI> {
  late final ItemPState _state;
  late final ItemApi _api;
  ItemModelResponse _model = ItemModelResponse.empty();

  ItemInteractor(this._state, ItemApi api) {
    _api = api;
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    // await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.getItem();
    if (result != null) {
      _model = result;
    }
  }

  Future<void> onOpenItem(String nameItem, Color color) async {
    await _deps?.onOpenItem(nameItem, color);
  }

  void _updateUI() {
    sink.add(_mapToUI());
  }

  ItemModelUI _mapToUI() => ItemModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  ItemListener? get _deps => _state.context.findAncestorStateOfType<ItemListener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
