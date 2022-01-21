import 'package:clean_login/app/commons/widgets/custom_button.dart';
import 'package:clean_login/app/commons/widgets/screen_image.dart';
import 'package:clean_login/app/commons/widgets/urban_image.dart';
import 'package:clean_login/app/modules/login/presentation/login_controller.dart';
import 'package:clean_login/app/modules/login/presentation/widgets/box_form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF539FCB),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const ScreenImage(
            image: "assets/images/screen.png",
          ),
          const SizedBox(
            height: 26,
          ),
          BoxFormLogin(
            formKey: formKey,
            controller: controller,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: "Login",
            onPressed: () {
              setState(
                () {
                  formKey.currentState?.validate();
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: "Cadastrar",
            onPressed: () => controller.loginWithEmail,
          ),
          const UrbanImage(
            image: "assets/images/urban.png",
          )
        ],
      ),
    );
  }
}
