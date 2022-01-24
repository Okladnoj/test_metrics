import 'dart:math';

import 'package:test_metrics/modules/app/item/domain/item_api.dart';
import 'package:test_metrics/services/settings.dart';

import 'i_item.dart';
import 'models/item_model_ui.dart';

class ItemP extends StatefulWidget {
  static const id = 'ItemP';

  final String nameItem;

  final Color color;

  const ItemP({
    Key? key,
    required this.nameItem,
    required this.color,
  }) : super(key: key);

  @override
  ItemPState createState() => ItemPState();
}

class ItemPState extends State<ItemP> with ErrorHandlerState {
  ItemModelUI? _modelUI;
  late final ItemInteractor _interactor;

  @override
  void initState() {
    _interactor = ItemInteractor(this, ItemApi());
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ItemModelUI>(
      stream: _interactor.observer,
      builder: (context, s) {
        _modelUI = s.data ?? _modelUI;
        return ScreenFormer(
          streamLoadingStatus: _interactor.observerLoading,
          titleActions: _buildTitle(),
          child: _buildContent(),
        );
      },
    );
  }

  Widget _buildTitle() {
    return const TitleForm(
      nameTitle: 'Item Screen',
      typeBackAction: TypeBackAction.back,
    );
  }

  Widget _buildContent() {
    return Container(
      color: widget.color,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: DesignStyles.buttonDecoration(),
          child: Text(
            widget.nameItem,
            style: DesignStyles.textCustom(
              fontSize: 24,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}
