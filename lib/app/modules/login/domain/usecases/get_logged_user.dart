import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'get_logged_user.g.dart';

abstract class GetLoggedUserUseCase {
  Future<Either<Failure, UserEntity>> call();
}

@Injectable(singleton: false)
class GetLoggedUserUseCaseImpl implements GetLoggedUserUseCase {
  final LoginRepository repository;

  GetLoggedUserUseCaseImpl(this.repository);
  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await repository.currentUser();
  }
}
