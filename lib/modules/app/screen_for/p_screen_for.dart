import 'package:test_metrics/services/settings.dart';

import 'i_screen_for.dart';
import 'models/screen_for_model_ui.dart';
import 'widgets/w_screen_for_title.dart';

class ScreenForP extends StatefulWidget {
  static const id = 'ScreenForP';
  const ScreenForP({Key? key}) : super(key: key);

  @override
  ScreenForPState createState() => ScreenForPState();
}

class ScreenForPState extends State<ScreenForP> with ErrorHandlerState {
  ScreenForModelUI? _modelUI;
  late final ScreenForInteractor _interactor;

  @override
  void initState() {
    _interactor = ScreenForInteractor(this);
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenForModelUI>(
      stream: _interactor.observer,
      builder: (context, s) {
        _modelUI = s.data ?? _modelUI;
        return ScreenFormer(
          streamLoadingStatus: _interactor.observerLoading,
          titleActions: _buildTitle(),
          children: [
            _buildContent(),
            ScreenForW(interactor: _interactor),
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
