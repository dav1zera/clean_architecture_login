import 'package:clean_login/app/core/errors/errors.dart';

class ErrorLoginEmail extends Failure {
  final String message;

  ErrorLoginEmail({required this.message});
}

class ErrorGetLoggedUser extends Failure {
  final String message;
  ErrorGetLoggedUser({required this.message});
}

class ErrorCancelledByUser extends Failure {
  final String message;
  ErrorCancelledByUser({required this.message});
}

class ErrorLogout extends Failure {
  final String message;
  ErrorLogout({required this.message});
}

class FailedExecuteLogin extends Failure {
  final String message;

  FailedExecuteLogin({required this.message});
}
