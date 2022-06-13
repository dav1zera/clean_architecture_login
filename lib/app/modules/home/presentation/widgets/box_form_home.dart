import 'package:clean_login/app/commons/presentation/keys/keys.dart';
import 'package:clean_login/app/commons/presentation/widgets/container_box.dart';
import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxFormWelcome extends StatefulWidget {
  final HomeController controller;

  BoxFormWelcome({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<BoxFormWelcome> createState() => _BoxFormWelcomeState();
}

class _BoxFormWelcomeState extends State<BoxFormWelcome> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ContainerBox(
        key: Key(homePage),
        height: 200.0,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            "Seu ID: ${widget.controller.authStore.user?.uid}",
            style: GoogleFonts.neuton(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Seu Nome: ${widget.controller.authStore.user?.name}",
            style: GoogleFonts.neuton(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Seu Email: ${widget.controller.authStore.user?.email}",
            style: GoogleFonts.neuton(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sua cidade: ${widget.controller.store.adress?.cidade} ",
            style: GoogleFonts.neuton(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Seu cep: ${widget.controller.store.adress?.cep} ",
            style: GoogleFonts.neuton(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sua rua: ${widget.controller.store.adress?.rua} ",
            style: GoogleFonts.neuton(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      );
    });
  }
}
