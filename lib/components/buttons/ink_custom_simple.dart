
import '../../services/settings.dart';

class InkCustomSimple extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const InkCustomSimple({
    Key? key,
    required this.onTap,
    required this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius ?? DesignStyles.borderRadiusButton as BorderRadius,
              // splashColor: DesignStyles.grey,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
