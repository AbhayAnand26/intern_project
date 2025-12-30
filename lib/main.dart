import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';
import 'services/auth/auth_deep_link_service.dart';
import 'services/session_manager/session_controller.dart';

/// Global navigator key (used for deep links & auth redirects)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Restore session
  await SessionController().getUserFromPreference();

  /// Firebase initialization (Web requires FirebaseOptions)
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "YOUR_API_KEY",
        authDomain: "YOUR_PROJECT.firebaseapp.com",
        projectId: "YOUR_PROJECT_ID",
        storageBucket: "YOUR_PROJECT.appspot.com",
        messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
        appId: "YOUR_APP_ID",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthDeepLinkService _authDeepLinkService = AuthDeepLinkService();

  // Native method channel
  static const platform = MethodChannel('com.flutter.jobseeker');

  @override
  void initState() {
    super.initState();
    _authDeepLinkService.init(navigatorKey);
    _initializeNativeSDK();
  }

  Future<void> _initializeNativeSDK() async {
    if (!kIsWeb) {
      // Only call native SDK on mobile (Android/iOS)
      try {
        await platform.invokeMethod('initSDK');
        print("Native SDK Initialized Successfully");

        await platform.invokeMethod('pushPendingEvents');
      } on PlatformException catch (e) {
        print("Failed to call native method: \${e.message}");
      }
    }
  }

  @override
  void dispose() {
    _authDeepLinkService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
