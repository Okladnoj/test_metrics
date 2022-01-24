import 'dart:math';

import 'package:test_metrics/services/settings.dart';

import 'i_screen_two.dart';
import 'models/screen_two_model_ui.dart';
import 'widgets/w_screen_two_title.dart';

class ScreenTwoP extends StatefulWidget {
  static const id = 'ScreenTwoP';
  const ScreenTwoP({Key? key}) : super(key: key);

  @override
  ScreenTwoPState createState() => ScreenTwoPState();
}

class ScreenTwoPState extends State<ScreenTwoP> with ErrorHandlerState {
  ScreenTwoModelUI? _modelUI;
  final _r = Random();
  late final ScreenTwoInteractor _interactor;

  @override
  void initState() {
    _interactor = ScreenTwoInteractor(this);
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenTwoModelUI>(
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
      nameTitle: 'Screen Two',
      typeBackAction: TypeBackAction.close,
    );
  }

  Widget _buildContent() {
    return ListView(
      children: List.generate(50, (i) => _buildRowItem(i)),
    );
  }

  Widget _buildRowItem(int i) {
    final nameItem = 'Item N${i + 1}';
    final _rInt = _r.nextInt(0xFFFFFF);
    final color = Color(0xFF000000 + _rInt);
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 15, left: 15),
      decoration: DesignStyles.buttonDecoration(color: color),
      child: InkCustomSimple(
        onTap: () {
          _interactor.onOpenItem(nameItem, color);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(nameItem),
            ],
          ),
        ),
      ),
    );
  }
}
