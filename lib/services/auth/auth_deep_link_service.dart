import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/services/session_manager/session_controller.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';

/// Service for handling deep links and authentication redirects
class AuthDeepLinkService {
  StreamSubscription? _sub;
  final _sessionController = SessionController();

  /// A stream that emits the latest URI.
  final BehaviorSubject<String?> _uriLinkStream = BehaviorSubject();

  /// Initialize the deep link service
  void init(GlobalKey<NavigatorState> navigatorKey) {
    _handleInitialUri();
    // uriLinkStream is not supported on web
    if (!kIsWeb) {
      _handleIncomingUris();
    }
  }

  /// Handle the initial URI that the app was launched with.
  Future<void> _handleInitialUri() async {
    try {
      final initialUri = await getInitialUri();
      if (initialUri != null) {
        _processUri(initialUri);
      }
    } on PlatformException {
      // Platform messages may fail but we can ignore them.
    } on UnsupportedError {
      // Uni links not supported on this platform.
    }
  }

  /// Handle incoming URIs while the app is running.
  void _handleIncomingUris() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _processUri(uri);
      }
    }, onError: (err) {
      // Handle errors
    });
  }

  void _processUri(Uri uri) {
    if (uri.pathSegments.contains('auth') && uri.pathSegments.contains('callback')) {
      final token = uri.queryParameters['token'];
      final userId = uri.queryParameters['userId'];
      final username = uri.queryParameters['username'];
      final avatarUrl = uri.queryParameters['avatarUrl'];

      if (token != null) {
        _sessionController.saveToken(token);
        if (userId != null && username != null && avatarUrl != null) {
          _sessionController.saveFirstParticipant(
              userId: userId,
              username: username,
              avatarUrl: avatarUrl);
        }
      }
    }
  }


  /// Dispose resources
  void dispose() {
    _sub?.cancel();
    _uriLinkStream.close();
  }
}
