import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:jobmitra_flutter/screens/splash_screen.dart';
import 'package:jobmitra_flutter/app/theme/app_theme.dart';
import 'package:jobmitra_flutter/app/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobPortalLoginPage(),
      theme: AppTheme.light,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}