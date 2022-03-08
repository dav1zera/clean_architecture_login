import 'package:clean_login/app/commons/widgets/screen_image.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../commons/widgets/custom_button.dart';
import '../../../../../commons/widgets/urban_image.dart';
import '../../widgets/box_form_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Cadastro",
                style: GoogleFonts.neuton(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 17.0, left: 13.0),
            child: BoxFormRegister(
              formKey: formKey,
              controller: controller,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(
            text: "Próximo",
            onPressed: () {
              setState(() {
                formKey.currentState?.validate();
              });
              controller.onTapRegister(context);
            },
          ),
          const UrbanImage(
            image: "assets/images/urban.png",
          )
        ],
      ),
    );
  }
}
