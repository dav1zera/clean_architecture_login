import 'package:string_validator/string_validator.dart';

class Credentials {
  final String email;
  final String password;

  Credentials({required this.email, required this.password});

  bool get isEmailValid => isEmail(email);
  bool get isPasswordValid =>
      RegExp(r'(?:\d+[a-z]|[a-z]+\d)[a-z\d]*').hasMatch(password);
}
