import 'package:challenge/home_page.dart';
import 'package:challenge/src/modules/auth/view/login_view.dart';
import 'package:challenge/src/modules/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/splash': (context) => const SplashScreen(),
      '/login': (context) => const LoginView(),
    };
  }
}
