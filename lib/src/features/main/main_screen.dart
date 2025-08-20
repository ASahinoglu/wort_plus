import 'package:flutter/material.dart';
import 'package:wort_plus/src/features/home/home_screen.dart';
import 'package:wort_plus/src/features/learn/learn_screen.dart';
//import 'package:wort_plus/src/features/quiz/quiz_screen.dart';
import 'package:wort_plus/src/features/profile/profile_screen.dart';
import 'package:wort_plus/src/common/app_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LearnScreen(),
    //QuizScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
