import 'dart:ui';

import 'package:test_metrics/modules/login/widgets/w_confirm.dart';

import '../../../services/settings.dart';
import 'i_login.dart';
import 'models/user_mode_iu.dart';

class LoginP extends StatefulWidget {
  static const id = 'LoginP';

  const LoginP({
    Key? key,
  }) : super(key: key);

  @override
  LoginPState createState() => LoginPState();
}

class LoginPState extends State<LoginP> with ErrorHandlerState {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  UserModelUI? _modelUI;
  late final LoginInteractor _interactor;

  bool get _isValid => (_modelUI?.name.isNotEmpty ?? false) && (_modelUI?.email.isNotEmpty ?? false);

  @override
  void initState() {
    super.initState();
    _interactor = LoginInteractor(this);
    _startListeners();
  }

  @override
  void dispose() async {
    await _interactor.dispose();
    super.dispose();
  }

  _startListeners() {
    _nameTextController.addListener(() {
      _interactor.setName(_nameTextController.text);
    });
    _emailTextController.addListener(() {
      _interactor.setEmail(_emailTextController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModelUI>(
      stream: _interactor.observer,
      builder: (context, s) {
        _modelUI = s.data ?? _modelUI;
        return ScreenFormer(
          streamLoadingStatus: _interactor.observerLoading,
          titleActions: _buildTitle(),
          floatingButton: _buildConfirm(),
          children: [
            _buildLogo(),
            _buildFieldName(),
            _buildFieldEmail(),
            SizedBox(height: MediaQueryData.fromWindow(window).size.height / 2)
          ],
        );
      },
    );
  }

  Widget _buildTitle() {
    return TitleForm(nameTitle: Strings.text.login);
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Image.asset('assets/images/logo.png'),
    );
  }

  Widget _buildFieldName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormDesign(
        controller: _nameTextController,
        labelText: 'Name',
      ),
    );
  }

  Widget _buildFieldEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormDesign(
        controller: _emailTextController,
        labelText: 'Email',
      ),
    );
  }

  Widget _buildConfirm() {
    return AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _isValid ? 1 : 0,
        child: ConfirmButtonW(
          interactor: _interactor,
          enable: _isValid,
        ));
  }
}
