import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/infra/models/result_cep.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';

abstract class RegisterRepository {
  //createUserEmail
  Future<Either<Failure, String>> createUserEmail({
    required Credentials credentials,
  });
  Future<Either<Failure, AdressEntity>> getAdress({required String cep});
}
