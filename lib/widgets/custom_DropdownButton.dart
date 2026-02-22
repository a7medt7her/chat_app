import 'package:flutter/material.dart';

class CustomDropdownbutton extends StatefulWidget {
  const CustomDropdownbutton({
    super.key,
    required this.items,
    required this.prefixIcon,
    required this.hintText,
    required this.onChanged,
  });

  final List<String> items;
  final IconData prefixIcon;
  final String hintText;
  final Function(String?)? onChanged;
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
        prefixIcon: Icon(widget.prefixIcon, color: Colors.blue),
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

        hintText: widget.hintText,

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 10, 0, 0),
            width: 1.5,
          ),

          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: widget.items
          .map(
            (gender) => DropdownMenuItem(
              alignment: Alignment.centerLeft,
              value: gender,
              child: Text(gender),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          genderslected = value;
        });
        widget.onChanged!(value);
      },
    );
  }
}
