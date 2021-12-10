import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserInfoData>> executeLoginEmail();
  Future<Either<Failure, UserInfoData>> loggedUser();
  Future<Either<Failure, Unit>> logout();
}
