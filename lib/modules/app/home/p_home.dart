import 'package:test_metrics/services/settings.dart';

import 'i_home.dart';
import 'models/home_model_ui.dart';
import 'widgets/w_button.dart';

class HomeP extends StatefulWidget {
  static const id = 'HomeP';
  const HomeP({Key? key}) : super(key: key);

  @override
  HomePState createState() => HomePState();
}

class HomePState extends State<HomeP> with ErrorHandlerState {
  HomeModelUI? _modelUI;
  late final HomeInteractor _interactor;

  @override
  void initState() {
    _interactor = HomeInteractor(this);
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: StreamBuilder<HomeModelUI>(
        stream: _interactor.observer,
        builder: (context, s) {
          _modelUI = s.data ?? _modelUI;
          return ScreenFormer(
            streamLoadingStatus: _interactor.observerLoading,
            titleActions: _buildTitle(),
            children: [
              _buildContent(),
              ButtonW(
                title: 'To Screen One',
                onTap: () {},
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTitle() {
    return const TitleForm(
      nameTitle: 'Home Page',
      typeBackAction: TypeBackAction.non,
    );
  }

  Widget _buildContent() {
    return const SizedBox.shrink();
  }
}
