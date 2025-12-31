import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/screens/splash_screen.dart';
import 'package:jobmitra_flutter/app/theme/app_theme.dart';
import 'package:jobmitra_flutter/app/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: AppTheme.light,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}