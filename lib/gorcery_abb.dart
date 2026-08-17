

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class GorceryApp extends StatelessWidget {
  const GorceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}