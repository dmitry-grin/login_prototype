import 'package:flutter/material.dart';
import 'package:login_prototype/src/auth_handler.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authHandler = AuthHandler();
  await authHandler.loadPrefs();

  runApp(App());
}
