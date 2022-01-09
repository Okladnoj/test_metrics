import 'package:flutter/material.dart';

import '../../settings/design_styles.dart';

class DesignLoadingOverlayRoute<T> extends PopupRoute<T> {
  DesignLoadingOverlayRoute() : super(settings: const RouteSettings(name: NAME));

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => 'Loading';

  @override
  Color get barrierColor => Colors.transparent;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Material(
      color: Colors.transparent,
      child: Stack(children: [
        Positioned.fill(
          child: Container(
            constraints: const BoxConstraints.expand(),
            color: DesignStyles.colorDark.withOpacity(0.33),
          ),
        ),
        const Center(child: DesignPageLoadingModality())
      ]),
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

  static const String NAME = "route_loading";
}

class DesignPageLoadingModality extends StatelessWidget {
  final String? label;
  final Color? primaryColor;
  final Color? secondaryColor;

  const DesignPageLoadingModality({
    Key? key,
    this.label,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 88.0,
        maxHeight: 120.0,
        minWidth: 154.0,
        maxWidth: 154.0,
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createIndicator(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _createIndicator() {
    return const Center(
      child: DesignCircleProgress(
        size: DesignCircleProgressSize.big,
      ),
    );
  }
}

class DesignCircleProgress extends StatelessWidget {
  final DesignCircleProgressSize size;

  const DesignCircleProgress({Key? key, this.size = DesignCircleProgressSize.small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (size == DesignCircleProgressSize.big) {
      return SizedBox(width: 48, height: 48, child: _createIndicator(4.0));
    } else {
      const scale = 24 / 36.0;
      return Transform.scale(scale: scale, child: _createIndicator(2.0 / scale));
    }
  }

  Widget _createIndicator(double strokeWidth) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation(
          DesignStyles.colorMiddle,
        ),
      ),
    );
  }
}

enum DesignCircleProgressSize { small, big }
