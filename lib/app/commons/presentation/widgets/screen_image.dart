import 'dart:ui';

import 'package:flutter/material.dart';

class ScreenImage extends StatelessWidget {
  final String image;
  const ScreenImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.25,
            child: Image.asset(
              "assets/images/screen.png",
              color: Colors.black,
              width: 174,
              height: 148,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Image.asset(
              "assets/images/screen.png",
              width: 168,
              height: 142,
            ),
          )
        ],
      ),
    );
  }
}
