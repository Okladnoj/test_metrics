import 'package:flutter/cupertino.dart';
import '../services/settings.dart';

import 'app/follow_app.dart';
import 'login/p_login.dart';
import 'login/s_login.dart';

class FlowControllerRoot extends StatefulWidget {
  const FlowControllerRoot({Key? key}) : super(key: key);

  @override
  _FlowControllerRootState createState() => _FlowControllerRootState();
}

class _FlowControllerRootState extends BaseFlowControllerState<FlowControllerRoot>
    implements LoginListener<FlowControllerRoot> {
  @override
  AppPage createInitialPage() {
    if (AppPreference.isIntoApp) {
      return const AppPage(FollowControllerApp.id, FollowControllerApp());
    } else {
      return const AppPage(LoginP.id, LoginP());
    }
  }

  @override
  void onLoginConfirm() {
    pushSimple(() => const FollowControllerApp());
  }
}
