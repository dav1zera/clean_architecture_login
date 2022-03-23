import 'package:clean_login/app/commons/widgets/text_form_field.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../commons/widgets/container_box.dart';

class BoxFormAdress extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final AdressController controller;
  const BoxFormAdress({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  @override
  State<BoxFormAdress> createState() => _BoxFormAdressState();
}

class _BoxFormAdressState extends State<BoxFormAdress> {
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
          formKey: widget.formKey,
          height: 140.0,
          children: [
            const SizedBox(
              height: 5,
            ),
            CampText(
              width: MediaQuery.of(context).size.width * 0.3,
              text: "CEP",
              controller: widget.controller.store.cepTextController,
              onChanged: widget.controller.onChangedCep,
              inputFormatters: [maskFormatterCep],
              onTap: () {
                setState(
                  () {
                    widget.controller.store.hasError = false;
                  },
                );
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
                  controller: widget.controller.store.ruaTextController,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CampText(
                    text: "Num",
                    controller: widget.controller.store.numTextController,
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
                  controller: widget.controller.store.bairroTextController,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CampText(
                    text: "Complemento",
                    controller: widget.controller.store.compleTextController,
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
              controller: widget.controller.store.cidadeTextController,
            ),
            const SizedBox(
              height: 4,
            ),
            if (widget.controller.store.hasError)
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
