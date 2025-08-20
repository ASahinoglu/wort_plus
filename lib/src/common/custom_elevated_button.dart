//custom_elevated_button.dart
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ), // Padding um Text im Button
        child: Text(text),
      ),
    );

    // Wenn `width` angegeben → feste Breite
    if (width != null) {
      return SizedBox(width: width, height: 40.0, child: button);
    }

    // Wenn keine Breite angegeben → "hug content" mit fixer Höhe
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 40.0),
      child: button,
    );
  }
}
