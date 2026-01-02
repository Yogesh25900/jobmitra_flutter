import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobmitra_flutter/app.dart';
import 'package:jobmitra_flutter/core/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  
  runApp(ProviderScope(child:  App()));
}
