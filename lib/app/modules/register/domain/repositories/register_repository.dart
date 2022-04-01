import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/domain/infra/user_model.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';

abstract class RegisterRepository {
  //createUserEmail
  Future<Either<Failure, UserEntity>> createUserEmail({
    required Credentials credentials,
  });
  Future<Either<Failure, AdressEntity>> getAdress({
    required String cep,
  });

  Future<Either<Failure, Unit>> registerAdress({
    required AdressEntity adressEntity,
    required String uid,
  });
}
