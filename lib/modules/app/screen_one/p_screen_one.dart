import 'package:test_metrics/services/settings.dart';

import 'i_screen_one.dart';
import 'models/screen_one_model_ui.dart';
import 'widgets/w_screen_one_title.dart';

class ScreenOneP extends StatefulWidget {
  static const id = 'ScreenOneP';
  const ScreenOneP({Key? key}) : super(key: key);

  @override
  ScreenOnePState createState() => ScreenOnePState();
}

class ScreenOnePState extends State<ScreenOneP> with ErrorHandlerState {
  ScreenOneModelUI? _modelUI;
  late final ScreenOneInteractor _interactor;

  @override
  void initState() {
    _interactor = ScreenOneInteractor(this);
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenOneModelUI>(
      stream: _interactor.observer,
      builder: (context, s) {
        _modelUI = s.data ?? _modelUI;
        return ScreenFormer(
          streamLoadingStatus: _interactor.observerLoading,
          titleActions: _buildTitle(),
          children: [
            _buildContent(),
            ScreenOneW(interactor: _interactor),
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
