import '../../services/settings.dart';
import 'home/p_home.dart';
import 'home/s_home.dart';
import 'screen_for/p_screen_for.dart';
import 'screen_one/p_screen_one.dart';
import 'screen_three/p_screen_three.dart';
import 'screen_two/p_screen_two.dart';

class FollowControllerApp extends StatefulWidget {
  static const id = 'FollowControllerApp';
  const FollowControllerApp({Key? key}) : super(key: key);

  @override
  _FollowControllerAppState createState() => _FollowControllerAppState();
}

class _FollowControllerAppState extends BaseFlowControllerState<FollowControllerApp>
    implements //
        HomeListener<FollowControllerApp> {
  @override
  @override
  AppPage createInitialPage() {
    return const AppPage(HomeP.id, HomeP());
  }

  @override
  Future<R?> onScreenOne<R>() async {
    return pushSimple(() => const ScreenOneP(), name: ScreenOneP.id);
  }

  @override
  Future<R?> onScreenTwo<R>() async {
    return pushSimple(() => const ScreenTwoP(), name: ScreenTwoP.id);
  }

  @override
  Future<R?> onScreenThree<R>() async {
    return pushSimple(() => const ScreenThreeP(), name: ScreenThreeP.id);
  }

  @override
  Future<R?> onScreenFor<R>() async {
    return pushSimple(() => const ScreenForP(), name: ScreenForP.id);
  }
}
