import 'package:test_metrics/services/settings.dart';

import '../i_login.dart';

class ConfirmButtonW extends StatelessWidget {
  const ConfirmButtonW({
    Key? key,
    required LoginInteractor interactor,
  })  : _interactor = interactor,
        super(key: key);

  final LoginInteractor _interactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: InkCustomSimple(
        onTap: _interactor.signInWithEmail,
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
