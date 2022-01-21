import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:clean_login/app/core/errors/errors.dart';
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
  final LoginRepository repository;

  LoginRepositoryImpl(this.datasource, this.repository);
  @override
  Future<Either<Failure, UserInfoData>> executeLoginEmail(
      {required Credentials credentials}) async {
    try {
      var user = await datasource.executeLoginEmail(credentials: credentials);
      return Right(user);
    } catch (e) {
      return Left(
          FailedExecuteLogin(message: FailureMessages.Error_Execute_Login));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: FailureMessages.Failed_To_Logout));
    }
  }

  @override
  Future<Either<Failure, UserInfoData>> currentUser() async {
    try {
      var user = await datasource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: FailureMessages.Failed_To_Recover_User_Logged));
    }
  }
}
