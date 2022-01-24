import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import '../../services/initialization_app/analytic.dart';
import 'package:shake_flutter/shake_flutter.dart';

import '../settings.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Shake.setShowFloatingReportButton(true);
    Shake.setInvokeShakeOnShakeDeviceEvent(true);
    Shake.setInvokeShakeOnScreenshot(true);
    Shake.setAutoVideoRecording(true);
    Shake.start(AppPreference.shakeClientID, AppPreference.shakeClientSecret);
    FlutterUxcam.optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
    FlutterUxcam.startWithKey("dkrdmk88xmdg6kj");
    await Firebase.initializeApp();
    await AppPreference.init();
    AnalyticAppEvents();
    await ThemesInit.init();
    final lS = await LocaleRepository.instance.loadLocale();
    await Strings.loadFromLocal(Locale(lS));
    AppApi.init();
    DesignStyles.changeTheme(ThemesInit.type);

    FlutterUxcam.setUserIdentity(AppPreference.user.email ?? '');
    FlutterUxcam.setUserProperty('name', AppPreference.user.name ?? '');
    FlutterUxcam.setUserProperty('email', AppPreference.user.email ?? '');
  }
}
