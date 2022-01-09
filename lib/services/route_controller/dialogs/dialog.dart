import 'package:flutter/material.dart';

import '../../settings/design_styles.dart';

class DesignDialog extends StatelessWidget {
  final Widget content;
  final EdgeInsets? padding;

  const DesignDialog(
    this.content, {
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: DesignStyles.colorLight,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: content,
          ),
        ),
      ),
    );
  }
}

class DesignErrorDialog extends StatelessWidget {
  final String message;

  const DesignErrorDialog(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesignDialog(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Oops', style: DesignStyles.textCustom()),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center, style: DesignStyles.textCustom(color: DesignStyles.colorDark)),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(DesignStyles.colorDark),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
            ),
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}

class DialogRouteCustom<T> extends PopupRoute<T> {
  final RoutePageBuilder _pageBuilder;
  final bool _isCancelable;
  final String? _barrierLabel;

  DialogRouteCustom({
    required RoutePageBuilder pageBuilder,
    bool isCancelable = true,
    String? barrierLabel,
    RouteSettings? settings,
  })  : _pageBuilder = pageBuilder,
        _isCancelable = isCancelable,
        _barrierLabel = barrierLabel,
        super(settings: settings);

  @override
  bool get barrierDismissible => _isCancelable;

  @override
  String get barrierLabel => _barrierLabel!;

  @override
  Color get barrierColor => Colors.black38;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: _pageBuilder(context, animation, secondaryAnimation),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}
