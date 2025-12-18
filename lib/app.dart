import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/screens/splash_screen.dart';
import 'package:jobmitra_flutter/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: AppTheme.green,
    );
  }
}