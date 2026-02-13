import 'package:flutter/material.dart';

class Textfield1 extends StatelessWidget {
  Textfield1({
    super.key,
    required this.obscureText,
    required this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
  });
  final bool obscureText;
  final String hintText;
  final Function(String)? onChanged;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 244, 51, 51),
            width: 1.5,
          ),
        ),
        errorStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 243, 85, 85),
        ),
        filled: true,

        fillColor: const Color.fromARGB(255, 255, 255, 255),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
