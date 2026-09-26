import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}