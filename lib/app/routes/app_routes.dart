import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/features/auth/presentation/pages/signup_page.dart';
import 'package:jobmitra_flutter/features/auth/presentation/pages/signup_screen.dart';
import 'package:jobmitra_flutter/screens/hive_user_screen.dart';
import 'package:jobmitra_flutter/screens/home_screen.dart';
import 'package:jobmitra_flutter/features/auth/presentation/pages/login_screen.dart';


class AppRoutes {
  // Named route constants
  static const String signup = '/signup';
  static const String signUp = '/signup_page';
  static const String login = '/login';
  static const String home = '/home';
  static const String hiveView = '/hive_view';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case hiveView:
        // Assuming HiveViewScreen is defined elsewhere
        return MaterialPageRoute(builder: (_) => const HiveUsersScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignupPage());
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
