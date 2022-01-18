import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final List<Widget> children;
  final GlobalKey<FormState> formKey;
  final double height;

  const ContainerBox(
      {Key? key,
      required this.children,
      required this.formKey,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(right: 17.0, left: 13.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(4.0, 4.0),
            )
          ]),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
