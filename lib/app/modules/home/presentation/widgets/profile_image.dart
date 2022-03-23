import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  const ProfileImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      child: ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
