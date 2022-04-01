import 'package:clean_login/app/commons/widgets/text_form_field.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../commons/widgets/container_box.dart';

// ignore: must_be_immutable
class BoxFormAdress extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AdressController controller;
  BoxFormAdress({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  var maskFormatterCep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ContainerBox(
          formKey: formKey,
          height: 140.0,
          children: [
            const SizedBox(
              height: 5,
            ),
            CampText(
              width: MediaQuery.of(context).size.width * 0.3,
              text: "CEP",
              controller: controller.store.cepTextController,
              onChanged: controller.onChangedCep,
              inputFormatters: [maskFormatterCep],
              onTap: () {
                () {
                  controller.store.hasError = false;
                };
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CampText(
                  width: MediaQuery.of(context).size.width * 0.6,
                  text: "Rua",
                  controller: controller.store.ruaTextController,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CampText(
                    text: "Num",
                    controller: controller.store.numTextController,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                CampText(
                  width: MediaQuery.of(context).size.width * 0.5,
                  text: "Bairro",
                  controller: controller.store.bairroTextController,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CampText(
                    text: "Complemento",
                    controller: controller.store.compleTextController,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CampText(
              width: MediaQuery.of(context).size.width * 0.6,
              text: "Cidade",
              controller: controller.store.cidadeTextController,
            ),
            const SizedBox(
              height: 4,
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
            ),
            if (controller.store.hasError)
              Text(
                "Cep inválido",
                style: GoogleFonts.ovo(
                  fontSize: 10,
                  textStyle: TextStyle(
                    color: Color(
                      0xFFB30000,
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
