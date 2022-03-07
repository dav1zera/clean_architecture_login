import 'package:clean_login/app/core/errors/errors.dart';

//Register Errors
class ErrorRegister extends Failure {
  @override
  final String message;

  ErrorRegister({required this.message});
}

class ErrorGetRegisterUser extends Failure {
  @override
  final String message;

  ErrorGetRegisterUser({required this.message});
}

class ErrorCancelledByUser extends Failure {
  @override
  final String message;

  ErrorCancelledByUser(this.message);
}

class FailedExecuteRegister extends Failure {
  @override
  final String message;

  FailedExecuteRegister({required this.message});
}

//Endereço Errors

class ErrorAdress extends Failure {
  @override
  final String message;

  ErrorAdress({required this.message});
}

class ErrorGetAdress extends Failure {
  @override
  final String message;

  ErrorGetAdress({required this.message});
}

class ErrorRegisterAdress extends Failure {
  @override
  final String message;

  ErrorRegisterAdress({required this.message});
}
