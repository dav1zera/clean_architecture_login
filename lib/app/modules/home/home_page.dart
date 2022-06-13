import 'package:clean_login/app/commons/presentation/keys/keys.dart';
import 'package:clean_login/app/commons/presentation/widgets/custom_button.dart';
import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:clean_login/app/modules/home/presentation/widgets/box_form_home.dart';
import 'package:clean_login/app/modules/home/presentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getInfoUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF539FCB),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          ProfileImage(
            image:
                "https://firebasestorage.googleapis.com/v0/b/loginfirebase-60979.appspot.com/o/pp.jpg?alt=media&token=5ab9cb8a-8617-4bfe-a7b2-477c006ea4ee",
          ),
          Center(
            child: Text(
              "Olá ${controller.authStore.user?.name}",
              style: GoogleFonts.neuton(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "Suas informações:",
              style: GoogleFonts.neuton(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
          BoxFormWelcome(
            controller: controller,
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            key: Key(logoutButton),
            text: "Deslogar",
            onPressed: () {
              controller.onTapLogout();
            },
          ),
        ],
      ),
    );
  }
}
