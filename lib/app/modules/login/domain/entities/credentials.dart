import 'package:string_validator/string_validator.dart';

class Credentials {
  final String email;
  final String password;
  final String? name;

  Credentials({this.name, required this.email, required this.password});

  bool get isEmailValid => isEmail(email);
  bool get isPasswordValid =>
      RegExp(r'(?:\d+[a-z]|[a-z]+\d)[a-z\d]*').hasMatch(password);
  bool get isNameValid =>
      name!.isNotEmpty &&
      name!.length <= 2 &&
      RegExp('[a-zA-Z]').hasMatch(name!);
}
