import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

abstract class RegisterStore with Store {
  bool isValidEmailRegister = false;
  bool isValidPasswordRegister = false;
  bool isValidNameRegister = false;

  TextEditingController emailRegister = TextEditingController();
  TextEditingController passowordRegister = TextEditingController();
  TextEditingController nameRegister = TextEditingController();
  String? userId;

  @observable
  String? statusDescription;
}
