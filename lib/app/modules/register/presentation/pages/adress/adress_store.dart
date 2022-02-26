import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

abstract class AdressStore with Store {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool hasError = false;
  TextEditingController ruaTextController = TextEditingController();
  TextEditingController cepTextController = TextEditingController();
  TextEditingController bairroTextController = TextEditingController();
  TextEditingController cidadeTextController = TextEditingController();
  TextEditingController numTextController = TextEditingController();
  TextEditingController compleTextController = TextEditingController();

  @observable
  String? statusDescription;
}
