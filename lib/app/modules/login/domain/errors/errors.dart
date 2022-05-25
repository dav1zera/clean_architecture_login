import 'package:clean_login/app/commons/domain/errors/errors.dart';

class ErrorLoginEmail extends Failure {
  @override
  final String message;

  ErrorLoginEmail({
    required this.message,
  });
}

class ErrorSplashScreen extends Failure {
  @override
  final String message;

  ErrorSplashScreen({required this.message});
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String message;
  ErrorGetLoggedUser({required this.message});
}

class ErrorSignOut extends Failure {
  @override
  final String message;
  ErrorSignOut({required this.message});
}

class ErrorLogout extends Failure {
  @override
  final String message;
  ErrorLogout({required this.message});
}

class FailedExecuteLogin extends Failure {
  @override
  final String message;

  FailedExecuteLogin({required this.message});
}
