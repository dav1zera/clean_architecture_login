import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class CreateUserEmailUseCase {
  Future<Either<Failure, UserEntity>> call();
}

class CreateUserEmailUseCaseImpl implements CreateUserEmailUseCase {
  @override
  Future<Either<Failure, UserEntity>> call() {
    throw UnimplementedError();
  }
}
