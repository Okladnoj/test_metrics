import 'package:test_metrics/services/settings.dart';

import 'i_screen_three.dart';
import 'models/screen_three_model_ui.dart';
import 'widgets/w_screen_three_title.dart';

class ScreenThreeP extends StatefulWidget {
  static const id = 'ScreenThreeP';
  const ScreenThreeP({Key? key}) : super(key: key);

  @override
  ScreenThreePState createState() => ScreenThreePState();
}

class ScreenThreePState extends State<ScreenThreeP> with ErrorHandlerState {
  ScreenThreeModelUI? _modelUI;
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
          children: [
            _buildContent(),
            ScreenThreeW(interactor: _interactor),
          ],
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
    return const SizedBox.shrink();
  }
}
