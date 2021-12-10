import 'package:clean_login/app/modules/login/datasource/login_datasource.dart';
import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_login/app/modules/login/domain/sucess/messages.dart';
import 'package:clean_login/app/modules/login/domain/sucess/sucess.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource datasource;
  final LoginRepository repository;

  LoginRepositoryImpl(this.datasource, this.repository);
  @override
  Future<Either<Failure, UserInfoData>> executeLoginEmail() async {
    try {
      var user = await datasource.executeLoginEmail();
      return Right(user);
    } catch (e) {
      return Left(
          SucessLoginEmail(message: SucessMessages.Successfully_logged_User));
    }
  }

  @override
  Future<Either<Failure, UserInfoData>> loggedUser() async {
    try {
      var user = await datasource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: FailureMessages.FAILED_TO_RECOVER_USER_LOGGED));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: FailureMessages.FAILED_TO_LOGOUT));
    }
  }
}
