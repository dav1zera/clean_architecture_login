import 'package:clean_login/app/core/errors/errors.dart';

class UserNotFound extends Failure {
  @override
  final String message;

  UserNotFound({required this.message});
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String message;

  ErrorGetLoggedUser({required this.message});
}

class ErrorLogout extends Failure {
  @override
  final String message;

  ErrorLogout({required this.message});
}
