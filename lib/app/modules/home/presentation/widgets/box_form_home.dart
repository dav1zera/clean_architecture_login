import 'package:clean_login/app/commons/widgets/container_box.dart';
import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:clean_login/main.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxFormHome extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final HomeController controller;

  const BoxFormHome({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  @override
  State<BoxFormHome> createState() => _BoxFormHomeState();
}

class _BoxFormHomeState extends State<BoxFormHome> {
  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      formKey: widget.formKey,
      height: 200.0,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          "Seu ID: ${sessionStore.userInfoData!.uid}",
          style: GoogleFonts.neuton(
            fontSize: 15,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Seu Nome: ${sessionStore.userInfoData!.name}",
          style: GoogleFonts.neuton(
            fontSize: 15,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Seu Email: ${sessionStore.userInfoData!.email}",
          style: GoogleFonts.neuton(
            fontSize: 15,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
