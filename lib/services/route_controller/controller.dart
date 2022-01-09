import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialogs/dialog.dart';
import 'flow_controller.dart';

abstract class BackPressHandler<T extends StatefulWidget> implements State<T> {
  void onBackPressed();

  bool handleBackPressed();
}

abstract class PopScopeHost<T extends StatefulWidget> implements State<T> {
  final List<BackPressHandler> _backPressHandlers = [];

  Future<bool> onWillPop() async {
    for (int i = _backPressHandlers.length - 1; i >= 0; i--) {
      if (!_backPressHandlers[i].mounted) continue;
      if (_backPressHandlers[i].handleBackPressed()) {
        return false;
      }
    }
    return true;
  }

  void addBackPressHandler(BackPressHandler<StatefulWidget> handler) {
    _backPressHandlers.add(handler);
  }

  void removeBackPressHandler(BackPressHandler<StatefulWidget> handler) {
    _backPressHandlers.remove(handler);
  }

  static PopScopeHostSubscription subscribe(BuildContext ctx, BackPressHandler handler) {
    final host = ctx.findAncestorStateOfType<PopScopeHost>();
    host?.addBackPressHandler(handler);
    return PopScopeHostSubscription(host, handler);
  }
}

class PopScopeHostSubscription {
  PopScopeHost? _host;
  late final BackPressHandler? _handler;

  PopScopeHostSubscription(this._host, this._handler);

  void dispose() {
    _host?.removeBackPressHandler(_handler!);
    _host = null;
  }
}

mixin LoadingHandlerState<T extends StatefulWidget> on State<T> {
  void showLoadingOverlay(bool show) {
    if (this is BaseFlowControllerState) {
      (this as BaseFlowControllerState).showLoadingOverlay(show);
    } else {
      final controller = context.findAncestorStateOfType<BaseFlowControllerState>();
      controller?.showLoadingOverlay(show);
    }
  }
}

abstract class ErrorToTextMapper {
  static String Function(Exception)? _mapper;

  String map(Exception e);

  static set init(String Function(Exception) impl) {
    _mapper = impl;
  }

  static String Function(Exception p1) get init => _mapper ?? (Exception p1) => p1.toString();

  static String mapToText(Exception e) {
    return _mapper != null ? _mapper!(e) : 'Something went wrong';
  }
}

mixin ErrorHandlerState<T extends StatefulWidget> on State<T> {
  Future<void> showError(dynamic e) async {
    String? message;
    if (e is DioError) {
      message = e.message;
    } else if (e is Exception) {
      message = e.toString();
    }

    await showErrorMessage(message ?? e?.toString() ?? 'Something went wrong');
  }

  Future<void> showErrorMessage(String? message) async {
    final dialog = DesignErrorDialog(message ?? 'Something went wrong');
    if (this is BaseFlowControllerState) {
      await (this as BaseFlowControllerState).showDesignDialog(dialog);
    } else {
      final dialogController = context.findAncestorStateOfType<BaseFlowControllerState>();
      await dialogController?.showDesignDialog(dialog);
    }
  }
}

abstract class LifecycleAwareState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver, RouteAware {
  late bool? _isResumed;
  late bool? _isAppInFg;
  late bool? _isCovered;

  RouteObserver? _routeObserver;

  void onResumed();

  void onPaused();

  void subscribeLifecycle() {
    WidgetsBinding.instance?.addObserver(this);

    _isResumed = true;
    _isAppInFg = true;
    _isCovered = false;
    onResumed();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _unsubscribeFromStates();
    _routeObserver = _flowController?.routeObserver();
    _routeObserver?.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    super.dispose();

    _unsubscribeFromStates();
    WidgetsBinding.instance?.removeObserver(this);

    if (_isResumed!) {
      onPaused();
      _isResumed = false;
    }
  }

  void _unsubscribeFromStates() {
    _routeObserver?.unsubscribe(this);
    _routeObserver = null;
  }

  @override
  void didPushNext() {
    _isCovered = true;
    _notifyStateChanged();
  }

  @override
  void didPopNext() {
    _isCovered = false;
    _notifyStateChanged();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _isAppInFg = state == AppLifecycleState.resumed;
    _notifyStateChanged();
  }

  void _notifyStateChanged() {
    final bool isResumed = _isAppInFg! && !_isCovered! && mounted;
    if (isResumed != _isResumed) {
      if (isResumed) {
        onResumed();
      } else {
        onPaused();
      }
      _isResumed = isResumed;
    }
  }

  BaseFlowControllerState? get _flowController => context.findAncestorStateOfType<BaseFlowControllerState>();
}
