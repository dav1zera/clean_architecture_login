import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:clean_login/app/commons/infra/mappers/user_mapper.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_login/app/modules/login/infra/datasource/login_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_repository_impl.g.dart';

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserEntity>> executeLoginEmail({
    required Credentials credentials,
  }) async {
    try {
      final userModel =
          await datasource.executeLoginEmail(credentials: credentials);
      final userEntity = UserMapper.toEntity(userModel);
      return Right(userEntity);
    } catch (e) {
      return Left(
        FailedExecuteLogin(message: FailureMessages.Error_Execute_Login),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(
        ErrorLogout(message: FailureMessages.Failed_To_Logout),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try {
      final userModel = await datasource.currentUser();
      final userEntity = UserMapper.toEntity(userModel);
      return Right(userEntity);
    } catch (e) {
      return Left(
        ErrorGetLoggedUser(
            message: FailureMessages.Failed_To_Recover_User_Logged),
      );
    }
  }
}
