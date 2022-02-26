import 'package:clean_login/app/commons/widgets/text_form_field.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_controller.dart';
import 'package:flutter/material.dart';

import 'package:clean_login/app/commons/widgets/container_box.dart';

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
    return ContainerBox(
      height: 82.0,
      formKey: formKey,
      children: const [
        SizedBox(
          height: 5,
        ),
        CampText(
          text: "Nome",
          image: "assets/images/name.png",
        ),
        SizedBox(
          height: 8,
        ),
        CampText(
          text: "Email",
          image: "assets/images/mail.png",
        ),
        SizedBox(
          height: 8,
        ),
        CampText(
          text: "Senha",
          image: "assets/images/lock.png",
          obscureText: true,
        )
      ],
    );
  }
}
