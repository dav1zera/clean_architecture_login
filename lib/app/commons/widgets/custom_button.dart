import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          fixedSize: const Size(355, 42),
          onPrimary: const Color(0xFF5386CB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: Text(
        text,
        style: GoogleFonts.neuton(
          fontSize: 22,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
