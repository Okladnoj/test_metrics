import 'dart:developer';

import 'package:flutter/material.dart';
import '../../services/initialization_app/analytic.dart';

import '../settings.dart';

class CustomObserver extends RouteObserver<PageRoute<dynamic>> {
  RoutStack? _routStack = RoutStack('', [''], Stopwatch(), null);
  void _sendScreenView(PageRoute<dynamic> route) {
    final screenName = route.settings.name;
    final routStack = _routStack?.path;
    final seconds = _routStack?.stopwatch.elapsed.inSeconds;
    final p = 'screenName $screenName rout_stack $routStack' '${{'rout_stack': routStack, 'seconds': seconds}}';
    debugPrint(p);
    AnalyticAppEvents.setScreenWithMap(
      screenName,
      routStack,
      {
        'rout_stack': routStack,
        'seconds': seconds,
      },
    );
    AnalyticAppEvents.setEventStringWithMap('screen_view', {
      'screenName': routStack,
      'screenClass': screenName,
    });
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _routStack = _routStack?.push(route.settings.name ?? 'noRoutName');
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _routStack = _routStack?.replace(newRoute.settings.name ?? 'noRoutName');
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _routStack = _routStack?.pop();
      _sendScreenView(previousRoute);
    }
  }
}

class RoutStack {
  final String name;
  final List<String> stack;
  final Stopwatch stopwatch;
  final RoutStack? model;

  RoutStack(this.name, this.stack, this.stopwatch, this.model);

  RoutStack push(String name) {
    final stopwatch = Stopwatch()..start();
    return RoutStack(name, [...stack, name], stopwatch, this);
  }

  RoutStack replace(String name) {
    final stopwatch = Stopwatch()..start();
    stack.removeLast();
    return RoutStack(name, [...stack, name], stopwatch, this);
  }

  RoutStack? pop() {
    model?.stopwatch.stop();
    return model;
  }

  String get path => stack.join('/');
}
