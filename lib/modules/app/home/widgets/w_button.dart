import 'package:test_metrics/services/settings.dart';

import '../i_home.dart';

class ButtonW extends StatelessWidget {
  const ButtonW({
    Key? key,
    required String title,
    required void Function() onTap,
  })  : _title = title,
        _onTap = onTap,
        super(key: key);

  final String _title;
  final void Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: InkCustomSimple(
        onTap: _onTap,
        child: Container(
          alignment: const Alignment(0, 0),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: DesignStyles.buttonDecoration(
            blurRadius: 10,
            borderRadius: 10,
            offset: const Offset(0, 2),
            colorBoxShadow: DesignStyles.colorDark,
            color: DesignStyles.colorDark,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _title,
                  textAlign: TextAlign.center,
                  style: DesignStyles.textCustom(
                    fontSize: 24,
                    color: DesignStyles.colorLight,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: DesignStyles.colorLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
