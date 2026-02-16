import 'package:flutter/material.dart';

class CustomDropdownbutton extends StatefulWidget {
  const CustomDropdownbutton({super.key, required this.items});

  final List<String> items;
  @override
  State<CustomDropdownbutton> createState() => _CustomDropdownbuttonState();
}

class _CustomDropdownbuttonState extends State<CustomDropdownbutton> {
  String? genderslected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: genderslected,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.wc, color: Colors.blue),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 219, 211, 209),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 10, 0, 0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),

        hintText: 'Gender',

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 10, 0, 0),
            width: 1.5,
          ),

          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: widget.items
          .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: (value) {
        setState(() {
          genderslected = value;
        });
      },
    );
  }
}
