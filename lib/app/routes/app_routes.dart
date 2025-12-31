import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/features/auth/presentation/pages/signup_screen.dart';
import 'package:jobmitra_flutter/screens/home_screen.dart';
import 'package:jobmitra_flutter/screens/login_screen.dart';


class AppRoutes {
  // Named route constants
  static const String signup = '/signup';
  static const String login = '/login';
  static const String home = '/home';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
