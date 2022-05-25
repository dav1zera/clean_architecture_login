import 'package:clean_login/app/commons/presentation/widgets/container_box.dart';
import 'package:clean_login/app/commons/presentation/widgets/text_form_field.dart';

import 'package:clean_login/app/modules/login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxFormLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginController controller;

  const BoxFormLogin({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
              controller: controller.store.emailLogin,
            ),
            const SizedBox(
              height: 8,
            ),
            CampText(
              text: "Senha",
              image: "assets/images/lock.png",
              obscureText: true,
              controller: controller.store.passwordLogin,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Align(
                alignment: const Alignment(1, 0),
                child: Text(
                  controller.store.statusDescription ?? "",
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
      },
    );
  }
}
