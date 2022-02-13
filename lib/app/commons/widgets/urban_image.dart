import 'package:flutter/material.dart';

class UrbanImage extends StatelessWidget {
  final String image;
  const UrbanImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, MediaQuery.of(context).size.height * -0.12),
      child: Image.asset(
        "assets/images/urban.png",
        width: 390,
        height: 390,
        //alignment: Alignment.topCenter,
      ),
    );
  }
}
