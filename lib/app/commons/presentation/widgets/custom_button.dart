import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          fixedSize: const Size(355, 42),
          onPrimary: const Color(0xFF5386CB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: widget.isLoading
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              widget.text,
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
