import 'package:clean_login/app/commons/widgets/urban_image.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_controller.dart';
import 'package:clean_login/app/modules/register/presentation/widgets/box_form_adress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../commons/widgets/custom_button.dart';
import '../../../../../commons/widgets/screen_image.dart';

class AdressPage extends StatefulWidget {
  final String uid;
  final double? height;
  const AdressPage({
    Key? key,
    required this.uid,
    this.height,
  }) : super(key: key);

  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends ModularState<AdressPage, AdressController> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.uid = widget.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF539FCB),
      body: ValueListenableBuilder(
        valueListenable: controller.store.isLoading,
        builder: (context, bool isloading, child) {
          if (isloading == true) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          }

          return ListView(
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
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Endereço",
                  style: GoogleFonts.neuton(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              BoxFormAdress(
                formKey: formKey,
                controller: controller,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomButton(
                text: "Finalizar",
                onPressed: () {
                  controller.onTapRegisterAdress(context);
                },
              ),
              const UrbanImage(image: "assets/images/urban.png"),
            ],
          );
        },
      ),
    );
  }
}
