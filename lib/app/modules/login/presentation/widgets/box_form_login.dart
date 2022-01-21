import 'package:clean_login/app/commons/widgets/container_box.dart';
import 'package:clean_login/app/commons/widgets/text_form_field.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/validators/validators.dart';
import 'package:clean_login/app/modules/login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxFormLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginController controller;

  const BoxFormLogin({
    Key? key,
    required this.formKey,
    required this.controller,
    //equired this.credentials,
    //required this.validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      height: 82.0,
      formKey: formKey,
      children: [
        const SizedBox(
          height: 5,
        ),
        CampText(
          text: "E-mail",
          image: "assets/images/man.png",
          //credentials: credentials,
        ),
        CampText(
          text: "Senha",
          image: "assets/images/lock.png",

          //credentials: credentials,
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Align(
            alignment: const Alignment(1, 0),
            child: Text(
              "Testando",
              style: GoogleFonts.ovo(
                fontSize: 10,
                textStyle: const TextStyle(
                  color: Color(0xFFB30000),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
