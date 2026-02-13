import 'package:flutter/material.dart';

class Chatbuble extends StatelessWidget {
  const Chatbuble({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 15,
          right: 15,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 30, 141),
              Color.fromARGB(255, 28, 120, 190),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
