import 'package:flutter/material.dart';
import 'package:wort_plus/screens/home_screen.dart'; // Diese Datei wird gleich erstellt
import 'package:wort_plus/screens/learn_screen.dart'; // Diese Datei wird gleich erstellt
import 'package:wort_plus/screens/quiz_screen.dart'; // Diese Datei wird gleich erstellt
import 'package:wort_plus/screens/profile_screen.dart'; // Diese Datei wird gleich erstellt

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Der Index des aktuell ausgewählten Tabs

  // Liste der Bildschirme, die über die BottomNavigationBar zugänglich sind
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Home-Bildschirm (Startseite)
    LearnScreen(), // Lern-Bildschirm
    QuizScreen(), // Quiz-Bildschirm
    ProfileScreen(), // Profil-Bildschirm
  ];

  // Diese Methode wird aufgerufen, wenn ein Element in der BottomNavigationBar getippt wird
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Aktualisiere den ausgewählten Index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(
        _selectedIndex,
      ), // Zeigt den aktuell ausgewählten Bildschirm an
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), // Home-Symbol
            label: 'Home', // Beschriftung für Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book), // Lern-Symbol (Schule/Buch)
            label: 'Learn', // Beschriftung für Learn
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment), // Quiz-Symbol
            label: 'Quiz', // Beschriftung für Quiz
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), // Profil-Symbol
            label: 'Profile', // Beschriftung für Profile
          ),
        ],
        currentIndex: _selectedIndex, // Der aktuell ausgewählte Index
        onTap: _onItemTapped, // Die Methode, die beim Tippen aufgerufen wird
      ),
    );
  }
}
