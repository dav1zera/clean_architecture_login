import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

abstract class RegisterStore with Store {
  bool isValidEmailRegister = false;
  bool isValidPasswordRegister = false;
  bool isValidNameRegister = false;

  TextEditingController emailRegister = TextEditingController();
  TextEditingController passowordRegister = TextEditingController();
  TextEditingController nameRegister = TextEditingController();
  String? userId;
  TextEditingController ruaTextController = TextEditingController();
  TextEditingController cepTextController = TextEditingController();
  TextEditingController bairroTextController = TextEditingController();
  TextEditingController cidadeTextController = TextEditingController();
  TextEditingController numTextController = TextEditingController();
  TextEditingController compleTextController = TextEditingController();
}
