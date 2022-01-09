import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller.dart';
import 'dialogs/dialog.dart';
import 'dialogs/loading_overlay.dart';
import 'observer.dart';

class AppPage {
  final String name;
  final Widget widget;

  const AppPage(this.name, this.widget);
}

abstract class BaseFlowControllerState<T extends StatefulWidget> extends State<T>
    with ErrorHandlerState<T>, LoadingHandlerState<T>
    implements BackPressHandler<T> {
  late GlobalKey<NavigatorState> _navKey;
  late PopScopeHostSubscription _popScopeHostSubscription;
  late RouteObserver _routeObserver;
  final CustomObserver _customObserver = CustomObserver();

  List<String>? _navStack;

  BaseFlowControllerState();

  @override
  void initState() {
    super.initState();
    _navStack = [];
    _navKey = GlobalObjectKey<NavigatorState>(this);
    _routeObserver = RouteObserver();
    _popScopeHostSubscription = PopScopeHost.subscribe(context, this);
  }

  @override
  void dispose() {
    _popScopeHostSubscription.dispose();
    super.dispose();
  }

  AppPage createInitialPage();

  @override
  bool handleBackPressed() {
    if (isLoading()) {
      SystemNavigator.pop();
      return true;
    }
    final nav = _navigator();
    if (nav?.canPop() ?? false) {
      nav?.pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  void onBackPressed() {
    if (!handleBackPressed()) {
      final BackPressHandler<StatefulWidget>? parentHandler = context.findAncestorStateOfType<BackPressHandler>();
      parentHandler?.onBackPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navKey,
      observers: [_routeObserver, _customObserver],
      onGenerateRoute: (s) {
        final AppPage page = createInitialPage();
        _navStack?.add(page.name);
        // AnalyticAppEvents.setScreenWithMap(page.widget.toString(), page.name, {'nav_stack': _navStack?.join('/')});
        return CupertinoPageRoute(builder: (s) => page.widget, settings: RouteSettings(name: page.name));
      },
    );
  }

  Future<R?>? showErrorDialog<R>(String message) {
    _cancelLoading();

    return showDesignDialog(DesignErrorDialog(message), name: _ROUTE_ERROR);
  }

  Future<R?>? showDesignDialog<R>(Widget dialog, {bool isCancelable = true, String? name}) {
    return push<R>(
      DialogRouteCustom<R>(
        pageBuilder: (c, animIn, animOut) => dialog,
        isCancelable: isCancelable,
        barrierLabel: _getModalBarrierLabel(),
        settings: RouteSettings(
          name: generateRouteName(name),
        ),
      ),
    );
  }

//  Future<R> showDesignBottomSheet<R>(DesignSheetContentBuilder builder,
//                                     {isDismissible = true,
//                                       isFixedHeight = false}) {
//    return push<R>(DesignBottomSheetRoute<R>(
//        builder: builder,
//        isFixedHeight: isFixedHeight,
//        isDismissible: isDismissible,
//        barrierLabel: _getModalBarrierLabel(),
//        settings: RouteSettings(name: generateRouteName())
//    ));
//  }

  @override
  void showLoadingOverlay(bool show) {
    if (show && !isLoading()) {
      push(DesignLoadingOverlayRoute());
    } else if (!show && isLoading()) {
      pop();
    }
  }

  Future<R?>? pushSimple<R>(Widget Function() builder, {String? name}) {
    final routeName = generateRouteName(name);
    return push(CupertinoPageRoute(builder: (c) => builder(), settings: RouteSettings(name: routeName)));
  }

  Future<R?>? pushAndRemoveUntil<R extends dynamic>(Route<R> route, RoutePredicate predicate) {
    Route<R> newRoute = route;
    if (route.settings.name == null && route is CupertinoPageRoute) {
      final CupertinoPageRoute typed = route as CupertinoPageRoute;
      newRoute = CupertinoPageRoute(
        builder: typed.builder,
        settings: RouteSettings(name: generateRouteName(), arguments: route.settings.arguments),
      );
    }
    assert(newRoute.settings.name != null);
    return _navigator()?.pushAndRemoveUntil(newRoute, (route) {
      final willPop = !predicate(route);
      if (willPop) {
        _navStack?.removeLast();
      } else {
        _navStack?.add(newRoute.settings.name!);
      }
      return !willPop;
    });
  }

  void popUntilFound(String name) {
    _navigator()?.popUntil((route) {
      final willPop = route.settings.name != name;
      if (willPop) _navStack?.removeLast();
      return !willPop;
    });
  }

  Future<R?>? push<R>(Route<R> route) {
    assert(route.settings.name != null);
    _navStack?.add(route.settings.name!);
    return _navigator()?.push(route);
  }

  void pop<R>({R? result}) {
    _navStack?.removeLast();
    _navigator()?.pop(result);
  }

  void _cancelLoading() {
    if (isLoading()) {
      showLoadingOverlay(false);
    }
  }

  String _getModalBarrierLabel() {
    return MaterialLocalizations.of(context).modalBarrierDismissLabel;
  }

  String generateRouteName([String? name]) {
    String _name = '';
    if (name == null) {
      _name = 'route#${++_routeId}';
    } else {
      _name = name;
    }

    return _name;
  }

  bool? canPop() => _navigator()?.canPop();

  bool isLoading() => isDisplayed(DesignLoadingOverlayRoute.NAME);

  bool isDisplayed(String routeName) => _navStack?.last == routeName;

  NavigatorState? _navigator() {
    return _navKey.currentState;
  }

  RouteObserver routeObserver() => _routeObserver;

  static const String _ROUTE_ERROR = 'route_error';

  static int _routeId = 0;
}
