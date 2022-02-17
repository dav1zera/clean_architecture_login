import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../commons/domain/entities/user_entity.dart';
import '../../../../core/errors/errors.dart';

abstract class RegisterRepository {
  //createUserEmail
  Future<Either<Failure, UserEntity>> createUserEmail({
    required Credentials credentials,
  });
  Future<Either<Failure, AdressEntity>> getAdress();
  Future<Either<Failure, UserEntity>> currentUser();
}
