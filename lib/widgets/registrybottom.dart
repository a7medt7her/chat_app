import 'package:flutter/material.dart';

class Registrybottom extends StatelessWidget {
  const Registrybottom({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });
  final VoidCallback onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 72, 150),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
