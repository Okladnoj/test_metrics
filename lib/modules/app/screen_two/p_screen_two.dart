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
          children: [
            _buildContent(),
            ScreenTwoW(interactor: _interactor),
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
