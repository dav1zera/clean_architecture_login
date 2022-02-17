import 'package:clean_login/app/core/stores/auth_store.dart';
import 'package:clean_login/app/modules/register/presentation/register_store.dart';
import 'package:mobx/mobx.dart';

abstract class RegisterController with Store {
  final AuthStore authStore;
  final RegisterStore store;

  RegisterController(this.authStore, this.store);
}
