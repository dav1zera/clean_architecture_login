import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_login/app/modules/login/infra/datasource/login_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class GetLoggedUserUseCase {
  Future<Either<Failure, UserInfoData>> call();
}

@Injectable(singleton: false)
class GetLoggedUserUseCaseImpl implements GetLoggedUserUseCase {
  final LoginDataSource dataSource;
  final LoginRepository repository;

  GetLoggedUserUseCaseImpl(this.dataSource, this.repository);
  @override
  Future<Either<Failure, UserInfoData>> call() async {
    return await repository.currentUser();
  }
}
