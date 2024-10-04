import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const MyCustomButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD18E),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10),
        ),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}