import '../../services/settings.dart';

class RadioButton extends StatelessWidget {
  final double size;
  final bool isSelect;
  final void Function()? onTap;

  const RadioButton({
    Key? key,
    this.size = 20,
    required this.isSelect,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkCustomSimple(
      borderRadius: BorderRadius.circular(60),
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            if (isSelect)
              Center(
                child: Container(
                  width: size / 1.8,
                  height: size / 1.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        DesignStyles.colorDark,
                        DesignStyles.colorLight,
                      ],
                    ),
                  ),
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
