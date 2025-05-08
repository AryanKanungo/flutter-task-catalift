import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;


  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: Colors.grey[600], // Label color (default)

        ),
        filled: true, // Make background color visible
        fillColor: Colors.white10, // Background color when not focused
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Border color when not focused
            width: 2, // Default border width
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[600]!, // Border color when not focused
            width: 2, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.indigo, // Border color when focused
            width: 2, // Thicker border when focused
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.indigo, // Focused error border color
            width: 2, // Thicker error border when focused
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.0, // Increase vertical padding
          horizontal: 20.0, // Increase left/right padding
        ),
        focusColor: Colors.blue, // Color when the field is focused
      ),
      style: TextStyle(
        color: Colors.grey[800], // Text color (shades of grey)
      ),
    );
  }
}
