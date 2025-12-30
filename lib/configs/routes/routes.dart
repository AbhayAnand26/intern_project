import 'package:flutter/material.dart';

import '../../features/audio_room/login_screen.dart';
import '../../features/audio_room/rooms_screen.dart';
import '../../services/session_manager/session_controller.dart';
import 'routes_name.dart';

/// Main route generator for the application
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Splash/Initial route - check if user is logged in
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (_) => SessionController.isLogin
              ? const RoomsScreen()
              : const LoginScreen(),
        );

    // Login screen
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

    // Rooms screen (requires authentication)
      case RoutesName.rooms:
        return MaterialPageRoute(
          builder: (_) => SessionController.isLogin
              ? const RoomsScreen()
              : const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route ${settings.name} not found'),
            ),
          ),
        );
    }
  }
}