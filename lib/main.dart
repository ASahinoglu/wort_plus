import 'package:flutter/material.dart';
import 'package:wort_plus/src/features/main/main_screen.dart';
import 'package:wort_plus/src/theme/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WortPlus',
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}
