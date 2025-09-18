import 'package:flutter/material.dart';
import 'views/login_screen.dart';
import 'views/home_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
  };
}
