import 'package:test_metrics/services/settings.dart';

import '../i_login.dart';

class ConfirmButtonW extends StatelessWidget {
  const ConfirmButtonW({
    Key? key,
    required bool enable,
    required LoginInteractor interactor,
  })  : _interactor = interactor,
        _enable = enable,
        super(key: key);

  final LoginInteractor _interactor;
  final bool _enable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: InkCustomSimple(
        onTap: _enable ? _interactor.signInWithEmail : null,
        child: Container(
          alignment: const Alignment(0, 0),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: DesignStyles.buttonDecoration(
            blurRadius: 10,
            borderRadius: 10,
            offset: const Offset(0, 2),
            colorBoxShadow: DesignStyles.colorDark,
            color: DesignStyles.colorDark,
          ),
          child: Text(
            'Sign In',
            style: DesignStyles.textCustom(
              fontSize: 24,
              color: DesignStyles.colorLight,
            ),
          ),
        ),
      ),
    );
  }
}
