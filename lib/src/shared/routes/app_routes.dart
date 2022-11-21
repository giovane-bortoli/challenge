import 'package:challenge/src/modules/auth/view/login_view.dart';
import 'package:challenge/src/modules/events/views/list_events_view.dart';
import 'package:challenge/src/modules/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/splash': (context) => const SplashScreen(),
      '/login': (context) => const LoginView(),
      '/home': (context) => const ListEventsView(),
    };
  }
}
