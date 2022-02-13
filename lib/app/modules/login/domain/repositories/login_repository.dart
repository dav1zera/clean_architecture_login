import 'package:clean_login/app/commons/domain/entities/user_data.dart';
import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';

import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> executeLoginEmail(
      {required Credentials credentials});
  Future<Either<Failure, UserEntity>> currentUser();
  Future<Either<Failure, Unit>> logout();
}
