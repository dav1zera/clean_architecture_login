import 'package:clean_login/app/commons/domain/errors/errors.dart';

class UserNotFound extends Failure {
  @override
  final String message;

  UserNotFound({required this.message});
}

class ErrorGetCurrentUser extends Failure {
  @override
  final String message;

  ErrorGetCurrentUser({required this.message});
}

class ErrorLogout extends Failure {
  @override
  final String message;

  ErrorLogout({required this.message});
}
