import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl implements Logout {
  final LoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}
