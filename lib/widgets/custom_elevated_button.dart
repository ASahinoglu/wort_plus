import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text; // Der anzuzeigende Text auf dem Button
  final VoidCallback
  onPressed; // Die Funktion, die beim Drücken des Buttons ausgeführt wird

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Die übergebene Funktion wird hier aufgerufen
      child: Text(text), // Der übergebene Text wird hier angezeigt
    );
  }
}
