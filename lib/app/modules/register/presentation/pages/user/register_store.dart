import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

@Injectable()
class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
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
