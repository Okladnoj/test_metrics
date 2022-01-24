import 'dart:math';

import 'package:test_metrics/services/settings.dart';

import 'i_screen_three.dart';
import 'models/screen_three_model_ui.dart';

class ScreenThreeP extends StatefulWidget {
  static const id = 'ScreenThreeP';
  const ScreenThreeP({Key? key}) : super(key: key);

  @override
  ScreenThreePState createState() => ScreenThreePState();
}

class ScreenThreePState extends State<ScreenThreeP> with ErrorHandlerState {
  ScreenThreeModelUI? _modelUI;
  final _r = Random();
  late final ScreenThreeInteractor _interactor;

  @override
  void initState() {
    _interactor = ScreenThreeInteractor(this);
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenThreeModelUI>(
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
    return TitleForm(
      nameTitle: Strings.text.emptyString,
      typeBackAction: TypeBackAction.close,
    );
  }

  Widget _buildContent() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ),
      children: List.generate(50, (i) => _buildRowItem(i)),
    );
  }

  Widget _buildRowItem(int i) {
    final nameItem = 'Item N${i + 1}';
    final _rInt = _r.nextInt(0xFFFFFF);
    final color = Color(0xFF000000 + _rInt);
    return InkCustomSimple(
      onTap: () {
        _interactor.onOpenItem(nameItem, color);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: DesignStyles.buttonDecoration(color: color),
        child: Text(nameItem),
      ),
    );
  }
}
