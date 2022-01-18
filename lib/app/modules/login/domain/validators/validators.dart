import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';

class Validators {
  final Credentials credentials;

  Validators(this.credentials);

  String getStatusDescription() {
    return (credentials.isEmailValid == null ||
            credentials.isPasswordValid == null)
        ? " "
        : credentials.isEmailValid && credentials.isPasswordValid
            ? "Credenciais válidas."
            : "Credenciais inválidas";
  }
}
