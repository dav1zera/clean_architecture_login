import 'package:clean_login/app/commons/presentation/widgets/container_box.dart';
import 'package:clean_login/app/commons/presentation/widgets/text_form_field.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxFormRegister extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final RegisterController controller;
  const BoxFormRegister({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ContainerBox(
          height: 123.0,
          formKey: formKey,
          children: [
            const SizedBox(
              height: 5,
            ),
            CampText(
              text: "Nome",
              image: "assets/images/name.png",
              controller: controller.store.nameRegister,
            ),
            const SizedBox(
              height: 8,
            ),
            CampText(
              text: "Email",
              image: "assets/images/mail.png",
              controller: controller.store.emailRegister,
            ),
            const SizedBox(
              height: 8,
            ),
            CampText(
              text: "Senha",
              image: "assets/images/lock.png",
              controller: controller.store.passowordRegister,
              obscureText: true,
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
